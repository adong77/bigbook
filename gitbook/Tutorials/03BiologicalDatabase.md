# Biological Databases

[TOC]

* NCBI Help Manual
https://www.ncbi.nlm.nih.gov/books/NBK3831/

### UCSC基因组浏览器的使用
UCSC基因组浏览器为用户提供方便查询各个物种基因组序列的途径，并支持对基因组信息进行可视化显示的在线工具。

#### UCSC基因组浏览器界面简介
在网页浏览器打开UCSC主页(http://genome.ucsc.edu/)，并点击菜单栏的Genome Brower就可以看到下面界面（图1）：

![UCSC Genome Browser](http://www.ligene.cn/images/UCSC-1.png)
图1. UCSC基因组浏览器界面

 UCSC基因组浏览器页面各部分的功能介绍如上图所示: 
* 上面是导航窗口，显示染色体位置与搜索框等；导航窗口的">"或"<"可以前后移动显示窗口的染色体位置，"1.5x", "3x"等按钮可以放大缩小显示染色体内容。
* 中间白色背景部分是查看注释信息的显示窗口; 可以选择下面各种注释信息,每个信息都显示为一个track.
* 最下面除了Mapping and Sequencing（比对和序列）外，还有其它功能框：基因与预测，表型与文献，比较基因组等。每个功能框又有多个数据源，如在Genes and Gene Predictions中就包括：GENCODE、RefSeq Genes等20个数据源，每个数据源都可以单击查看说明。每个数据源显示结果可以包括hide、dense、squish、pack和full这五个不同的显示水平，按照前后顺序full是全部显示，hide为隐藏，即越靠下显示结果越多。

#### 查看ALDH基因信息
USCC基因组浏览器检索可以用基因名，也可以根据染色体位置检索, 如在检索框直接输入位置：chr12:111,766,922-111,817,529。这里我们以ALDH2为例，在检索框中输入ALDH2，点按钮go，在出现的页面中选择第一个条目，可以显示界面(图2):
![UCSC基因组浏览器检索结果](http://www.ligene.cn/images/UCSC-2.png)
图2. UCSC基因组浏览器检索结果

ALDH2基因约有50,608个碱基组成，位于12号染色体q臂(染色体p臂为短臂，petite，长臂为q)，从左到右分别是5'端到3'端, 箭头代表基因转录方向。基因的exon是以box显示，而intron以线表示。末尾的UTRs是以比exon低一点的box表示。
通过双击track的正上方的文字说明(如“RefSeq Genes”)，track的显示会在restricted view and expanded view切换。也可以改变track的位置，把鼠标移到窗口左边的灰色按钮之上，当track颜色出现时,按住鼠标，然后拖动track到适当位置。

一般人类种群中的突变频率大于1%的单核苷酸突变称为SNPs。人类基因组中有大量SNPs，并与许多疾病或性状(traits)相关联，目前已经鉴定的SNPs都存储在公共数据库dbSNP。可以点击上图"Common SNPs track上方的文字"Simple Nucleotide Polymorphisms“来查看各个位置的SNP位点（编号以"rs"开始）。默认SNP是黑色，通过点击左边灰色按钮可以跳出一个网页来设置各种SNP的显示颜色。注意SNP位点rs671显示为红色(红色代表非同义突变)。这个SNP位点(chr12:111803962-111803962)与人类的酒精代谢能力有关, 大部分东亚人在ALDH2这个SNP有突变, 产生的乙醛脱氢酶能力只有其它人群的1/8。

> 人类基因的命名：基因符号应为大写的拉丁字母或大写的拉丁字母和阿拉伯数字的组合，基因符号应不超过6个字符，基因符号在书写时应用斜体或加下划线。如乙醛脱氢酶基因为ALDH2，胰岛素基因为INS。
另外，假基因(pseudogene)在基因名后加一个"P", 如OR7E5P；还没有正式命名的基因（unchraracterized gene）直接以ORF注释命名,如 C6ORF138表示open reading frame 138 on chromosome 6。
