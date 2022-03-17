# RNA Analysis

1.1.1 二级结构预测-Mfold
口腔与阴道疱疹是由人疱疹病毒1与2（HHV-1与HHV-2，以前也叫HSV-1/HSV-2）感染引起。疱疹是伴随一生的疾病，因为HHV除了会在表皮细胞中活跃复制，产生明显特征的疱疹(lesions)，这些病毒可以进入神经元(neurons)，并在长时间内保持潜伏态(latent)。病毒如何建立与保持潜伏态的分子机制还未完全清楚，但研究发现HHV感染宿主细胞后会转录一个非编码RNA，LAT(latency-associated transcript)，参与在潜伏过程中下调其它病毒基因的表达。在被感染的神经元内检测到的RNA实际上是从原始LAT转录区域中剪切出的一个稳定的内含子序列。这里为了方便，我们就称这个稳定内含子为LAT。
在潜伏期中，除了在感染细胞内累积的LAT之外，大多数疱疹DNA是不会转录的。 编码LAT的HHV DNA区域被称为LAT-DNA。 LAT是由8.3 kb LAT-DNA剪接后产生的2.0 kb转录本（内含子）。 含有LAT-DNA的DNA区域被称为潜伏相关转录区域。那么LAT是否有重要的二级结构及二级结构对它的功能是否有重要作用？
LAT被认为能控制那些能产生活跃HHV-1病毒的基因表达（即当病毒为潜伏态时关闭这些基因的表达），并可以阻止受感染细胞的凋亡（程序性细胞死亡）。它发挥功能的机理还不清楚，但由于它是一个在宿主中稳定存在的RNA，我们可以假设LAT有特殊的二级结构对其功能相当重要。
mfold是知名的二级结构预测软件，这个程序采用最小能量计算来优化预测的结构。这里我们使用mfold的Web界面程序（图 9 7）来预测LAT二级结构。
1）	首先在NCBI的 nucleotide数据库查找HHV-1的完整基因组，并在搜索结果中限定RefSeq数据库的序列（NCBI登录号NC_001806.2）。
2）	在GenBank记录文本中查找LAT（浏览器Firefox中按快捷键Ctrl+F，查找时要用大小写 (Match Case)与完整单词(Whole Words) 匹配），可以找到标记为"LAT"的ncRNA特征项，可见有两个LAT区域，分别为HHV1GP00S01，基因组位置为“complement(<1..7569)”与HHV1GP00S02，基因组位置为“118777..127151”。
3）	在网页右边的"Change region shown"中选择"Selected region"并输入LAT任意长度的区域（如119200-119300）,然后按update View按钮，并选择FASTA格式，可查看此LAT序列的DNA序列。
注意：一般用于预测的RNA序列长度为100-150bp左右，序列太长将无法清楚观察RNA结构。
4）	由于我们想看这个区域转录的RNA折叠，需要将所Ts都替换成Us（U-A碱基配对与T-A的稳定性不同），可用记事本查找替换功能，将DNA序列复制到记事本，并将所有T全部替换为U。
5）	现在我们到mfold网络服务站点（http://unafold.rna.albany.edu/?q=mfold）
![mfold主页](https://raw.githubusercontent.com/adong77/bigbook/master/images/book/fig9-7.png)
图 9-7 mfold主页

6）	找到RNA折叠表单(RNA folding form)，输入你前面处理的fasta序列。注意：mfold有许多参数可以改变，但大多数参数可以用默认值来进行基本的结构预测。这里我们设定RNA序列设为线性(linear)，如果RNA序列的长度比较长(>800bp)，最好用批量(batch)任务提交，而不是immediate job。
7）	按Fold RNA提交任务，当任务完成时，你可以看到结果网页（或通过email通知）。结果中列出mfold发现的所有可能结构（图 9 8）（上限是参数中设置的数量），并提供不同格式的折叠图形的链接。点击每个结构下面的PDF或PNG等图形格式链接可以查看每个RNA结构。
注意：由于预测方法的限制与热力学参数的简化，第一个结构不一定为实际的RNA结构。
![mfold预测结果](https://raw.githubusercontent.com/adong77/bigbook/master/images/book/fig9-8.png)
图 9-8 mfold预测结果

