# PCR Primer Design


## Primer-BLAST 设计qPCR引物
Primer-BLAST为NCBI开发的一款引物设计工具，它将Primer与BLAST合二为一，即能同时完成引物设计与序列同源性比对，从而快速设计合适的PCR引物。现以酵母菌的基因表达研究为例，我们设计引物来做实时荧光定量PCR。注意，对真核生物设计qPCR引物，为避免基因组的扩增，qPCR引物设计最好能跨两个外显子，片段长度以150-200bp为宜。
### 目的基因序列下载
首先，我们通过NCBI查找酿酒酵母(Saccharomyces cerevisiae)的基因CAR2序列，并下载基因序列来设计引物。
（1）打开NCBI 主页，在左上角的数据库选择框中选择“gene”，然后在右边输入框中输入“CAR2 saccharomyces cerevisiae”，会出现如下页面(图 10 11)，第一个就是酿酒酵母的基因CAR2 (ID:851158)。
![基因数据库搜索结果](http://www.ligene.cn/images/book/fig10-11.png)
图 10 11基因数据库搜索结果

（2）点击CAR2链接，打开新的基因信息页面后，鼠标移动页面到mRNA and Protein注释部分(图 10 12)，其中NM_001182326.1是mRNA序列的登录号; NP_013542.1为蛋白质序列的登录号。
![CAR2基因信息](http://www.ligene.cn/images/book/fig10-12.png)
图 10 12 CAR2基因信息

（3）点击CAR2基因的mRNA序列的登录号（NM_001182326.1）链接，在新打开的网页中，再点击“send to”选择“Coding Sequences”、“FASTA Nucleotide”下载序列到指定文件（CAR2_gene.fasta）。

### 引物设计(Primer-BLAST)
（1）打开NCBI LAST页面https://blast.ncbi.nlm.nih.gov/，点击页面下方的Primer-BLAST(Design primers specific to your PCR template)，进入引物设计页面，如下图 10 13所示。
![引物设计页面](http://www.ligene.cn/images/book/fig10-13.png)
图 10 13引物设计页面

（2）在输入框中输入下载的目的基因序列，或者通过下方的“浏览”按钮将电脑中保存的模板序列文件导入，然后进行参数设置：PCR产物大小为80~200bp，在“PCR melting temperatures”中设置Tm值在57~63 °C之间。在“PCR  Pair Specificity Checking Parameters”中数据库(Database)下拉框选择“Refseq mRNA”，并填写基因来自物种(Organism)为“Saccharomyces cerevisiae”，在页面最下面选择显示在新的窗口, 如下图 10 14所示。
![Primer-BLAST参数设置](http://www.ligene.cn/images/book/fig10-14.png)   
图 10 14 Primer-BLAST参数设置

另外，点击下面的“Advanced parameters”，可对参数进行详细设置，在打开的窗口中，按照引物设计原则设置相关参数，如引物长度，GC含量等。
（3）点击页面最下方的“Get Primers”按钮，进入引物设计结果页面（图 10 15），从图中看到结果中会有十对引物，我们对每对引物进行分析，根据实验需要从中选择合适的引物用于PCR实验。一般选择前面几个引物，复制序列和产物长度到记事本，用于下一步验证。
![引物设计结果](http://www.ligene.cn/images/book/fig10-15.png)
图 10 15引物设计结果

### 引物验证(Primer Premier5.0)
（1）打开Primer Premier 5.0软件，在通过菜单“filenewDNA sequence ”中导入前面下载的CAR2的基因序列，
（2）点击菜单“ Primer ”，选择正向引物序列“S”，再点击“ Edit Primers ”进入下图，在标记处输入上步设计好的正向引物，点击按钮“ OKAnalyzeprime ”进行验证（图 10 16）。
![Primer Premier5引物编辑窗口](http://www.ligene.cn/images/book/fig10-16.png)
图 10 16 Primer Premier5引物编辑窗口

（3）同理，反向引物序列的验证把前面的“S”改为“A”，再按照上面步骤进行，输入反向引物时选择“Reversed”，再点击按钮OKAnalyzeprime进行分析。
（4）在验证结果中正反引物不出现或出现较少的“found”为较好的引物，然后输出引物送公司合成。
