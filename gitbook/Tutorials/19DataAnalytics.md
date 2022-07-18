# 组学大数据分析(Data Analytics)

* 组学数据(Omics data)

* R语言的tidyverse语法可解决R在数据科学应用的痛点，可通过大神Hadley Wickham的作品《R数据科学》来学习。
Reference: Grolemund G, Wickham H. R for Data Science (R数据科学). Available from: https://r4ds.had.co.nz/

![机器学习发展](http://www.ligene.cn/images/book/fig18-1.png)
图 18 1 机器学习发展

混淆矩阵：真实类别，预测类别


许多分类器是为测试样本产生一个实值或概率预测，然后将这个预测值与一个分类阈值进行比较，如果大于阈值则分为正类，反之为负类。例如在朴素贝叶斯分类器中，针对每一个测试样本预测出一个[0,1]之间的概率，然后将这个值与0.5比较，如果大于0.5则判断为正类，小于0.5则判断为负类。阈值的好坏直接反映了学习算法的泛化能力。

深度学习是机器学习的分支，是一种试图通过其它简单的表示来表达复杂的表示，对表示进行高层抽象的算法。一幅图像可以使用多种方式来表示，如每个像素值构成的向量，或者更抽象地表示成一系列边、轮廓、特定形状指定的区域等。有时使用某些特定的表示方法，更容易从实例中学习任务。深度学习的好处之一就是，可以用非监督或半监督的特征学习和分层特征提取等高效算法来替代手工获取特征。



## References
1. Rafael Irizarry, Introduction to Data Science-Data Analysis and Prediction Algorithms with R. https://rafalab.github.io/dsbook/
2. 李高磊,黄玮,孙浩,李余动, 机器学习在微生物组宿主表型预测中的应用，微生物学报, 2021，61(9):2581-2593