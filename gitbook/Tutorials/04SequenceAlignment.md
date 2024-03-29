# 序列比对(Sequence Alignment)


## 计分矩阵（Scoring Matrix）
### 碱基计分矩阵
对于核苷酸比对的打分矩阵一般较简单，例如BLAST程序用于核苷酸序列比对的打分矩阵，如果比对的两个核苷酸相同，则得分+5，反之得分为-4。也可以对嘌呤与嘌呤间或嘧啶与嘧啶间替换设置很小的罚分(-1)，而对嘌呤(A或G)和嘧啶(C或T)间替换则进行较高的罚分(-5)。

### 氨基酸计分矩阵
各种氨基酸在进化过程中，由于其自身的物理化学性质不同，一种氨基酸被另一种氨基酸替换的概率并不一样。  
1978年，Dayhoff等科学家对大量蛋白质家族进行统计学分析，观测到1572次氨基酸替换，构建了最原始的PAM矩阵（Percent Accepted Mutation，PAM），也叫MDM矩阵（Mutation Data Matrix）或 Dayhoff 矩阵。  

点突变模型基于进化的观点，如果两种氨基酸替换频繁，说明自然界接受这种替换，那么这对氨基酸替换得分就高。PAM矩阵一般会带一个正整数后缀，比如PAM1。这个后缀表示PAM1矩阵自乘次数，如PAM50矩阵为PAM1自乘50次（50次方）。一个PAM1就是一个进化的变异单位, 即1%的氨基酸改变，但这并不意味自乘100次（PAM100），每个氨基酸都发生变化，因为其中一些位置可能会经过多次突变，甚至可能会变回到原来的氨基酸。这种矩阵的缺点是一旦PAM1的矩阵有误差，那么自乘250次后得到的PAM250矩阵的误差就会变得很大。

![空位罚分公式](http://www.ligene.cn/images/book/PAM1.png)

* PAM矩阵的构造步骤：
    1. 构建序列相似（大于85％）的比对
    2. 计算氨基酸 j 的相对突变率mj（j被其它氨基酸替换的次数）
    3. 针对每个氨基酸对 i 和 j , 计算 j 被 i 替换次数
    4. 替换次数除以相对突变率（mj）
    5. 利用每个氨基酸出现的频度对j 进行标准化
    6. 取常用对数，得到PAM-1(i, j)
    7. 将PAM-1自乘N次，可以得到PAM-N。


### 空位罚分（Gap penalty）
序列在进化过程中，由于发生一个或多个碱基或氨基酸的插入或缺失会造成序列空位。在进行序列比对时，就需要考虑到这些问题，一般用空位罚分（Gap penalty）来处理。
用公式表示：
这里的参数代表：
![空位罚分公式](http://www.ligene.cn/images/book/seqAlign_gap.svg)
a： Gap opening，只要有一个空位出现，就以空位设置罚分
b： Gap extension，任一空位的扩大，以空位扩展罚分，一般长度越大，罚分越重
k： 空位数

## 局部比对

![全局比对与局部比对算法](http://www.ligene.cn/images/book/fig4-6.png)

图 4-6全局比对与局部比对算法

## 推荐阅读：
* 从水果连连看到两条序列比对: https://blog.csdn.net/u011262253/article/details/120933936