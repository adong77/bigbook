# 全基因组测序(Whole Genome Sequencing)

> Whole Geneome Sequencing (WGS), also known as full genome sequencing, complete genome sequencing, or entire genome sequencing, is the process of determining the entirety, or nearly the entirety, of the DNA sequence of an organism's genome at a single time. ---WikiPedia

## 基因组重测序分析
全基因组重测序是对已有完整参考基因组序列的物种，利用DNA测序技术对其个体或群体的基因组进行测序，并通过基因组差异分析获得该物种的遗传变异信息。了解不同个体的遗传变异，对于物种的进化、生长发育、甚至疾病的发生机制都有重要意义。

![基因组重测序分析流程](http://www.ligene.cn/images/book/resequencing-pipeline.png)

## 结构变异鉴定
结构变异(Structural Variations, SVs)包括基因组易位(translocation)、倒位(inversion)、大的插入缺失(indels)及重复序列的拷贝数变化(Copy Number Variations, CNVs)等。基因组结构变异对基因功能影响比较大，通常会导致多基因的丢失、基因表达倍增及基因融合等。以前结构变异检测方法主要是比较基因组杂交芯片（aCGH），包括Illumina, Affymetrix和Agilent等商业公司的产品。随着NGS技术的发展，特别是双末端测序大大提高了结构变异的检测能力。配对reads的方向与距离可用于定位大片段indels、inversion和转位等（图 14 6）。
虽然基于成对reads的方法可以定位许多SV事件，但还是不能精确定位基因组的断点(breakpoints)。而split-read方法可以精确定位breakpoints，它通过把一些reads分割成能映射(map)到不同基因组区域的子序列，如Pindel的算法首先搜索read pairs，第一个read能比对到参考基因组，而第二个read不能比对到基因组上，因此在第二个read上可能有一个断点。利用第一个匹配的read作为锚定点(anchor)来扫描其周围区域来分段比对(split mapping)第二个read。
基因拷贝数变异(Copy number variations, CNV)一般是通过区域内read频率不正常变化来检测。这个算法是基于假设一个区域内的reads数量与它在基因组上的拷贝数成正比。如果一个基因组区域有许多重复，相对于其它没有重复的区域，将能观察到显著高的测序reads。而如果一个区域被删除，将没有reads覆盖到这个区域。由于其它序列因素，如GC含量、重复序列等，可能影响局部的reads密度，这些检测方法常先对这些因素进行标准化操作来消除影响。

![结构变异类型](http://www.ligene.cn/images/book/fig14-6.png)
图 14-6 结构变异类型。
（A）插入；（B）缺失；（C）倒位；（D）连续复制。(RC: read count; RP: read-pair; SR: split-read; AS: de novo assembly)
