# Sequence Alignment

对于核苷酸比对的打分矩阵一般较简单，例如BLAST程序用于核苷酸序列比对的打分矩阵，如果比对的两个核苷酸相同，则得分+5，反之得分为-4。也可以对嘌呤与嘌呤间或嘧啶与嘧啶间替换设置很小的罚分(-1)，而对嘌呤(A或G)和嘧啶(C或T)间替换则进行较高的罚分(-5)。
### 点阵图

### 空位罚分

### 局部比对
![全局比对与局部比对算法](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/book/fig4-6.png)
图 4 6全局比对与局部比对算法