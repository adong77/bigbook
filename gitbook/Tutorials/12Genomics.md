# 基因组学(Genomics)


### JRE安装
打开JAVA网址(java.com), 点击大红按钮Free Java Download，再点击大红按钮Agree and Start Free Download，下载Java安装程序，然后双击安装，跟普通安装程序一样。JAVA(64-bit)默认安装的路径在C:\Program Files\Java。

* 安装完后进行环境配置:

> 注意：JRE1.8之后安装程序会自动增加环境变量，不需要再自己手动配置环境变量。

打开环境变量的步骤：
右键选中我的电脑，点击属性，再选择高级系统设置，点击按钮“环境变量”。

1. JAVA_HOME 
变量值：C:\Program Files\Java\jre1.8.0_161
2. CLASSPATH 
.;%JAVA_HOME%\lib（注意前面的.）
3. Path
在变量值最前面添加变量值：%JAVA_HOME%\bin;


### 基因组变异分析
先以参考基因组为参考，利用MUMmer软件的nucmer工具对从头组装获得的多个基因组分别与参考基因组进行共线性分析，使用delta-filter工具提取一一对应的共线性区段(one-to-one alignment block)。再使用show-snps工具进行SNP与indel(<100bp)的鉴定。
MUMmer(Muximal Unique Match mer)是目前最广泛使用的共线性分析工具之一。它采用后缀树(suffix tree)算法，具体而言，首先找到两条序列之间给定长度的最大精确匹配，将匹配区域聚类形成较大不完全联配区域，最后向外扩展，形成空位(gap)的比对结果。其核心模块之一为nucmer用于相似性高的核苷酸序列比对，比对结果保留了很多信息，一般需要借助delta-filter工具进行过滤，利用show-coord工具将数据转换成便于阅读的格式，如果电脑安装有gnuplot模块，还可利用mummerplot工具实现比对结果的可视化。

