# 转录组测序(RNA-seq)

> [!NOTE]
> 转录组(transcriptome)
> "A transcriptome is a collection of all the transcripts present in a given cell." (NHGRI factsheet, NIH, US)
> The transcriptome is the set of all RNA molecules, including mRNA, rRNA, tRNA, and other non-coding RNA produced in one or a population of cells.

* Basic RNA-seq processing: unix tools and IGV (http://bio.lundberg.gu.se/courses/vt13/rnaseq.html)

## 实验流程
### RNA-seq建库流程
1. RNA (light blue) is first extracted,提取所有的mRNA或total RNA
2. DNA contamination is removed using DNase, 用DNase去除DNA（在RNA建库流程中，DNA被认为是污染物）
    * 可选过程：去除rRNA/选择mRNA
3. The remaining RNA is broken up into short fragments, 将RNA打断成短片段（二代测序读长问题）
4. RNA fragments are then reverse transcribed into cDNA (yellow), 将RNA片段逆转录为cDNA
    * 可选过程：链特异性选择
5. Sequencing adaptors (blue) are ligated, 连接adapter 
    * 可选过程：PCR扩增
6. fragment size selection is undertaken, 选择合适长度的cDNA
7. The ends of cDNAs are sequenced using next generation sequencing technologies to produce many short reads, 进行测序
    * 可选过程：单端测序或双端测序

![The data generation of a typical RNA-seq experiment](http://www.ligene.cn/images/book/RNA-seq-library.png)
参考文献：https://www.nature.com/articles/nrg3068

## 数据分析 
经典的RNA-seq数据分析流程为先使用TopHat进行测序短序列映射后，再使用Cufflinks进行转录本的组装与丰度估计(图1)。
![Overview of Cuffliniks](http://www.ligene.cn/images/book/Cufflinks-pipeline.png)
Overview of Cuffliniks [3]
* (a) The algorithm takes as input cDNA fragment sequences that have been aligned to the genome by software capable of producing spliced alignments, such as TopHat.
* (b-e) With paired-end RNA-Seq, Cufflinks treats each pair of fragment reads as a single alignment. The algorithm assembles overlapping 'bundles' of fragment alignments (b,c) separately, which reduces running time and memory use, because each bundle typically contains the fragments from no more than a few genes. Cufflinks the estimates the abundances of the assembled transcripts (d,e).

## 基因注释文件

### GFF格式
gff全称为general feature format(通用特征格式)。GFF文件是一种用来描述基因组特征的纯文本文件，由9列数据组成，每一列代表序列的一个不同的特征。列是通过制表符分隔的。GFF文件有不同的版本，目前基本使用第三版（gff3）。
GFF文件的第一行包含一个文本标题##gff-version3。紧接着下面以#号开头的各行还可以包含描述性的文本，如文件、来源、版本号、注释、参考文献等。
在描述行之后，由9列数据组成，前8列在gff的各个版本中信息都是相同的，只是名称不同，第9列attributes的内容存在很大的版本特异性。
> seqid source type start end score strand strand attributes

以gff3为例，这9列信息分别是：
* seqid：参考序列的id，如1号染色体
* source：生成此注释的来源。如果未知，则用点（.）代替。一般指明产生此gff3文件的软件或方法。
* type：序列类型，此处的名词是相对自由的，建议使用符合SO(sequenceontology)惯例的名称，如gene，repeat_region，exon，CDS等。
* start：开始位点，按照坐标系统表示，从1开始计数（区别于bed文件从0开始计数）。
* end：结束位点。
* score：得分，对于一些可以量化的属性，可以设置一个数值以表示程度的不同。如果为空，用点（.）代替。
* strand：“＋”表示正链，“－”表示负链，“.”表示不需要指定正负链。
* phase：相位。对于编码蛋白质的CDS来说，本列指定下一个密码子开始的位置。可以是0、1或2，表示到达下一个密码子需要跳过的碱基个数。
* attributes：序列属性。一个包含众多属性的列表，格式为“标签＝值”（tag=value），不同属性之间以分号相隔。每个标签是一个属性，并被赋予一个值，可以使用多个标签。

另外，在基因结构注释gff文件中，基因包含mRNA，mRNA包含exon, CDS, UTR等信息，同时在注释文件中除基因行外，其他行在第9列会通过Parent指明该行从属的上一级ID，也就是一个基因的gene行、mRNA行、CDS行、exon行都会通过Parent层层关联在一起。具体的描述可以在www.sequenceontology.org/gff3.shtml上查看GFF规范。
![GFF3 format](http://www.ligene.cn/images/book/GFF3.png)

### GTF和GFF格式文件
GFF(General Feature Format)格式是一种简单、方便地对DNA、RNA及蛋白质序列的特征进行描述的一种数据格式，已经成为序列注释的通用格式。当前广泛使用的GFF格式为第3版，即GFF3。
GTF(Gene Transfer Format)格式主要用于对基因进行注释的数据格式，当前广泛使用的GTF格式为第2版，即GTF2。
GFF与GTF这两种格式的文件可以相互转换，它们的前8列是相同的，第9列虽然都是记录标签与值配对的情况，但是两者有所不同，在GTF文件中标签与值之间以空格分隔，并且每个特征之后都带有分号“；”(包括最后一个特征)。

| |GTF2|GFF3|
|:---|:---|:---|
|特征类型|必须注明|可以任意名称|
|属性|标签和值以空格分隔|标签和值以"="分隔|

GTF和GFF格式文件可以使用Cufflinks的工具gffread进行转换，代码如下：
```
#GFF文件转换成GTF
gffread my.gff3 -T -o my.gtf 
#GTF文件转换成GFF文件
gffread merged.gtf -o- > merged.gff3
```

## References
1. Madlung, A. Assessing an Effective Undergraduate Module Teaching Applied Bioinformatics to Biology Students. PLOS Computational Biology 2018, 14 (1), e1005872. https://doi.org/10.1371/journal.pcbi.1005872.
2. Trapnell, C.; Roberts, A.; Goff, L.; Pertea, G.; Kim, D.; Kelley, D. R.; Pimentel, H.; Salzberg, S. L.; Rinn, J. L.; Pachter, L. Differential Gene and Transcript Expression Analysis of RNA-Seq Experiments with TopHat and Cufflinks. Nature Protocols 2012, 7 (3), 562–578. https://doi.org/10.1038/nprot.2012.016.
3. Trapnell, C., Williams, B., Pertea, G. et al. Transcript assembly and quantification by RNA-Seq reveals unannotated transcripts and isoform switching during cell differentiation. Nat Biotechnol 28, 511–515 (2010). https://doi.org/10.1038/nbt.1621
4. Blaiseau, P.L., Holmes, A.M. Diauxic Inhibition: Jacques Monod's Ignored Work. J Hist Biol 54, 175–196 (2021). https://doi.org/10.1007/s10739-021-09639-4