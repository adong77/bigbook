# 组学数据分析入门(Data Analytics)

> Big data is data that contains greater **variety** arriving in increasing **volumes** and with ever-higher **velocity**. (Gartner's definition)


## 组学数据(Omics data)
The omics data that are produced by the instruments are called raw data, and their size (generally large), the types of file, and structure will depend on the technology that is used. Below we illustrate two such examples using Sanger sequencing and mass spectrometry.

In Sanger sequencing (Figure 1), DNA is labelled using fluorophores, and different nucleotides are marked with different colours. Upon acquisition, light signal is acquired and recording of the different colours can be used to reconstruct the DNA sequence.
![Processing Sanger sequencing data to a string](http://www.ligene.cn/images/book/sanger-sequencing.jpg)

In mass spectrometry, charged molecules are separated based on their mass-to-charge (M/Z) ratio and their intensities recorded to produce a spectrum. In proteomics, the molecules that are assayed are protein fragments called peptides. Upon fragmentation of peptides, the different between the M/Z peaks of the peptide fragment ions can be used to reconstruct the peptide sequence (Figure 2).
![De novo peptide sequencing using mass spectrometry](http://www.ligene.cn/images/book/de-novo-pep-sequencing.jpg)

The acquired data, even once processed, is still of very little use when it comes to understanding biology. Before samples are collected and data are generated, it is essential to carefully design a question of interest (research hypothesis) and the experiement that will allow to answer it. For example, if we want to understand the effect of a particular drug on cancer cells, and more specifically understand the effect on the transcription of all the expressed genes, on would need to measure gene expression (using for example RNA-Seq) in cancer cells in presence and absence of that drug.

* Link: https://uclouvain-cbio.github.io/WSBIM1207/sec-bioinfo.html

## 机器学习

* R语言的tidyverse语法可解决R在数据科学应用的痛点，可通过大神Hadley Wickham的作品《R数据科学》来学习。
Reference: Grolemund G, Wickham H. R for Data Science (R数据科学). Available from: https://r4ds.had.co.nz/

![机器学习发展](http://www.ligene.cn/images/book/fig18-1.png)
图 18 1 机器学习发展

混淆矩阵：真实类别，预测类别


许多分类器是为测试样本产生一个实值或概率预测，然后将这个预测值与一个分类阈值进行比较，如果大于阈值则分为正类，反之为负类。例如在朴素贝叶斯分类器中，针对每一个测试样本预测出一个[0,1]之间的概率，然后将这个值与0.5比较，如果大于0.5则判断为正类，小于0.5则判断为负类。阈值的好坏直接反映了学习算法的泛化能力。

深度学习是机器学习的分支，是一种试图通过其它简单的表示来表达复杂的表示，对表示进行高层抽象的算法。一幅图像可以使用多种方式来表示，如每个像素值构成的向量，或者更抽象地表示成一系列边、轮廓、特定形状指定的区域等。有时使用某些特定的表示方法，更容易从实例中学习任务。深度学习的好处之一就是，可以用非监督或半监督的特征学习和分层特征提取等高效算法来替代手工获取特征。

机器学习算法使用大量的数据，以迭代方式为特定任务做出预测或决策。在每次迭代中，使用损失函数(Loss function)或成本函数(Cost function)评估模型性能。由此产生的错误用于更新模型参数，希望模型会表现的更好，这个过程通常称为训练(training)。训练过程将模型预测结果与实际结果进行比较，不断调整模型参数，直到模型的预测结果达到预期的准确率。模型越复杂，即要拟合的参数数量越多，在训练集上产生的错误就越少，而在测试集上产生的错误却越多。这就是典型的过拟合(overfitting)风险。过拟合可能由多种原因造成，例如数据集可能不足以代表任务，在这种情况下，添加更多的数据有助于缓解问题；也可能是用于解决问题的模型太复杂，可通过正则化(Regularization)减少参数以降低模型的能力。欠拟合(underfitting)可能是模型过于简单，无法充分学习数据的特征和规律，导致模型在训练数据上表现不佳，同时也不能很好泛化到新的数据上。

## References
1. Rafael Irizarry, Introduction to Data Science-Data Analysis and Prediction Algorithms with R. https://rafalab.github.io/dsbook/
2. 李高磊,黄玮,孙浩,李余动, 机器学习在微生物组宿主表型预测中的应用，微生物学报, 2021，61(9):2581-2593
3. Namkung, J. (2020) Machine learning methods for microbiome studies. Journal of Microbiology 58, 206–216.