scikit-learn(简称sklearn)是基于Python语言的第三方机器学习库。scikit-learn是一个开源项目，包含目前几乎所有主流机器学习算法，其官方文档对每个算法都有详细的说明与示例，完全可以当成机器学习的教程来学习。scikit-learn的主要功能包括分类、回归、聚类、数据降维、模型选择和数据预处理六大部分。

## 安装scikit-learn
在安装scikit-learn之前，系统需要已经安装了Python语言的基本运行环境可。
使用Python的包管理工具pip进行安装：
`pip install scikit-learn`
安装完成后，在Python编译环境下运行以下代码检验安装是否成功：
`import sklearn`
如果成功导入scikit-learn库，没有报错，表明scikit-learn安装成功。

## 应用实例
对于具体的机器学习问题，通常可以分为三个步骤：
* 数据准备与预处理
* 模型选择与训练
* 模型验证与参数调优

下面通过简单的鸢尾花实例介绍机器学习开发的一般流程，包含从数据导入到模型选择，以及对模型进行训练和预测的整个过程。

### 数据准备
鸢尾花(Iris)数据集可以在scikit-learn的sklearn.datasets模块中找到，并使用模块的load_iris方法加载。鸢尾花数据集描述了三个不同的鸢尾花种类（setosa, versicolor, virginicsa），共有150个样本，每个样本有4个特征，分别为花萼(sepal)的长度与宽度，花瓣(petal)的长度与宽度。为了数据处理方便，该数据集将三个不同种类的花分别用0、1、2表示。
scikit-learn中的数据通常用大写的X表示，而标签用小写的y表示。scikit-learn中的train_text_split方法利用伪随机数生成器可以将数据集分为训练集和测试集并将数据随机打乱。train_text_split方法的输出为X_train、X_test、y_train和y_test，其中X_train包含75%的数据，X_test包含另外25%的数据。
```
import numpy as np
import sklearn
from sklearn.datasets import load_iris
iris_dataset = load_iris()
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(iris_dataset['data'], iris_dataset['target'], random_state=0)
print("X_train shape:", X_train.shape)
print("y_train shape:", y_train.shape)
```
输出结果：
X_train shape:(112, 4)
y_train shape:(112,)

在构建机器学习模型之前，首先应检查数据，以确定数据集的特征属性是否完整。检查数据的最佳方法之一就是将其可视化。
```
iris_dataframe = pd.DataFrame(X_train, columns= iris_dataset.feature_names)
pd.DataFrame.hist(iris_dataframe, figsize=(6, 6))
pd.plotting.scatter_matrix(iris_dataframe, figsize=(16, 12))
```

### 选择和训练模型
不同的机器学习模型针对某一特定问题有不同的执行效率和准确度，因此针对特定问题选择合适的模型非常重要。这里选择使用K近邻分类算法。
机器学习模型的构建主要分两大部分：模型训练和模型测试。模型训练是在数据集上训练机器学习模型的参数及拓扑结构，模型测试是对已训练模型的精度、准确度等进行测试。通常将数据集分为训练数据集与测试数据集两部分。训练数据集用来训练模型，模型训练好后，在测试集上测试模型的性能，以判断模型的泛化能力(generalization ability)。泛化能力的强弱是选择机器学习模型的重要依据。
```
from sklearn.neighbors import KNeighborsClassifier
knn = KNeighborsClassifier(n_neighbors=1)
knn.fit(X_train, y_train)
```
n_neighbors是knn中最重要的参数，可以通过交叉验证来设置一个合理的值。
接着使用fit方法在训练数据上进行拟合，kNN是一个有监督的学习算法，因此在拟合数据的时候，需要将已知的类别标签train_y与特征train_X一起输入到模型中进行数据拟合。

### 使用模型
对模型进行训练后，需要使用新数据对模型的性能进行预测。
```
X_new = np.array([[5,2.6,1,0.2]])
print("X_new.shape:", X_new.shape)
```
输出结果：
X_new.shape:(1, 4)

确定数据符合预期要求后，调用模型的predict方法对数据样本进行预测：
```
pred = knn.predict(X_new)
print("Prediction:", pred)
print("Predicted target name:", iris_dataset['target_names'][pred])
```
输出结果：
Prediction:[0]
Predicted target name:['setosa']
经过模型预测，此鸢尾花的品种属于setosa。

### 评估模型
使用训练好的模型，对测试集进行预测，预测结果与测试集的数据标签进行比较，通过计算准确率（鸢尾花品种预测正确所占的比例）来衡量模型的好坏。为了更好地评估模型在新数据集上的错误率，一般使用更复杂的方法-交叉验证(cross validation)。评估模型可以确定模型在数据集上的泛化能力，而模型优化可以提升模型的泛化能力。
```
 y_pred = knn.predict(X_test)
 print("Test set predictions:\n", y_pred)
 print("Test set score: {:.2f}".format(np.mean(y_pred == y_test)))
```
输出结果：
Test set score: 0.97
所得结果显示模型的精度为0.97，即正确率为97%。

### 保存模型
模型本身就是一个Python的对象，可以使用pickle的方式将模型转储到文件，但sklearn推荐使用其joblib接口，保存与加载模型都非常简单：
```
import joblib
joblib.dump(knn, '/tmp/model.pkl')        #保存模型
model = joblib.load('/tmp/model.pkl')       #加载模型
```
