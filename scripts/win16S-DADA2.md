# 16S rRNA扩增子测序数据分析

本16S rRNA基因扩增子测序数据分析流程包括：首先通过R语言中DADA2包对样本测序数据进行质控与预处理；然后得到样本的ASV表与物种分类信息；最后通过MicrobiomeAnalyst可视化样本数据，查看样品中的细菌种类，并进行生物多样性(biodiversity)统计分析。

## 1. DADA2
本流程所有命令都要在R环境中运行，请先安装R软件。
### 1.1 相关软件与数据
(1)安装DADA2（当前版本1.16）的二进制文件可从Bioconductor获得。注意，你必须拥有R3.6.1或更新版本，以及Bioconductor版本3.10。为防止安装R包时遇到Windows文件夹不能写入问题，需以管理员权限运行R软件进行安装。
```
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("dada2", version = "3.10")
library(dada2) 
```

(2)从网址(https://benjjneb.github.io/dada2/training.html)下载Silva数据库压缩包silva_nr_v138_train_set.fa.gz和silva_species_assignment_v138.fa.gz。

(3)16S测序原始数据(raw reads) 
本实验需要把所有Illumina测序原始数据放在一个文件夹（如D:\win16s\raw_reads）。一个样品的双端测序有两个reads文件，默认以"_R1.fastq"与"_R2.fastq"分别代表正向与反向测序reads （如果文件名不对，需要重新命名）。测序公司提供的样本测序数据一般已去除barcode和primer序列。

### 1.2 分析过程
（1）数据获取
* 设置工作路径，此路径内有多个样本的两端测序数据的压缩文件，如SAA_R1.fastq.gz, SAA_R2.fastq.gz等。
```
path<-"D:/win16s/"
list.files(path)
fnFs <- sort(list.files(path, pattern=".R1.fastq", full.names = TRUE))
fnRs <- sort(list.files(path, pattern=".R2.fastq", full.names = TRUE))
```
* 获取样本文件名（无后缀）
```
sample.names <- sapply(strsplit(basename(fnFs), "_"), `[`, 1)  # 
```

* 数据质量检测（正反向两个Reads）,可以看到Read末端的质量较差
```
plotQualityProfile(fnFs[1:2])
plotQualityProfile(fnRs[1:2])
```
（2）数据过滤和裁剪
* 指定过滤后的文件名
filtFs <- file.path(path, "filtered", paste0(sample.names, "_F_filt.fastq.gz"))
filtRs <- file.path(path, "filtered", paste0(sample.names, "_R_filt.fastq.gz"))
names(filtFs) <- sample.names
names(filtRs) <- sample.names
out <- filterAndTrim(fnFs, filtFs, fnRs, filtRs, truncLen=c(220, 220), maxN=0, maxEE = c(2,2),  truncQ=2, rm.phix=TRUE,   compress=TRUE)
head(out)

* filterAndTrim里参数详情可参考R帮助文件
truncQ: truncate读取质量分数小于或等于truncQ的第一个实例。
truncLen: truncLen base后的Truncate读段，小于此值的读取将被丢弃。
maxEE: 在裁剪后，将丢弃大于maxEE“预期错误”的读段。预期误差由质量分数的名义定义计算:EE = sum(10^(-Q/10))

(3)学习错误率(Learn the Error Rates)
```
errF <- learnErrors(filtFs, multithread=TRUE)
errR <- learnErrors(filtRs, multithread=TRUE)
```
* 基于错误率模型进一步质控
```
dadaFs <- dada(filtFs, err=errF, multithread=TRUE)
dadaRs <- dada(filtRs, err=errR, multithread=TRUE)
dadaFs[[1]]
```

（4）序列拼接
将正向与反向序列合并成一个完整的序列
```
mergers <- mergePairs(dadaFs, filtFs, dadaRs, filtRs, verbose=TRUE, minOverlap = 0) # 参数minOverlap值？
#mergers <- mergePairs(dadaFs, filtFs, dadaRs, filtRs, verbose=TRUE, justConcatenate=TRUE) #justConcatenate=TRUE在两个序列间直接插入10个N拼接
```
(5）生成ASV表
```
seqtab <- makeSequenceTable(mergers)
dim(seqtab)
```
* 查看序列长度分布
```
table(nchar(getSequences(seqtab)))
```

（6）去除嵌合体
```
seqtab.nochim <- removeBimeraDenovo(seqtab, method="consensus", multithread=TRUE, verbose=TRUE)
dim(seqtab.nochim)
sum(seqtab.nochim)/sum(seqtab)
# 求和函数，计算分析过程中的reads数量
getN <- function(x) sum(getUniques(x))
# 合并各样本分步数据量，如果只处理一个样本，将sapply(dadaFs, getN) 代替为 getN(dadaFs)
track <- cbind(out, sapply(dadaFs, getN), sapply(dadaRs, getN), sapply(mergers, getN), rowSums(seqtab.nochim))
colnames(track) <- c("input", "filtered", "denoisedF", "denoisedR", "merged", "nonchim")
rownames(track) <- sample.names  #行名修改为样本名
# 统计结果预览
head(track)
```

（7）物种注释
* 序列物种注释
```
taxa <- assignTaxonomy(seqtab.nochim, paste0(path, "/silva_nr_v138_train_set.fa.gz"), multithread=TRUE,tryRC = TRUE)
#taxa <- addSpecies(taxa, paste0(path, "/silva_species_assignment_v138.fa.gz"))
taxa.print <- taxa 
rownames(taxa.print) <- NULL
head(taxa.print)
```

（8）分析文件保存
taxa.print <- as.data.frame(taxa.print)
taxa.name <- paste (taxa.print$Kingdom, taxa.print$Phylum, taxa.print$Class, taxa.print$Order, taxa.print$Family, taxa.print$Genus, sep=";")
seqtable.taxa <- cbind('#NAME'= taxa.name, t(seqtab.nochim))
rownames(seqtable.taxa) <- NULL
head(seqtable.taxa)

* 带注释文件的ASV表格导出
setwd(path)
write.csv(seqtable.taxa , "dada2_counts.taxa.csv", quote=F, row.names=F)

* ASV表格导出
write.table(t(seqtab.nochim), "dada2_counts.asv.txt", sep="\t", quote=F, row.names = T)

（8）统计相同菌种的总和
利用EXCEL软件合并重复项的SUMIF方法(https://www.kafan.cn/A/pvw72jpyn7.html)对上面得到的文件(dada2_counts.taxa.csv)中的相同菌属进行汇总，将得到最后的结果复制粘贴（鼠标右键菜单选择粘贴选项为值）到dada2_new.taxa.csv(格式见下图）,并可根据实际情况对其样本名进行修改（注意上方的#NAME），用于后续的生物信息学分析。

注：SUMIF($A$2:$A$1642,$M2,B$2:B$1642)

## 2. MicrobiomeAnalyst
2.1数据分析
准备两个文件dada2_new.species.csv和metedata.csv（metedata.csv格式如下，注意上方的#NAME），用这两个表在microbiomeanalyst网站即可进行多样性数据分析。

1）打开microbiomeanalyst网站(https://www.microbiomeanalyst.ca/),选择MDP

2）将dada2_new.species.csv和metedata.csv载入（勾选Taxonomy labels included），选择分类数据库，这里我们选择SILVA Taxonomy.

3）这里展示一些数据基本信息，查看数据间匹配程度，接着下一步


4） 进行数据过滤
数据过滤的目的是去除低质量或无信息的特征，以改善下游的统计分析。你可以通过拖动滑块到左端(值:0)来禁用任何数据过滤器。低计数过滤器（Low count filter)——在很少的样本中具有非常小的计数的特性可能是由于排序错误或低水平污染造成的。首先需要指定一个最小计数(默认为4)。20%流行度过滤器意味着至少20%的值应该包含至少4个计数。您还可以根据它们的平均值或中值进行过滤。低方差滤波器(Low variance filter)——在整个实验条件中接近常数的特征不太可能与所研究的条件相关联。它们的方差可用分位数间量程(IQR)、标准差或变异系数(CV)来测量。默认情况下，所有下游数据分析都将基于过滤后的数据。你可以选择使用原始的未经过滤的数据进行一些分析(例如alpha多样性)。


5) 标准化
归一化的目的是解决采样深度的可变性和数据的稀疏性，以实现更具生物学意义的比较。当库的大小非常不同时(i.e. > 10 times)，稀薄化也被推荐。注:rarefying主要用于16S marker基因数据，不能用于shotgun元基因组数据。所有这些方法都需要原始计数数据作为输入。可以通过数据伸缩或数据转换来简化数据。但是，您不能同时应用数据伸缩和数据转换，因为伸缩或转换的数据不再是有效的计数数据。
数据伸缩：
TSS：总和比例
CSS: 累积比例
UQ: 上四分位数标准化
数据转换：好像是一些对数转换，感觉可以理解为类似于将1转换为log1010
在统计学当中由于要对多指标进行综合分析，而指标的核心就是均值和标准差，那如果想要将均值和标准差结合起来一起分析，那就需要进行数据的标准化处理，从而消除变量分布不同的影响，然后在综合分析的时候才具有统计意义。
RLE：相对对数表达量
TMM:
CLR:集中对数比率



5） 接下来就到了可视化分析结果，主要展现四部分。
A. 柱状图
1.General options:
Taxonomy level :选择分类水平（ phylum class order family genus）
Graph type:选择图形类型（stacked bar(actual abundance)；stacked bar(percentage abundance)；stacked area plot）
2. Taxa resolution
Merging small taxa with counts：少于指定的截止计数的特性将被丢弃到“其他”中
Showing top n taxa：只展示计数多的前n个
3. View options
Organize samples by：是否按分组展示



B. 稀释曲线
稀释性曲线可以用来比较测序不同的样本中物种的丰富度，也可以用来说明样本的测序数据量是否足够，是否需要加测数据。对某个样本来说，当曲线趋末端向平坦时，说明测序数据量合理，更多的数据量只会产生少量新的OTU，反之则说明测序深度不足以覆盖大多数菌，继续测序还可能产生较多新的OTU。因此，通过作稀释性曲线，可得出样品的测序深度情况。对于不同的样本（也就是不同颜色的曲线）来说，位于上方的样本物种的丰富度要高于位于下方的样本。
主要是一些展现分组的选择
Data source :选择原始或过滤的数据
Setps：分布绘制曲线，改变曲线的圆滑性


C. alpha多样性
alpha多样性是用来衡量个体内菌群的一个多样性如何，注意是单个个体，不涉及个体间的比较
Diversity measure：多样性度量
Observed：考虑物种丰富度
chao1:chao1是度量物种丰富度的指标，它和丰度、均匀度无关，但是它对稀有的物种很敏感。
ACE:ACE指数在生态学中同样作为度量物种丰富度的指标,其值越高代表群落物种越丰富
Shannon:同时考虑了物种丰富度以及均匀度
Simpson:辛普森指数（Simpson index）同样考虑了物种丰富度以及均匀度，但与Shannon指数相比，它更受均匀度的影响
Fisher:同时考虑了物种丰富度以及均匀度
Statistical method:统计方法
T-test/ANOVA：独立样本baiT检验一般仅仅比较两组数据du有没有区别，区别的显著性，如比较zhi两组人的身高，体重等dao等，而这两组一般都是独立的，没有联系的，只是比较这两组数据有没有统计学上的区别或差异。单因素ANOVA也就是单因素方差分析，是用来研究一个控制变量的不同水平是否对观测变量产生了显著影响。说白了就是分析x的变化对y的影响的显著性，所以一般变量之间存在某种影响关系的，验证一种变量的变化对另一种变量的影响显著性的检验。一般的，方差分析都是配对的。
Mann-Whitney/Kruskal-Wallis： Mann-Whitney检验假设两个样本分别来自除了总体均值以外完全相同的两个总体，目的是检验这两个总体的均值是否有显著的差别。Kruskal-Wallis检验用于多个连续型独立bai样本的比较。方du差分析程序关注的是，几个总体的均值zhi是否相等。数据是间隔测量尺度或比率测量尺度的数据。


D. beta多样性
beta多样性的计算是为了表征个体间微生物组成相似性的一个指标，个体之间物种的有无和不一致性通常影响beta多样性指数，当然alpha多样性指数也会影响beta多样性指数。
Ordination method :
PCoA：主坐标轴分析
NMDS：非度量多维尺度法是一种将多维空间的研究对象（样本或变量）简化到低维空间进行定位、分析和归类，同时又保留对象间原始关系的数据分析方法。
Distance method:数学中不同距离计算方法
Bray-Curtis Index
Jensen-Shannon Divergence
Jaccard Index
Unweighted UniFrac Distance
weighted UniFrac Distance
Statisitical method:统计方法
Permutational MANOVA:置换多因素方差分析
Analysis of Group Similarities:检验样品组间的差异显著性
Homogeneity of Group Dispersions:群分散的同质性

