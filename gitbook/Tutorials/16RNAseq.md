# 转录组测序(RNA-seq)

* Basic RNA-seq processing: unix tools and IGV (http://bio.lundberg.gu.se/courses/vt13/rnaseq.html)

### 基因注释文件
GFF(General Feature Format)格式是一种简单、方便地对DNA、RNA及蛋白质序列的特征进行描述的一种数据格式，已经成为序列注释的通用格式。当前广泛使用的GFF格式为第3版，即GFF3。
GTF(Gene Transfer Format)格式主要用于对基因进行注释的数据格式，当前广泛使用的GTF格式为第2版，即GTF2。
GFF与GTF这两种格式的文件可以相互转换，它们的前8列是相同的，第9列虽然都是记录标签与值配对的情况，但是两者有所不同，在GTF文件中标签与值之间以空格分隔，并且每个特征之后都带有分号“；”(包括最后一个特征)。

| |GTF2|GFF3|
|:---|:---|:---|
|特征类型|必须注明|可以任意名称|
|属性|标签和值以空格分隔|标签和值以"="分隔|

GTF和GFF格式文件可以使用Cufflinks的工具gffread进行转换，代码如下：
```
#GFF文件转换成GTF
gffread my.gff3 -T -o my.gtf 
#GTF文件转换成GFF文件
gffread merged.gtf -o- > merged.gff3
```