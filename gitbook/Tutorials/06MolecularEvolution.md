## Molecular Evolution



1.1.1 PAML软件计算Ka/Ks
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


