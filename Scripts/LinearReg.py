import numpy as np

#创建数据
np.random.seed(0)
area = 2.5 * np.random.randn(100) + 25
price = 25 * area + 5 + np.random.randint(20, 50, size=len(area))

#将数据转换成二维数组
area = area.reshape(-1,1)
price = price.reshape(-1,1)

#创建一个模拟数据集
# X = np.random.rand(100, 1)    #有100个样本，每个样本有1个特征，不需要reshape
# y = 2 + 3 * X.squeeze() + np.random.randn(100)    #目标变量是特征的线性组合加上噪声

#打印前5条数据
print(area[:5])
print(price[:5])

#创建并训练模型
from sklearn.linear_model import LinearRegression

model = LinearRegression()
model.fit(area, price)

#模型预测
new_data = np.array([30]).reshape(-1,1)
predicted_price = model.predict(new_data)

print(f"The predicted price for an area of {new_data[0][0]} is {predicted_price[0][0]}")