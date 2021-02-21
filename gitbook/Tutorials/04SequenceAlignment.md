## Sequence Alignment

### 点阵图

### 空位罚分

### 局部比对
![全局比对与局部比对算法](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/book/fig4-6.png)
图 4 6全局比对与局部比对算法

### 1.1 双序列比对实践

我们可以利用Needleman-Wunsch算法来比较流感病毒HA片段。 首先，让我们看看2009年美国流行的H1N1病毒 - 参考毒株被指定为A/California/07/2009(H1N1)与另一个中国流行的人类季节性H5N1病毒A/goose/Guangdong/1/1996(H5N1)的序列比对。 
1.1.1 序列查找
（1）打开NCBI网站：https://www.ncbi.nlm.nih.gov；
（2）在网页上方搜索栏中将数据库类型从“All Datebases”改为“Nucleotide”，并在输入栏里键入所需病毒名称，如A/California/07/2009(H1N1)，点击search按钮；
（3）点击结果页面的左边栏“Source databases”的RefSeq，限定只显示RefSeq数据库中的序列，可在结果中找到含（HA）的结果：Influenza A virus (A/California/07/2009(H1N1)) segment 4 hemagglutinin (HA) gene, complete cds（Accession:NC_026433.1）。
（4）点击上面HA基因链接，在出现的页面中FEATURES部分找到CDS，点击CDS链接，页面下方出现序列显示工具栏，选择Display:FASTA，即可得到CDS序列。复制此CDS序列到一个文本文件，或选择右上角”Send to”，再选择”File”，保存到一个文件。
注意：此时请勿关闭网页。
（5）再回退到前面结果页面，找到CDS关键词后面的HA蛋白质注释(/protein_id="YP_009118626.1")，并点击“protein id=”后链接；在新出现的结果页面中选择右上角”Send to”,再选择”File”，并选择"FASTA"格式，即可保存氨基酸序列（图 4-8）。
![流感病毒HA蛋白质的检索结果](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/book/fig4-8.png)
图 4-8 流感病毒HA蛋白质的检索结果

（6）同上方法查找H5N1病毒A/goose/Guangdong/1/1996(H5N1)及其它流感病毒的基因与蛋白质序列。

1.1.2 序列比对

我们使用欧洲生物信息研究所（European Bioinformatics Institute）开发的一套比对工具CLUSTAL对齐序列。
（1）首先打开网址：https://www.ebi.ac.uk/Tools/msa；
（2）这里选择Clustal Omega程序，点击Launch Clustal Omega链接；
（3）复制前面下载的两条蛋白质序列到序列输入框，输入数据类型默认是Protein(如是DNA要选择DNA）；
（4）其它参数都采用默认设置，点击Submit运行比对序列；
比对结果如下图 4-9所示，顶部显示比对所用的程序clustalo，后面显示序列比对结果，匹配的氨基酸由“*”字符表示，点（. 或 :）代表不匹配，但氨基酸的理化性质相似，短划线（-）填补空位(gap)。
![clustal格式](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/book/fig4-9.png)
图 4-9 clustal格式
Clustal格式的序列比对下方有3种符号：
“*”：代表该列氨基酸完全相同；
“：”：代表该列氨基酸发生改变，但有较高度保守的氨基酸；
“.”：代表该列氨基酸发生改变，但含有一般保守的氨基酸。
而没有上述符号标志的氨基酸位点差异较大。

