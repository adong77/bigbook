## 16S rDNA扩增子数据分析实践
本16S rRNA基因扩增子测序数据分析流程包括：首先对样本测序数据进行质控与预处理；然后得到样本的OTU聚类与物种分类信息；在查看样品的细菌种类后，统计每个样品的差异菌种。
* Please note that QIIME1 and the 97% OTU-based workflow has been superseded by ASVs (100% OTUs) and the QIIME2 workflow! 

### 1. 流程相关软件安装
本分析流程需要安装QIIME、VSEARCH等软件，测试Linux系统为Ubuntu 16.04LTS。
### (1) 安装Linux常用工具
```
$sudo apt-get install build-essential	#Linux基础开发工具
$sudo apt-get install python-minimal python-dev python-tk 
$sudo apt-get install python-pip  #可用pip安装python包
$python --version
```
如果python不是python2.7，请设置python2为默认版本：alias python=’/usr/bin/python2’(可把此命令写入~/.bashrc文件中)。

### (2) 安装QIIME
```
$sudo pip install --upgrade pip -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
$sudo pip install numpy==1.10.0 -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
$sudo pip install matplotlib==1.5.3 -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
$sudo pip install scipy==1.0.0 -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
$sudo pip install ipython==5.5.0 -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
$sudo pip install pandas==0.21.1 -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
$sudo pip install biom-format==2.1.4 -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
$sudo pip install qiime -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
```
测序QIIME安装是否成功:
`$print_qiime_config.py -t`
注：在WSL下能运行并打印QIIME相关配置信息，但会报错，不影响QIIME正常使用
* 安装qiime时停止不动，可试一下或反复运行几次这条安装命令:
`sudo pip install qiime -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com  --extra-index-url http://mirrors.aliyun.com/pypi/simple`


### (3) 安装VSEARCH
```
$git clone https://github.com/torognes/vsearch.git
$cd vsearch
$./autogen.sh
$./configure
$make
$sudo make install  #默认安装在/usr/local/bin/目录
$sudo cp /usr/local/bin/vsearch /usr/local/bin/usearch61 #让qiime的参数usearch61使用vsearch程序
```
#安装VSEARCH遇到问题：./autogen.sh:autoreconf: Not found
`sudo apt-get install autoconf` 

### (4) 安装ClustalW或Muscle
```
$sudo apt-get install clustalw
$sudo apt-get install muscle
```

### (5) 安装RDP classifier
先下载RDP Classifier v2.2(只有此版本能用)，下载网址：https://sourceforge.net/projects/rdp-classifier/files/rdp-classifier/，
再将其解压到windows系统的D盘根目录，并复制到Ubuntu系统的用户home目录：
```
$mv /mnt/d/rdp_classifier_2.2/  ~/
$echo "export RDP_JAR_PATH=~/rdp_classifier_2.2/rdp_classifier-2.2.jar" >> ~/.bashrc
$source ~/.bashrc
```
RDP classifier是一个Java程序，还需要安装JRE：
`$sudo apt install default-jre #安装Java运行环境(JRE)`

### (6) 安装Xming可运行X-windows图形程序
下载安装包Xming-setup.exe（版本6.9.0.31），Xming官网：http://sourceforge.net/projects/xming/。
安装完后，再ubuntu内设置显示参数：
```
$echo "export DISPLAY=:0.0" >> ~/.bashrc #设置X图形显示端口
$source ~/.bashrc
```

### 2. 流程运行命令
此流程所有命令都需在WSL-Ubuntu的bash终端下运行（以下命令前面的“$”代表bash提示符，不需要输入）。运行Ubuntu之前，先在电脑C盘创建目录win16s，并将样本测序数据文件(raw_reads.zip)，mapping.txt，参考序列文件(rdp_gold.fa)与参数设置文件(qiime_params.txt)复制到此目录下。
注意：所有输入文件名及目录，根据自己保存的文件进行调整。

#### (1)准备测序数据(raw reads) 
本实验需要把所有原始数据放在一个文件夹，一个样品的双端测序有两个reads文件，默认以"_R1"与"_R2"分别代表正向与反向测序reads。测序公司提供的数据一般已去除barcode和primer序列。
```
$cd /mnt/c/win16s/		#切换到工作目录
$unzip raw_reads.zip
$ls raw_reads
显示文件列表，如SAA_R1.fastq.gz, SAA_R2.fastq.gz等，如果文件名不是以"_R1"与"_R2"分别代表正向与反向测序reads，需要重新命名。
```
#### (2)准备mapping file
mapping文件包含每个16S测序样本的信息，其必须的列名（项）如下：
`#sampleID    BarcodeSequence    LinkerPrimerSequence    Description`
* 注意：每项内不能出现空格, 间隔是以TAB键隔开。如果没有BarcodeSequence与LinkerPrimerSequennce信息可以为空。

