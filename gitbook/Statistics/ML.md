## 统计学习

* 机器学习 = 机器(计算机) + 学习
* 人的学习过程：读书-练习-测验-成绩
* 机器学习是一种通过利用数据，训练出模型，然后使用模型预测的方法。
![Machine-Learning-Concepts](http://www.ligene.cn/images/ML-concepts.png)

One of the best ways to study machine learning methods is to take the online courses. The one by Andrew Ng is awesome: https://www.coursera.org/learn/machine-learning

* 数据挖掘(data mining)是指从大量的数据中，挖掘出未知的且有价值的信息和知识的过程。
![爱式](https://latex.codecogs.com/svg.image?E=mc^{2})

* 强化学习
强化学习也使用未标记的数据对模型霆训练，与无监督学习相比，强化学习可以通过某种方式知道模型结果是否在逐步接近正确结果。在没有任何标签数据的情况下，强化学习先尝试做出一些行为，得到结果，判断结果是好是坏，根据反馈结果不断调整行为，直到找到最优的策略。强化学习能够学习到在什么情况下选择什么行为，可以得到最好的结果。

* 监督学习分为回归（Regression）和分类（Classification）两类。
* 回归（Regression）：其数据集是给定一个函数和他的一些坐标点，然后通过回归分析的算法，来估计原函数的模型，求得最符合这些数据集的函数解析式。然后我们就可以用来预估未知数据，输入一个自变量便会根据这个模型解析式输出因变量，这些自变量就是特征向量，因变量即为标签，而且标签的值是建立在连续范围的。
* 分类（Classfication）：其数据集由特征变量和标签组成，当你学习这些数据之后，给你一个只知道特征向量不知道标签的数据，让你求他的标签是哪一个？分类和回归的主要区别就是输出结果是连续还是离散。


### References
1. James, Witten, Hastie, and Tibshirani, An Introduction to Statistical Learning with Applications in R: http://faculty.marshall.usc.edu/gareth-james/ISL/
2. A visual introduction to machine learning:
    * http://www.r2d3.us/visual-intro-to-machine-learning-part-1/
    * http://www.r2d3.us/visual-intro-to-machine-learning-part-2/