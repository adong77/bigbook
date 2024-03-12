# 生命组学(Omics) 

* Multi-omics: genome, transcriptome, proteome, metabolome, and microbiome

![Omics-different-layers](http://www.ligene.cn/images/Omics_differentLayers.gif)

## Multi-omics
### 基因组学
基因组学(Genomics)是以生物信息学分析为手段研究基因组的组成、结构、表达调控机制和进化规律的一门学科。研究对象是某一个生物体的基因组结构特征、演化规律及对生物体的生物学意义。通过使用高通量DNA测序和生物信息学来组装和分析整个基因组的结构与功能。基因组学包括功能基因组学、结构基因组学、表观基因组学与宏基因组学等。DNA一直被认为是决定生命遗传信息的核心物质，但近些年新的研究表明，可以在不改变DNA序列的情况下改变DNA修饰，不仅可以影响个体发育，而且还可以遗传下去。这种在基因组水平上研究表观遗传修饰的领域被称为表观基因组学。The epigenome is a multitude of chemical compounds that can tell the genome what to do. 表观基因组学使人们对基因组的认识又增加一个新视点：对基因组而言，不仅是序列包含遗传信息，而且其修饰也可以记载遗传信息。

> [!NOTE]
> Genome sciences are data-driven (not so hypothesis-driven) research.

### 转录组学
转录组学（Transcriptomics）是对基因型在给定时间产生的RNA转录本的分析，该转录本在基因组，蛋白质组和细胞表型之间提供了联系。转录组是所有RNA分子的集合，包括mRNA，rRNA，tRNA和在一个或一个细胞群中产生的非编码RNA。转录组学也称为表达谱分析，检查给定细胞群中RNA的表达水平[13]。RNA-Seq一种使用深度测序技术的转录组分析方法，它使用下一代测序（NGS）来揭示特定时间生物样品中RNA的存在和数量，分析不断变化的细胞转录组[14]。
RNA-seq通常是混合测序，数据代表了数千至数百万个细胞的基因表达模式的平均值；这可能会掩盖细胞之间的生物学相关差异。单细胞RNA-seq（scRNA-seq）代表了一种克服这个问题的方法。通过分离单个细胞，捕获其转录本并生成测序文库，其中转录本被映射到单个细胞，scRNA-seq能够以前所未有的分辨率评估细胞群和生物系统的基本生物学特性[17]。
![RNA-seq](http://www.ligene.cn/images/book/scRNA-seq.png)


### 蛋白质组学
蛋白质组学（Proteomics）是对蛋白质特别是其结构和功能的大规模研究，是在90年代初期，由马克·威尔金斯(Marc Wikins)等学者首先提出的新名词。它补充了其他“组学”技术，如基因组学和转录组学，以阐明生物体蛋白质特征，并识别特定蛋白质的结构和功能。它比基因组学更复杂，因为生物体的基因组或多或少是恒定的，而蛋白质组因细胞而异。蛋白质组学研究的关键技术包括质谱分析、X射线晶体学、核磁共振和凝胶电泳。不用蛋白质组学技术用于不同的研究样本，例如检测各种诊断标志物，疫苗生产的候选物，了解致病机制，响应不同信号的表达模式的改变以及解释不同疾病中的功能蛋白途径[15]。
![Proteomics](http://www.ligene.cn/images/book/proteomics.png)

### 代谢组学
代谢物是在代谢过程中化学转化的小分子，因此，它们提供细胞状态的功能参数。与功能分别受表观遗传调节和翻译后修饰影响的基因和蛋白质不同，代谢物是生物活性的直接特征，因此它们更容易与表型相关联。代谢组是生物途径的输入和输出的量度，因此，通常被认为比其他组学（如基因组学或蛋白质组学）更能代表细胞的功能状态。此外，许多代谢物在各种动物物种中都是保守的，有助于将实验动物的研究结果外推到人类。测量代谢组的常用技术包括质谱（MS）和核磁共振波谱（NMR），它可以检测数百到数千种独特的化学实体。在这种情况下，代谢组学（metabolomics）已成为一种强大的方法，已被广泛用于临床诊断[12]。  
![Metabolomics](http://www.ligene.cn/images/book/metabolomics.jpg)

### 宏基因组学
“微生物组”（microbiome）是指存在于特定环境（生态位，biotype）中所有微生物种类及其遗传信息和功能的集合，其不仅包括该环境中微生物间的相互作用，还包括有微生物与该环境中其它物种及环境的相互作用。微生物作为地球上进化历史最长、生物量最大、生物多样性最丰富的生命形式，推动地球化学物质循环，影响人类健康乃至地球生态系统，蕴藏着极为丰富的物种资源和基因资源。在自然条件下，各类微生物与其所处的环境及环境中存在的宿主构成了复杂的生态系统，微生物以其社会行为，在维护人类健康及地球生态系统物质循环中发挥着不可替代的作用。
微生物在人体的食物消化、机体免疫等方面发挥着重要作用。在大多数情况下，微生物通过群落而非单一个体来发挥这些重要功能。水体、土壤、肠道和很多的人工生物环境（如废水处理、食品发酵、堆肥、沼气池等等）都具有很复杂的微生物群落，这些微生物相互作用、共同协作，一起完成复杂的代谢功能。环境样品中的微生物组成的群落构成了一个巨大而复杂的基因库，在这个基因库中既包含代表不同微生物身份的系统发育标记基因（如16S rRNA基因），也包含各种代谢功能基因，它们统称为宏基因组（metagenome，又称环境基因组或生态基因组），这些基因确定了样品微生物群落的组成与功能，研究样品的基因组是认识复杂微生物群落的主要途径。宏基因组学在开发微生物资源多样性、筛选获得新型活性物质、发掘与抗生素抗性、维生素合成及污染物降解相关的蛋白质等方面展示了很大的潜力。  
人类微生物组计划（Human Microbiome Project，HMP）是美国国立卫生研究院(NIH)于2008年发起的一项旨在鉴定与阐明和人类健康与疾病相关的微生物功能的计划。于2007年启动，第一阶段 (HMP1) 专注于识别和表征人类微生物群。 第二阶段被称为“综合人类微生物组计划 ”(iHMP)，于 2014 年启动，旨在产生资源来表征微生物组并阐明微生物在健康和疾病状态中的作用。https://www.hmpdacc.org/
![Microbiome](http://www.ligene.cn/images/book/HMP.png)




## References
1. PATTI G J, YANES O, SIUZDAK G. Innovation: Metabolomics: the apogee of the omics trilogy [J]. Nature reviews Molecular cell biology, 2012, 13(4): 263-9.
2. LOWE R, SHIRLEY N, BLEACKLEY M, et al. Transcriptomics technologies [J]. PLoS Comput Biol, 2017, 13(5): e1005457-e.
3. ASLAM B, BASIT M, NISAR M A, et al. Proteomics: Technologies and Their Applications [J]. Journal of Chromatographic Science, 2017, 55(2): 182-96.
4. OLSEN T K, BARYAWNO N. Introduction to Single-Cell RNA Sequencing [J]. Current protocols in molecular biology, 2018, 122(1): e57.