LinkerPrimerSequence与Description之间可以有任意项来说明样本的额外信息。如要修改可用Excel打开mapping.txt，按样本名称修改或添加相应内容，再保存为txt格式即可。
本测序数据样本的mapping file如下：
```
#SampleID	BarcodeSequence	LinkerPrimerSequence    PRIMER	Group	Description
SAA	ACGAGTGCGTA	GAGTTTGATCMTGGCTC 8F	diet	SAA
SAB	AGACGCACTCA	GAGTTTGATCMTGGCTC 8F	fat	SAB
```
这里SampleID项对应于前面测序reads文件名的前三个字母， Group是样本的分组信息, PRIMER是16S引物名称。
修改mapping.txt后执行以下命令检查是否有问题：
`$validate_mapping_file.py -m mapping.txt -o validate_map`
在Wiondows资源管理器下打开输出目录validate_map中的mapping.html文件查看检查信息，并根据错误提示修改mapping文件。如果没有BarcodeSequence与LinkerPrimerSequennce信息，可忽略Barcode与Primer序列为空的错误提示。

#### (3)合并双端序列
如果样品数量较小，可以对每个样品分别进行合并，一次合并一个样品的两端测序数据：
```
$mkdir  join_pe_reads
$vsearch --fastq_mergepairs raw_reads/SAA_R1.fastq.gz --reverse raw_reads/SAA_R2.fastq.gz --fastqout join_pe_reads/SAA.fq
Merging reads 100%
     28741  Pairs
     19633  Merged (68.3%)
      9108  Not merged (31.7%)
```
如果样品数量较多，也可用以下shell脚本一次合并多个样品数据：
```
$for i in `tail -n+2 mapping.txt |cut -f 1`; do vsearch --fastq_mergepairs raw_reads/${i}_R1.fastq.gz --reverse raw_reads/${i}_R2.fastq.gz --fastqout join_pe_reads/${i}.fq ; done
```
#### (4)序列质量控制
一般可先用FastQC检查测序reads的质量信息，注意测序reads长度。16S rRNA v3-v4区片段大约为400bp左右，这里将合并后reads长度< 380 bp的reads都过滤掉。
```
$mkdir qual_filter
$vsearch --fastx_filter join_pe_reads/SAA.fq --fastq_maxee 1.0 --fastq_minlen 380 --fastqout join_pe_reads/SAA_filter.fq
```
如果有多个样品数据，可直接copy下面命令到terminal执行：
```
$for i in `tail -n+2 mapping.txt |cut -f 1`; do vsearch --fastx_filter join_pe_reads/${i}.fq --fastq_maxee 1.0 --fastq_minlen 380 --fastqout qual_filter/${i}.fq ; done
```

#### (5)割库(split libraries)
此步骤将所有样本的序列数据合并成到一个文件，并以样品名区分样品序列。
```
$mkdir split_library
$multiple_split_libraries_fastq.py -i qual_filter/ -o split_library/ --demultiplexing_method sampleid_by_file
```
输出文件为 seqs.fna，每条序列的ID按来源的样品重命名，头行还包括纠正barcode错误(bc_diffs)等信息。
此命令运行的概要信息可以查看输出文件split_library_log.txt，包含样品的reads数量，低质量reads过滤结果等。

#### (6)Dereplication(序列去重复)
`$vsearch --derep_fulllength split_library/seqs.fna --output split_library/seqs_derep.fa --sizeout --minuniquesize 2`

#### (7)嵌合体检测
嵌合子的产生主要是由于PCR过程中模版的不完全延伸。这一步是去除嵌合子，一般需要参考序列文件：
`$vsearch --uchime_ref split_library/seqs_derep.fa --db rdp_gold.fa --nonchimeras seqs_nochimeras.fa `
如果没有参考序列，VSEARCH也可以进行去嵌合体：
`$vsearch --uchime_denovo split_library/seqs_derep.fa --nonchimeras seqs_nochimeras.fa`

#### (8)OTU聚类(OTU clustering) 
OTU (operational taxonomic units)是人为给某一个分类单元(科、属、种等)设置的标志。通常按照97%的相似性阈值将序列划分为不同的OTU，每一个OTU通常被认为是一个微生物物种。最后每个OTU簇选取最长的一条序列作为OTU的代表。
`$vsearch --cluster_fast seqs_nochimeras.fa --id 0.97 --centroids otus.fa --relabel OTU_ --sizein --sizeout `
以序列最小相似度97%聚类，得到Clusters: 121

