# 组学数据分析入门

* 组学数据(Omics data)

* [统计学习(机器学习)](Statistics/StatLearning.html)
* R语言的tidyverse语法可解决R在数据科学应用的痛点，可通过大神Hadley Wickham的作品《R数据科学》来学习。
* Reference: Grolemund G, Wickham H. R for Data Science (R数据科学). Available from: https://r4ds.had.co.nz/

![机器学习发展](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/book/fig18-1.png)
图 18 1 机器学习发展

![分类混淆矩阵](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/book/fig18-6.png)
图 18-6 分类混淆矩阵和相关指标计算公式

许多分类器是为测试样本产生一个实值或概率预测，然后将这个预测值与一个分类阈值进行比较，如果大于阈值则分为正类，反之为负类。例如在朴素贝叶斯分类器中，针对每一个测试样本预测出一个[0,1]之间的概率，然后将这个值与0.5比较，如果大于0.5则判断为正类，小于0.5则判断为负类。阈值的好坏直接反映了学习算法的泛化能力。
