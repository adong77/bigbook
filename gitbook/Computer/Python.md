## Python教程
本教程专注于帮助初学者，尤其是生物信息分析人员快速学会Python的常用功能和使用方式，因此只精选了部分Python的功能，请额外参考Python经典教程A byte of python和它的中文版 来更好的理解Python. 本文档的概念和文字描述参考了A byte of python(中文版)，特此感谢。

###　Python 常用包
１．科学计算 Numpy, SciPy (也是安装python包的拦路虎直到有了conda)
２．类比于R的数据框操作包 Pandas
３．可视化工具 Seaborn (配合pandas), matplotlib (类比MATLAB), plotly (交互式绘图), ggplot (类比ggplot2)
４．网站开发 web.py, Django, Flask
５．任务调度和流程管理 Airflow (pipeline首选)
６．机器学习 scikit-learn (经典), PyML, Tensorflow (谷歌释放), pylearn2, Orange (图形界面的机器学习包)
７．网页抓取 Beautiful Soup，requests,
８．可重复编程 Jupyter
９．正则表达式 re

### 如何运行Python命令和脚本
* 对于LInux或Unix用户，直接在终端输入 python 然后回车即可打开交互式python解释器，如下图所示。在这个解释器了敲入任何合法的python语句即可执行。此外，所有的命令还可以存储到一个文件一起执行，如下图所示。我们有一个包含python程序的文件test.py，我们只要在终端输入python test.py并回车就可以运行这个文件。同时我们也可在终端通过输入chmod 755 test.py赋予程序test.py可执行权限，并在终端输入./test.py运行Python脚本。
* 对于Windows用户，可以通过“Windows键+R”调出“Run”窗口并输入“cmd”打开Windows命令解释器，输入python即可打开交互式python解释器。同时也可以双击安装后的软件的快捷方式打开图形界面的Python解释器，可以处理交互式命令和导入Python文件并执行。

* 对于交互式Python解释器，在使用结束后，通过键盘组合键Ctrl-d (Linux/Unix)或Ctrl-z (Windows)关闭。

* 对于初学者，本手册推荐直接在Jupyter Notebook下学习Python命令和脚本。我们这套教程也是用Jupyter Notebook写作而成，里面的代码可以随时修改和运行，并能同时记录你的脚本和输出，符合现在流行的“可重复性计算”的概念。

* Linux/Unix用户直接在终端(Terminal)进入你的目标文件夹cd /working_dir[回车]，然后在终端输入Jupyter notebook[回车]即可启动Jupyter notebook。
Jupyter notebook启动后会打开默认的浏览器（需要在图形用户界面下工作），这时可以新建或打开相应路径下的ipynb文件。

### Python语法
* 层级缩进。空白在Python中是很重要的，它称为缩进。在逻辑行首的空白（空格和制表符）用来决定逻辑行的缩进层次，从而用来决定语句的分组。这意味着同一层次的语句必须有相同的缩进。每一组这样的语句称为一个块。通常的缩进为4个空格, 在Ipython Notebook中为一个Tab键。

从下面这两个例子可以看出错误的缩进类型和对应的提示。
    * “unexpected indent” 表示在不该出现空白的地方多了空白，并且指出问题出在第三行(line 3)。
    * “expected an indented block” 表示应该有缩进的地方未缩进，也指出了问题所在行。
    * “unindent does not match any outer indentation level” 表示缩进出现了不一致，问题通常会在指定行及其前面的行。
    
```
print("Hello, Python!")
Hello, Python!
myname = input("Your name: ")
print("Hello", myname)
Your name: ct
Hello ct
```