#### (9)物种分类注释
QIIME 采用RDP classifier 将OTU注释为不同水平的物种分类。
`$assign_taxonomy.py -i otus.fa -m rdp -o taxonomy`
注意：分类数据库可以采用GreenGenes (http://greengenes.secondgenome.com/)、Silva (https://www.arb-silva.de/)和RDP (http://rdp.cme.msu.edu/)。这里采用Ribosomal Database Project classifier与Greengenes 数据库（13_8版本）。 

#### (10)生成OTU表格
* 1) Map reads back to the OTU data：
`$vsearch --usearch_global split_library/seqs.fna --db otus.fa --strand plus --id 0.97 --otutabout otus_table.txt`

* 2) Convert otus_table.txt to otu-table.biom:
```
$biom convert -i otus_table.txt -o otus_table.biom --to-hdf5 --table-type "OTU table"
$biom add-metadata -i otus_table.biom -o otus_table_tax.biom --observation-metadata-fp taxonomy/otus_tax_assignments.txt --sc-separated taxonomy --observation-header OTUID,taxonomy
```
* 也可以用QIIME的脚本生成OTU表：
`make_otu_table.py -i otus_table.txt -t taxonomy/otus_tax_assignments.txt -o otus_table1.biom`

#### (11)检查OTU Table
`$biom summarize-table -i otus_table_tax.biom -o summary_biom.txt`
记录样本测序数据量最少的read Counts数(此处为Min：11640），用于后续的统计抽样（步骤15中的-e参数）。
* 关于OTU表的更多检查问题参见后面注释(Notes)部分。

#### (12)可视化 
运行可视化命令前，电脑要先运行Xming软件。
Plot relative abundance for all samples:
`$summarize_taxa_through_plots.py -i otus_table_tax.biom -m mapping.txt -o taxa_summary`
输出文件存放在目录taxa_summary，其中图形信息放在目录taxa_summary_plots，可用浏览器打开bar_charts.html文件查看各个样本自门水平(L2)到属水平(L6)分类水平的菌株组成分布信息。
从上到下分别列出5个分类水平门到属的柱状图，每个柱状图下面是对应的数据表，表中分类(Taxonomy)的字母分别代表不同分类水平：k=kingdom, p=phylum, c=class, o=order, f=family, g=genus.
![taxa_bar_plots.png](https://raw.githubusercontent.com/adong77/ligene/master/imageBed/book/taxa_plots.png)
图 1 样品的菌群分类与相对丰度 (A)门水平； (B)属水平

#### (13) Align sequences on QIIME using the ClustalW or muscle method
`$align_seqs.py -i otus.fa -m clustalw -o rep_set_align`

#### (14) Make the reference tree on QIIME
`$make_phylogeny.py -i rep_set_align/otus_aligned.fasta -o rep_set.tre`

#### (15) 多样性分析(diversity analyses)
多样性分析有Alpha diversity与Beta diversity。Run diversity analyses on QIIME:
`$core_diversity_analyses.py -i otus_table_tax.biom -m mapping.txt -t rep_set.tre -e 11640 -o core_diversity -p qiime_params.txt`
参数“-e 11640”是用于均匀抽样和最大稀疏(rarefaction)深度的测序深度。由于测序技术的原因，不同样品的数据量有差异，因此不同的样品数据要先随机从每个样品中选择相同数目的reads (rarefy the data)进行标准化处理后才能进行样品间的比较。
下面列举几个特殊的分析命令：
* 1) Making PCoA plots:
`$make_2d_plots.py -i core_diversity/bdiv_even11640/weighted_unifrac_pc.txt -o pcoa_plot -m mapping.txt -b Group`
注：-i参数后输入文件所在目录的数字（11640）会随前面命令的-e参数变化。

* 2) 统计两组间的菌群差异：
`$compare_categories.py --method anosim -i core_diversity/bdiv_even11640/weighted_unifrac_dm.txt -m mapping.txt -c Group -o anosim_out -n 99`

--------
### 3. Notes：
* 1) 16S数据一般有许多noise，如嵌合体序列，低丰度的OTUs等。
下面的命令只过滤低频率的OTUs，过滤的标准是OTU总数在每个样品中都低于2(-min_count 2)，而且任何OTU只在少于25%的样品中有(-min_samples 3):
```
$filter_otus_from_otu_table.py -i otus_table_tax.biom -o otus_table_tax_filtered.biom  --min_count 2
#查看还剩下多少OTU？
$biom summarize-table -i otus_table_tax_filtered.biom
//Num observations: 199
```

* 2) 注意：如果发现有什么错误，可以先将biom文件转换成文本文件，再用Excel打开otu_table_tsv.txt修改，然后再转换成biom格式。
```
$biom convert -i otus_table_tax.biom -o otus_table_tsv.txt --table-type "OTU table" --to-tsv --header-key taxonomy
$biom convert -i otus_table_tsv.txt  -o otus_table_tsv.biom --table-type "OTU table" --to-hdf5 --table-type="OTU table" --process-obs-metadata taxonomy
```

**For more details about 16S rRNA analysis**, recommend following the tutorial: https://rachaellappan.github.io/16S-analysis/index.html 