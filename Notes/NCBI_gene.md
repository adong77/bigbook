NCBI的GENE数据库

* 打开NCBI官网(https://www.ncbi.nlm.nih.gov/)，页面如图：
![NCBI](../Images/ncbi/image.png)

* 点击下黑色下三角，选择Gene数据库

一、在Gene后面的搜索栏中，输入你感兴趣的基因或者蛋白（如INS），点击 search，跳出对话框如图：
![GENE-INS](../Images/ncbi/image-1.png)

搜索出很多这种蛋白。

    1. 确定这是你需要的蛋白。
    2. 注意观察后缀，红色圈部分，给出了你基因所在物种信息。选择你需要的物种，如人Homo sapiens(human)或小鼠，大鼠，斑马鱼等。

二、在确定是你关心的基因（物种和基因缩写都对）后，点击该基因前面的ID链接。

三、进入新界面后，会有很多信息需要注意，
* 首先是该基因的一些信息，还有其他常用名，比如下图红色部分。本来这个基因官方缩写是，但INS是它也叫做IDDM,ILPR等。

![Gene-summary](../Images/ncbi/image-2.png)

* 下拉网页，这里说明它位于11号染色体上。

![Gene-Chromosome](../Images/ncbi/image-3.png)

* 下拉网页到Genomic这里如图:

![Gene-Genomic](../Images/ncbi/image-4.png)

Download后面的三个链接（GenBank, FASTA, Sequence Viewer），点击进去获得该基因的蛋白或核酸的全部信息。

这里讲解GenBank页面的使用，点击GenBank链接，刷新页面后，下拉网页至这里
![Genbank-source](../Images/ncbi/image-7.png)

这里说明这个基因在11号染色体上，全长1431.

![Genbank-mRNA](../Images/ncbi/image-8.png)

就是红色方框内的信息1-42,222-425等这些都是mRNA的外显子，这个基因是由3个外显子构成的。43-221属于DNA的内含子部分。它在转录成mRNA后被剪切掉不翻译了。

蛋白整体是由多个外显子合并而成的，但是蛋白分成不同亚型。不同亚型是由不同外显子拼接的，以INS为例，1亚型由1,2,3外显子组合，2亚型只由1个外显子组成等。

再往下拉页面到这里：
![Genbank-CDS](../Images/ncbi/image-9.png)
这里是CDS区，它是外显子内部分，是mRNA中翻译蛋白的部分。

可以看到mRNA是3个外显子，而CDS是2个外显子。且而CDS外显子比mRNA短。如mRNA 1，2外显子是1-42，222-425；CDS 1外显子是239-425（这段就是信号肽序列，起始密码子Met）。其中1-238是mRNA不翻译蛋白的结构部分，如核糖体结合部位。同理mRNA 2外显子是1213..1431，CDS 2外显子是1213..1358。其中1358-1431是mRNA不翻译蛋白的部分，如ployA。

> 介绍概念CDS，CDS不同于ORF,CDS从mRNA第一个其实密码子开始AUG到最后终止密码子TAA（TGA,TAG）终止，核酸序列是准确表达蛋白序列。ORF随意只要有AUG及开始一段核酸序列。
举个例子如这段序列 UUG <font color=blue>AUG TAG ATG T<u>AU GGC TCC UAG TAA</u></font>蓝色字部分是CDS 也可以称作一段ORF， 下划线可以叫做另一段ORF。

下拉页面到最后:
![Genbank-ORIGIN](../Images/ncbi/image-10.png)

这是该基因DNA全序列。

上拉该网页至上部如图位置，点击箭头所指的“highlight sequence features”就可以知道DNA上哪些是RNA部分。
![highlight-features](../Images/ncbi/image-11.png)

点击后页面刷新，DNA部分发生改变如图。
![sequence-features](../Images/ncbi/image-12.png)

CDS区被褐色背景了，同时给出蛋白序列。

以上就是GenBank教学。学会了你就能掌握不同mRNA所在DNA位置跨了多少bp内含子，便于realtimePCR 引物设计，防止DNA污染。Realtime PCR引物最好跨越一个1000 bp内含子，并且mRNA片段长度100-200bp。防止DNA污染。


* 回到初始NCBI页面，下拉网页至mRNA and proteins

![Gene-mRNA](../Images/ncbi/image-5.png)

* 下面就是INS的一些异构体与insulin preproprotein。

NM_000207.3点击里面是INS转录异构体1（transcript variant 1）的mRNA序列:
![Gene-isoform1](../Images/ncbi/image-6.png)

点击highlight刷新网页，就能得到蛋白序列，及翻译蛋白的CDS区。同时给出蛋白序列。
点击NP_000198.1链接，刷新网页就可以得到蛋白序列：
![Alt text](../Images/ncbi/image-15.png)

* 最后还有个值得学习的地方

回到原始界面点击如图红圈部分“CCDS7729.1”
![ccds](../Images/ncbi/image-13.png)

刷新进入新界面,
![Alt text](../Images/ncbi/image-14.png)

这里面就是该异构体isoform1里面的333nt的CDS区和110个氨基酸的蛋白序列。

