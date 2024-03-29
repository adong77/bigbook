# 统计学基础
🐘TO-DO🐘

概率论是统计推断的基础，在给定数据生成过程下观测、研究数据的性质；而统计推断则根据观测的数据，反向思考其数据生成过程。预测、分类、聚类、估计等，都是统计推断的特殊形式，强调对于数据生成过程的研究。
* 概率论：根据桶中信息，猜猜手里有啥？(总体对样本进行预测)
* 统计学：根据手中信息，猜猜桶里有啥？(样本归纳总结出总体)
![probability vs. statistics](http://www.ligene.cn/images/book/probability-statistics.jpg)

Lary Wasserman在《All of Statistics》的序言里有说过概率论和统计推断的区别：
* The basic problem that we study in probability is: Given a data generating process, what are the properities of the outcomes?
* The basic problem of statistical inference is the inverse of probability: Given the outcomes, what can we say about the process that generated the data?



## Basic Probability
* 概率simple入门: https://zhuanlan.zhihu.com/p/26098301


## statistical analysis
### 描述性统计量
什么是统计学问题呢？通常为了解决一类问题，我们会观察一组和该问题相关的样本，利用这部分样本来推断总体的情况进而得到结论。在通过样本推断总体之前，我们首先需要对已有样本数据进行简单的评估和描述，针对这一需求也就引出了**描述性统计量**这一概念。进行描述性统计时，我们关注数据两个层面的问题，分别是数据的集中趋势和变异分散性。

#### 数据的集中趋势
面对少则几十个多则上千个数字，第一步通常是观察平均水平。这里介绍三个计算数据平均水平的概念，分别是均值(mean)、中位数(median)和众数(mode)。
* 均值：所有观察值的和除以观察的个数。通常，算数平均是最自然和常用的测度，其问题在于对异常值(outliers)非常敏感。有极端值存在时，均值不能代表样本的绝大多数情况。
* 中位数：所谓中位数，是指所有样本观测值由小到大排序，位于中间的一个（样本数为奇数）或者两个数据的平均值（样本数为偶数）。

通常，当数据分布对称时，中位数近似等于算数平均数；当数据正倾斜时（画出的图像向右边倾斜），中位数小于算数平均数；当数据负倾斜时（画出的图像向左倾斜），中位数大于算数平均数。因此在很多情况下，我们可以通过比较样本的均值和中位数对数据的分布对称性进行一个初判断。

* 众数：在样本的所有观测值中，出现频率最大（出现次数最多）的数值称为众数。这里需要说明的是，当数据量很大而且数值不会多次重复出现时众数并不能给我带来太多的信息。比如当你计算上万个基因的表达量后，得到众数最可能的是0，因为每个基因的表达值或多或少都有一些不同，这时候出现最多的就是那些没有检测的表达基因的0了。

但是在遇到类别数据而非数值型数据时，众数有很大用处，或者说众数是唯一可以用于类别数据的平均数。

在R中，上述提到的均值和中位数可以通过mean(data)和median(data)函数进行计算,而中位数可以通过modeest包的mfv(data)函数得到。

#### 数据的变异性（离散性）
平均数显然不能说明一切问题，因为在说明样本数据时我们还必须考虑数据是不是过于分散。例如在篮球队员的投篮平均得分相同的情况下，更重要的时知道他们哪些人发挥得更加稳定。

极差(range)指的是一个样本中最大值和最小值之间的差值。在统计学中也称为全距，它能够指出数据的“宽度”（范围）。但是，它和均值一样非常容易受到极端值得影响，而且会受到样本量的明显影响。

针对极差的缺点，统计学中又引入了**分位数(quantiles)**的概念，通俗讲就是把数据的“宽度”细分后再去进行比较从而更好地描述数据的分布形态。分位数用三个点将从小到大排列好的数据分为四个相等部分，而这三个点也就是我们常说的四分位数，分别叫做下四分位数，中位数和上四分位数。当然，除了四分位你也可以计算十分位或者百分位。

分位数的引进能够说明数值的位置，但是无法说明某个数值在该位置出现的概率。为了说明数据的稳定程度，我们可以考虑计算每个数据值到平均数的距离（此处，你可以脑补一个高瘦形的数据曲线和矮胖形的数据曲线），但是样本中所有观测值和均值的偏差和永远是0。为了解决这种正负距离相互抵消的问题，统计学中又引入了**方差(variance)**和**准差(standard deviation)**的概念。

所谓方差是指数值与均值距离平方数的平均数，而标准差则是方差的平方根。标准差体现了数据的变异度，标准差越小，数值和均值越近。通常，均值用μ表示，而标准差用σ表示。

在R中，可以通过quantile()计算分位数，通过var()来计算方差，通过sd()来计算标准差。

有个标准差的概念，随之而来的问题是当两个样本标准差相同但是均值相差很大时该如何做出区分。统计学中随之引入了**变异系数(coefficient of variation, CV)**的概念，变异系数是指样本标准差除以均值再乘100%。变异系数不会受数据尺度的影响，因此常用来进行不同样本之间变异性的比较。

在实际的数据分析中，如果要比较不同数据集(均值和标准差都不同)之间的数值，通常会引入z score的概念，z score 的计算方法是用某一数值减去均值，再除以标准差。通过对原始数据进行z变换，我们将不同数据集转化为一个新的均值为0，标准差为1的分布。

#### 计算描述性统计量
在R中，使用summary()函数方便的得到一个data frame 的各种描述性统计量。当某一列是数值型变量时，你可以得到该列数据的均值、极值、方差和分位数。

下面我们使用R中内置的数据Edgar Anderson’s Iris Data进行一些简单展示。

```R
summary(iris)
# 查看常用的描述统计量
```

表 1	
|Sepal.Length |	Sepal.Width |	Petal.Length |	Petal.Width |	Species|
|----|----|----|----|----|
|Min. :4.30 |	Min. :2.00 |	Min. :1.00 |	Min. :0.1 |	setosa :50|
|1st Qu.:5.10 |	1st Qu.:2.80 |	1st Qu.:1.60 |	1st Qu.:0.3 |	versicolor:50|
|Median :5.80 |	Median :3.00 |	Median :4.35 |	Median :1.3 |	virginica :50|
|Mean :5.84 |	Mean :3.06 |	Mean :3.76 |	Mean :1.2 |	NA|
|3rd Qu.:6.40 |	3rd Qu.:3.30 |	3rd Qu.:5.10 |	3rd Qu.:1.8 |	NA|
|Max. :7.90 |	Max. :4.40 |	Max. :6.90 |	Max. :2.5 |	NA|

* 形象化展示

所谓形象化展示就是用图示的方法来展示数据结果，比较常见的方法有条形图，箱线图，直方图等。
```R
# 使用箱线图展示某一列数据的分布情况
boxplot(iris$Sepal.Length)
```

### 参数估计
所谓参数估计，就是依据样本统计量来估计未知的总体参数。例如，利用样本均值x来估计总体均值u，利用样本方差S2来估计总体方差σ2等。在参数估计中，用于估计总体参数的统计量称为估计量，用ϴ ̂表示。而根据一个具体的样本计算出的估计量的数值称为估计值。例如，要计算一批零件的平均寿命，这批零件的寿命未知，称为参数，用ϴ表示；从中抽取一个随机样本，根据此样本计算得到的平均寿命就是一个估计量ϴ^; 假设计算出来的值为90小时，则这个90小时为估计值。参数估计问题常用点估计和区间估计两种情况。

* （1）点估计

点估计就是利用样本的统计量ϴ ̂的某个数值直接作为总体参数的估计值，如利用样本均值x作为总体均值u，利用样本方差S2作为总体方差σ2等。点估计的方法有矩估计法，顺序统计量法、极大似然法等。
极大似然法是在总体的分布类型已知，但含有未知参数ϴ的情况下常用的参数估计方法。设总体为X，令(X1,X2,…,Xn)为从总体X中抽取的随机样本，则f(x, ϴ)=f(x1,x2,…,xn, ϴ)为样本的概率函数；当x固定时，则把f(x, ϴ)看成ϴ的函数，称为似然函数，记为L(ϴ,x)= f(x, ϴ)。值得注意的是，虽然似然函数和概率函数的表达式相同，但表示的含义不同。当将ϴ固定，将其看成定义在总体X上的函数时，称为概率函数；当将x固定，将其看成定义在参数ϴ上的函数时，称为似然函数。
设(x1,x2,…,xn)为总体X的一个样本观测值，若似然函数L(ϴ,x)在ϴ ̂=ϴ ̂(x1,x2,…,xn)处取到最大值，则称ϴ ̂(x1,x2,…,xn)为参数ϴ的极大似然估计值。
设(X1,X2,…,Xn)为总体X的一个样本，若ϴ ̂(x1,x2,…,xn)为参数ϴ的极大似然估计值，则称ϴ ̂(X1,X2,…,Xn)为参数ϴ的极大似然估计量。

* （2）区间估计

由于统计量ϴ ̂是一个随机变量，它会随着样本的随机抽取而变化，不会总是与ϴ相等，会存在或大、或小、或正、或负的误差。点估计量无法给出误差的范围，且无法反映这种近似的精确度。为了弥补这些不足，区间估计就是利用样本统计量ϴ ̂的某两个数值构成的区间去估计总体参数ϴ估计值的取值范围，同时还要给出区间包含ϴ真实值的可靠程度。例如，某地居民年人均收入在14000~15000元，就是一个区间估计。随机区间包含ϴ真实值的概率越大越好，这个概率称为置信度或置信水平(Confidence level)，用α表示。通常α取0.05或0.01。
区间估计通常指估计其95%置信区间，即有95%的把握认为该区间包含了总体参数。置信区间越窄反映了参数估计的精确度越高，影响它的因素一是置信水平，置信水平越高，置信宽度越大；二是样本量，样本量越大置信宽度越小。

### 回归分析(Regression Analysis)
回归分析是确定两个或两个以上变量间相互依赖的定量关系的一种统计分析方法，具体是通过多组自变量和因变量的样本数据，拟合出最佳的函数关系。如果该关系是线性函数关系，就是线性回归。对任何数据进行的回归建模，都可以抽象成如下表示：
设y为因变量数据，x为自变量数据（可以是多维），设两者之间的真实关系为：y = f(x)
关于构建的模型关系f(x)，可以是简单的线性关系（线性回归），也可以是复杂的“黑箱”模型（神经网络、支持向量机等）。回归建模的一般原则是在没有显著差异的情况下，优先选择更简单的模型。简单模型已足够充分建模，非要用更复杂的模型，则会适得其反（过拟合），降低模型的泛化（预测）能力。

### 假设检验
显著性检验是假设检验中最常用的一种方法，也是一种最基本的统计推断形式，其基本原理是先对总体的特征做出某种假设，然后通过抽样研究的统计推理进行检验，确定假设成立的可能性大小，如果可能性小则认为假设不成立；若可能性大，则还不能认为假设不成立。

注意，这个n-1是自由度，分母除以n-1是为了保证用样本方差估计总体方差时，得到的是无偏估计。自由度是计算样本统计量时能够自由取值的个数。对于总体方差是从n个样本自由地从总体里抽取。但是样本方差多了一个约束条件，它们的和除以n必须等于样本均值x，所以自由度n减1个约束条件对自由度的损失，等于n-1。

1. Hunter N.B. Moseley, Statistical Methods for Biologists, in Bioinformatics : A Practical Guide to the Analysis of Genes and Protein, 4th Edition, 2021, 555–582.