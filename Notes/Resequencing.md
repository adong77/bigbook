0.准备阶段

conda install -c bioconda bwa #-c 即channel，下载生信软件都要加上-c bioconda software
conda install -c bioconda gatk4
事实上，对于构造重测序分析流程来说，以上这个四个工具就完全足够了。它们的安装都非常简单，除了BWA和Samtools由C编写的，安装时需要进行编译之外，另外两个只要保证系统中的java是1.8.x版本及以上的，那么直接下载jar包就可以使用了。

1.原始数据质控
这一部分考虑到现在公司给出的测序数据已经进行了质控，到我们手里基本都是clean data,网上关于质控的资源也比较多，基本上通过fastqc和fastp就可以进行质控和数据清洗。所以这里不再赘述。

2.数据预处理
需要先把这一大堆的短序列捋顺，一个个去跟该物种的 参考基因组【注】比较，找到每一条read在参考基因组上的位置，然后按顺序排列好，这个过程就称为测序数据的比对。
> 参考基因组：指该物种的基因组序列，是已经组装成的完整基因组序列，常作为该物种的标准参照物，比如人类基因组参考序列，fasta格式。

首先，我们需要为参考基因组的构建索引——这其实是在为参考序列进行Burrows Wheeler变换（wiki: 块排序压缩），以便能够在序列比对的时候进行快速的搜索和定位。
`$ bwa index genome.fasta #对基因组文件进行bwa索引`
这一步完成之后，我们就可以将read比对至参考基因组了：
`$ bwa mem -t 4 -R '@RG\tID:foo_lane\tPL:illumina\tLB:library\tSM:sample_name' /path/to/genome.fasta read_1.fq.gz read_2.fq.gz | samtools view -S -b > sample.bam`

这里的 < idxbase>要输入的是参考基因组的BW索引文件，我们上面通过bwa index构建好的那几个以human.fasta为前缀的文件便是；< in1.fq>和 [in2.fq]输入的是质控后的fastq文件。

> [Tips] BWA MEM比对模块是有一定适用范围的：它是专门为长read比对设计的，目的是为了解决，第三代测序技术这种能够产生长达几十kb甚至几Mbp的read情况。一般只有当read长度≥70bp的时候，才推荐使用，如果比这个要小，建议使用BWA ALN模块。


分析软件bwa、samtools、bcftools、annovar通过conda install安装。

bwa 得到sam文件

```

conda install bwa

bwa index /mnt/d/Desktop/S288C_genomic.fna

bwa mem /mnt/d/Desktop/S288C_genomic.fna /mnt/d/r_1.fq.clean.gz /mnt/d/r_2.fq.clean.gz > aln-pe.sam

```

···

samtools 得到bam、bcf文件

conda install samtools

···

samtools faidx /mnt/d/Desktop/S288C_genomic.fna #sam文件转换为bam文件

samtools view -bS -1 /mnt/d/Desktop/YEAST/aln-pe.sam > test.bam

samtools sort /mnt/d/Desktop/YEAST/test.bam -o test.sort.bam #bam文件排序

samtools index /mnt/d/Desktop/YEAST/test.sort.bam #为bam文件建立索引

samtools depth /mnt/d/Desktop/YEAST/test.sort.bam > depth.txt #测试参考基因组每个位点或一段区域的测序深度

samtools flagstat /mnt/d/Desktop/YEAST/test.sort.bam > stat.txt #统计比对结果

samtools rmdup /mnt/d/Desktop/YEAST/test.sort.bam nopcr.bam #去除PCR重复

samtools mpileup -gf /mnt/d/Desktop/YEAST/S288C_genomic.fna nopcr.bam > bwa.bcf #生成bcf文件

bcftools 基因变异检测，得到snps.bcf文件

conda install bcftools

bcftools call -vm /mnt/d/Desktop/YEAST/bwa.bcf -o variants.bcf

bcftools view -v snps,indels /mnt/d/Desktop/YEAST/variants.bcf > snps.vcf

bcftools filter -i 'QUAL>20 &&DP>5' /mnt/d/Desktop/YEAST/snps.vcf -o snps.filtered.vcf #变异位点过滤

作者：纤蹄马
链接：https://www.jianshu.com/p/faa6e1178020
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。