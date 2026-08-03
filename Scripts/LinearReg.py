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

#==================================================
# PyTorch实现线性回归
# 在pyTorch中，自动微分的核心组件是torch.autograd模块。该模块会记录张量的操作历史，形成一个动态计算图，通过反向传播计算梯度。优化器则通过这些梯度调整参数，
#使模型逐步逼近目标。
import torch
import torch.nn as nn
import torch.optim as optim

#1.定义数据
#模拟输入数据（batch_size=2,输入特征维度=3）
inputs = torch.tensor([[1.0,2.0,3.0],[4.0,5.0,6.0]], requires_grad=True)
#目标标签
targets = torch.tensor([[10.0],[20.0]])

#2.定义简单的线性模型
#线性模型y=wx+b
class SimpleLinearModel(nn.Module):
    def __init__(self):
        super(SimpleLinearModel, self).__init__()
        self.linear = nn.Linear(3,1)
    def forward(self, x):
        return self.linear(x)
    
#实例化模型
model =  SimpleLinearModel()

#3.定义损失函数, 使用均方误差
criterion = nn.MSELoss()

#4.定义优化器,使用Adam
optimizer =  optim.Adam(model.parameters(), lr=0.01)

#5.开始训练,逐步讲解自动微分和优化器的原理
for epoch in range(3):  #假设训练3个批次
    #(1)前向传播：计算模型输出
    outputs = model(inputs)
    #(2)计算损失
    loss = criterion(outputs, targets)
    #(3)反向传播：计算梯度
    optimizer.zero_grad()   #清零之前的梯度
    loss.backward()         #自动计算梯度
    #(4)更新参数：利用优化器进行梯度下降
    optimizer.step()
    #打印每个Epoch的损失
    print(f"Epoch {epoch+1}, Loss: {loss.item():.4f}")


#运行结果如下:
#Epoch 1, Loss：251.4636
#Epoch 2, Loss: 250.7968
#Epoch 3, Loss: 250.1426

