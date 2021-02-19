##第13章 NGS数据分析基础


![NGS一般流程](https://raw.githubusercontent.com/adong77/ligene/master/imageBed/book/fig13-1.png)
图 13 1 NGS一般流程

###FastQC结果解读
FastQC结果报告基本内容有11个方面，包括基本统计，碱基含量分布统计，质量分布统计，GC含量，N碱基，插入片长度分布，adapter接头情况，kmer频率分布情况等。其中绿色表示通过(PASS)，黄色表示警告(WARN)，红色表示有问题(FAIL)。 
下面我们分别看一下各部分结果，以及 FastQC 判断各部分结果通过、警告和不合格的阈值。我们应关注结果中未通过的部分，仔细思考为什么我们的数据会得到这样的结果，可能存在哪些问题？
#### ①Basic Statistics (基础统计信息)
Basic Statistics的结果给出原始数据的基本信息，包括被分析文件的文件名、文件类型、质量值编码方式(Encoding)、序列总数、标记为低质量的序列数、序列长度和 GC含量，如图 13-9所示： 
![FastQC-1.png](https://raw.githubusercontent.com/adong77/ligene/master/imageBed/book/FastQC-1.png)
图 13-9 Basic Statistics
这部分结果提供了碱基质量值（Phred值）的编码方式。现在Illumina测序数据(1.9+)采用ASCII值33－93编码Phred值0-60,即Phred+33；而老的Illumina系统(1.3,1.5)采用Phred+64(ASCII码64-126)。如果分析较早的Illumina平台测序数据，注意需要用Phred+64编码值。

#### ②Per Base Sequence Quality(平均碱基质量)
Per Base Sequence Quality 显示序列每一个位置上 (x轴) 所有碱基的质量值范围 (y轴)，如图 13-10所示： 
![FastQC-2.png](https://raw.githubusercontent.com/adong77/ligene/master/imageBed/book/FastQC-2.png)
图 13-10 Per Base Sequence Quality
图中每一位置都有一个盒状图: 黄色箱子表示 25-75% 的范围，即IQR (inter-quartile range)，下面和上面的触须分别表示10%和90%的点。蓝线表示均值，红线表示中位数；
碱基的质量值越高越好，背景颜色将图分成三部分：碱基质量很好 (绿色)、碱基质量一般(黄色) 以及碱基质量差 (红色)。
碱基质量值随着reads的位置的增大而降低是正常现象，且通常Paired-end测序的反向reads的质量要比正向的差。如果任何一个位置的下四分位数小于10或者中位数小于25，会显示“警告”；如果任何一个位置的下四分位数小于5或者中位数小于20，会显示“不合格”。

#### ③Per Sequence Quality Scores (序列平均质量值)
Per Sequence Quality Scores显示每条序列平均碱基质量的分布，如图 13-11所示： 
![FastQC-3.png](https://raw.githubusercontent.com/adong77/ligene/master/imageBed/book/FastQC-3.png)
图 13-11 Per Sequence Quality Scores
图中横轴为测序质量值，纵轴为 reads 数量；由于成像的原因，得到的测序结果中通常会出现某些reads的质量值偏低，这样低质量的reads会在图中出现另外一个峰。
如果最高峰的质量值小于27(错误率0.2%)则会显示“警告”，如果最高峰的质量值小于20 (错误率1%) 则会显示“不合格”。

#### ④Per Base Sequence Content (平均碱基组成)
Per Base Sequence Content显示每个位置上的碱基组成比例，如图 13-12所示： 
![FastQC-4.png](https://raw.githubusercontent.com/adong77/ligene/master/imageBed/book/FastQC-4.png)
图 13-12 Per Base Sequence Content
图中横轴为碱基位置，纵轴为碱基组成比例。一个完全随机的文库内每个位置上4种碱基的比例应该大致相同，因此图中的四条线应该相互平行且接近；在 reads 开头出现碱基组成偏倚往往是建库过程造成的，比如建库时在reads开头加barcode，而barcode的碱基组成不是均一的；又如酶切位点的碱基组成是固定不变的，这样会造成明显的碱基组成偏离；
在reads结尾出现的碱基组成偏离，往往是测序接头的污染造成的。
如果任何一个位置上的A和T之间或者G和C之间的比例相差10%以上则报“警告”，任何一个位置上的A和T之间或者G和C之间的比例相差20%以上则报“不合格”。

#### ⑤Per Sequence GC Content (序列平均GC含量)
Per Sequence GC Content 显示每条序列平均 GC 含量的分布，如图 13-13所示: 
![FastQC-5.png](https://raw.githubusercontent.com/adong77/ligene/master/imageBed/book/FastQC-5.png)
图 13-13 Per Sequence GC Content
在一个正常的随机文库中，GC 含量的分布应接近正态分布，且中心的峰值和所测基因组的GC含量一致。如果结果是非正态分布（本图出现不正常的尖峰分布），则说明文库可能有污染 (如果是接头的污染，那么在overrepresented sequences那部分结果还会得到提示)，或者存在其它形式的系统偏差；
如果偏离理论分布的reads数超过总reads数的15 %则报“警告”，如果偏离理论分布的reads数超过总reads数的30 %则报“不合格”。

#### ⑥Per Base N Content
Per Base N Content 统计序列各个位点出现N的比例，如图 13-14所示: 
![FastQC-6.png](https://raw.githubusercontent.com/adong77/ligene/master/imageBed/book/FastQC-6.png)
图 13-14 Per Base N Content
测序仪不能正常完成某个碱基的判读(calling)，将会以N来表示这个位置的碱基，而不是A、T、C、G；未知碱基N多出现在测序Reads的3’末端的位置，原因是普遍出现的质量丢失 (a general loss of quality)，当能看到明显“鼓包”时，说明测序系统出了问题。
另一种常见的现象是文库整体上的测序质量较高，但reads开头出现较高比例的 N，这可能是由于文库的碱基组成偏离的比较严重，测序仪不能给出正确的base calling，这种情况可以结合per-base sequence content的结果来判断；
如果任何一个位置N的比例大于5%则报“警告”，大于20% 则报“失败”。

#### ⑦Sequence Length Distribution (序列长度分布)
Sequence Length Distribution的结果显示reads长度的分布情况，如图 13-15所示： 
![FastQC-7.png](https://raw.githubusercontent.com/adong77/ligene/master/imageBed/book/FastQC-7.png)
图 13-15 Sequence Length Distribution
测序仪出来的原始reads通常是均一长度的，但经过质控软件等处理过的数据则会改变reads的长度。当reads长度不一致时报“警告”，当有长度为0的reads时则报“不合格”。

#### ⑧Sequence Duplication Levels (序列重复水平)
Sequence Duplication Levels显示reads中重复序列出现的情况，如图 13-16所示： 
![FastQC-8.png](https://raw.githubusercontent.com/adong77/ligene/master/imageBed/book/FastQC-8.png)
图 13-16 Sequence Duplication Levels

图中横轴代表reads的重复次数 ( 1表示 unique 的序列，2表示有2条完全相同的reads，以此类推...)，大于10次重复后则按不同的重复次数合并显示。纵坐标表示各重复次数下的reads数占总reads的百分比；蓝线展示所有reads的重复情况，红线表示在去掉重复以后，原重复水平下的reads占去重后reads总数的百分比；
为了减少内存的使用量和计算时间，软件只统计前10万条reads，且任何长度大于75bp 的序列都会被截成50bp。即使这样，由于测序错误会增加文库内序列的多样性 (本来是重复序列的 reads，由于测序错误的存在变成了unique reads)，实际上这部分结果还是低估了文库内重复序列的水平；
这部分结果还显示去掉重复序列以后，我们可以保留reads的百分比 (图上面的小字，本例为 69.11 %)；
一个多样性比较好的文库，大部分的 reads 都应在图的左侧 (无论红线还是蓝线)；需要注意的是，这个重复水平和建库方式有关。如果建库存在PCR扩增的步骤，观察到的重复水平会比较高 (如本例)； 
如果非unique的reads占总reads数的20 %以上则报“警告”，占总read数的50 %以上则报 "不合格"。

#### ⑨Overrepresented sequences (过度呈现的序列)
Overrepresented sequences显示同一条read出现次数超过总测序reads数的0.1%的统计情况，如图 13-17所示， 
![FastQC-9.png](https://raw.githubusercontent.com/adong77/ligene/master/imageBed/book/FastQC-9.png)
图 13-17 Overrepresented sequences

正常文库内序列的多样性水平很高，不会有同一条read大量出现的情况，这部分结果会把大量出现的reads列出来，并给出可能来源；
运行FastQC的时候可以用“-c”参数来指定一个文件，这个文件里面存放可能存在的污染序列，FastQC 会在这个文件里面搜索reads中的overrepresented sequences；如果不提供这个文件，软件会从自带的数据库中搜索并给出可能的污染源；
同样，在这部分分析中任何长度大于75 bp的序列都会被截成 50 bp；
如果有任何read出现的比例超过总reads数的0.1 %，则报 '警告'；超过总reads数的1 %，则报 '不合格'。