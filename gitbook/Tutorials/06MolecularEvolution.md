## Molecular Evolution

### 检测选择压力
中性理论的一个关键预测是种群间的每个核苷酸的替换率(substitution rate, d)应该等于种群内个体的突变率(mutation rate, u)。在一个基因组区域，假设突变都是严格中性的，我们可以期望观察到d ~ u。与中性突变相比，如果某个给定区域的替换率显著降低(序列保守)，说明它受到一定的负选择（negative selection）或净化选择（purifying selection），因为有些突变被清除(净化)出种群了。相反，如果我们观察到一个区域的替换速率显著升高，则预示这个区域受到正选择(positive selection)，因为突变被固定到种群的概率增加。因此通过比较一个基因区域的突变速率与替换速率的估计值，可以推测这个区域是否受正选择或负选择。
但是生物进化过程中，基因或多或少受自然选择作用，基因突变速率u并不好测量。根据中性进化有d ~ u的事实，我们可以找到一个近似中性进化的区域，用它的替换速率d代表基因突变速率u。假设突变速率在基因组水平上是稳定的，我们可以比较待检测区域的替换速率（d）与近似中性进化区域的替换速率（d0）。这个方法还有一个优点是减少替换率估算的系统误差，如通过序列比对并不能确定两物种间的确切分歧时间，但它是同时影响d与d0，可以通过比值d/d0而消除误差。
这个方法的关键是能不能找到合适的真正是中性进化的参考区域(reference regions)。通常我们用蛋白编码区的同义位点作为中性参考区域。由于同义突变不改变蛋白质的氨基酸序列，可能对表型没有影响(但是这一点还是有争议的)，因此它可被认为是选择中性的。经典的dN/dS检验基因的选择压力，一般用基因的4D同义位点作为中性参考位点来检测基因区域是否有受自然选择的作用，而测试区域是基因自身的非同义替换位点。也就是说，如果我们想知道改变氨基酸的突变是否受正选择的作用，可以通过研究两个物种同源基因的编码区序列比对，并用4D同义位点的同义替换速率(dS)与非同义位点的非同义替换速率(dN)的比较来检测选择压力。
♫ Note
基因所受的选择压力一般利用非同义突变率(dN)与同义突变率(dS)的比值(ω=dN/dS)来检验。
* ω=1(dN = dS)时，位点经历Neutral selection；
* ω<1(dN < dS)时，位点经历Purifying Selection；
* ω>1(dN > dS)时，位点经历Positive Selection。



### PAML软件计算Ka/Ks
在电脑中建立一个目录，并将本练习相关文件都放在此目录（百度网盘https://pan.baidu.com/s/1eMiHyb7mW4Nrbsfpw9JtdA 密码: txh5）。
使用PAML前要在WSL中安装PAML软件包:
`$sudo apt-get install paml`
（1）	准备文件：现在有一个含有4条Insulin基因编码序列(CDS)的文件（insulin_cds.fasta）。
（2）	用BioEdit打开序列，并检查序列名，如有序列名称比较长，修改序列名，使不超过10个字符。
（3）	 按住shift键拖动鼠标选择所有序列（左名称栏会变黑），再Ctrl+G，将DNA翻译成氨基酸序列。
（4）	 再点菜单Accessory Applications-> ClustalW Multiple Alignment运行ClustalW, 勾上Calculate NJ Tree, “FAST algorithm for guide tree”，并勾掉“Bootstrap NJ tree”，其它默认即可。
![ClustalW参数](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/book/fig6-11.png)

图 6-11 ClustalW参数

（5）	 运行完后显示新的比对窗口，同样先用鼠标全选序列名称，再按Ctrl+G，这样就得到按密码子比对后的DNA序列。
（6）	删除最后一个终止密码子。先把BioEdit工具Mode改成edit, 再鼠标拖动选择”TAG”，按delete键删除。
![ClustalW参数](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/book/fig6-12.jpg)

图 6-12 BioEdit编辑窗口

（7）	比对后的序列另存为Phylip格式文件，菜单File->Save as...，在保存窗口输入insulin_cds，保存类型选“Phylip 3.2”。
（8）	Windows资源管理器打开BioEdit默认的运行目录C:\BioEdit\Temp，使文件按时间降序排列，最前面一个文件扩展名为.dnd的文件(~F8A93~1.dnd)就是刚构建的NJ树。
（9）	用文本编辑器打开此文件，可以看到BioEdit中的序列名称由一串数字代替：0000000000是第一个序列(InsHuman)，0000000001是第二个序列(InsPig)，以此类推。分别将其它改成对应的序列名称。并另存为insulin_cds.dnd。
（10）	准备参数文件codeml.ctl：用记事本打开PAML提供的样本设置文件codeml.ctl，并修改如下内容
      seqfile = insulin_cds3.phy * sequence data filename
      treefile = insulin_cds.dnd     * tree structure file name
      outfile = insulin_out.txt   * main result file name
      runmode = -2  * 0: user tree;  1: semi-automatic;  2: automatic
                   * 3: StepwiseAddition; (4,5):PerturbationNNI; -2: pairwise
其它设置都为默认值，runmode=-2表示进行双双序列计算KaKs。

（11）	运行codeml计算KaKs: 
`$ codeml codeml.ctl`
运行结果就在配置文件指定的输出的文件insulin_out.txt。在Windows下用记事本打开，可以看到在文件后部分有各个序列间的dN/dS值：
2 (InsPig) ... 1 (InsHuman)
lnL = -529.514397
  0.91776  8.29967  0.05031
 
t= 0.9178  S=    58.2  N=   250.8  dN/dS=  0.0503  dN = 0.0672  dS = 1.3357


