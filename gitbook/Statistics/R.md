## R语言统计入门

> 本文简介了一些R语言的基础知识，希望读者能够理解并能利用R语言进行数据统计分析与作图的方法。

R是一款集数据分析与绘图功能于一体的编程语言环境(A Programming Environment for Data Analysis and Graphics)。R是优秀的统计工具，生物信息的数据统计或绘图任务一般都可使用R完成，同时它也是一种开放的编程语言，语法简单易学，非常灵活，可编制自己的函数扩展现有的功能。R属于GNU系统的一个自由、免费、源代码开放的软件，最初由新西兰奥克兰大学的Ross Ihaka和Robert Gentleman开发（两人名字都以R开头，因此称为R），现在由“R核心团队（the R Core Team）”负责开发。R是现今最受欢迎的数据分析和可视化平台之一(官网：https://www.r-project.org/)，可在多种平台下运行，包括Windows、macOS和Linux系统等。R is a free software environment for statistical computing and graphics. 做生物信息分析是避免不了使用R语言的，特别是R的bioconductor社区，在基因组学，尤其在单细胞测序数据分析上，已经是独步江湖了。

### 安装与运行
最新的R软件可以从CRAN (Comprehensive R Archive Network) 下载，网址为 http://cran.r-project.org/。CRAN有许多镜像站点，打开CRAN网页，点击左边的Mirrors链接，可以选择一个下载速度比较快的中国（China）镜像站点，如中国科技大学的镜像（https://mirrors.ustc.edu.cn/CRAN/）。鼠标单击“Download R for Windows”链接，下载适用Windows系统的版本，并选择下载基础(base)安装软件包。
直接安装后可以在桌面或开始菜单找到“R”图标来运行。若你使用的是64位Windows系统，R在默认安装条件下，会生成两个R图标，一个为32位软件(如R i386 3.5.1)，另一个为64位软件(如R x64 3.5.1)，数字为R的版本号。一般运行R x64 3.5.1即可。
![R运行界面](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/R-1.png)
图1 R运行界面

如图1所示，打开R后，就会显示控制台窗口(R Console)，在其命令提示符 (>)后可以输入命令或表达式(expressions)，回车后就输出命令运行结果：
> 2*3
[1] 6
因此，R可以当计算器用，这里结果前的[1]表示6是结果里的第一个元素(此例仅有一个，结果可以有多个元素)。
> R.Version()
此命令将给出你系统所安装的R版本等信息。注意:R是一种大小写敏感（case sensitive）的语言，输入命令要区分大小写！
如要退出R，可使用命令：
> q()	#或quit()
退出R前会询问是否保存当前的工作空间(workspace)，工作空间含有当前会话(session)定义的所有变量。不保存工作空间，则这些变量的数据就会丢失。如果保存工作区，下次运行R时只要在文件菜单选“加载工作空间”就可以导入此会话的所有命令与变量。

> ♫ Tip
在命令提示符（>）后，每次只能输入并执行一条命令。R也可以一次性执行写在脚本文件中的一组命令。编写R脚本的方法如下：鼠标点击R窗口的文件菜单，选择”新建程序脚本“，就可打开R编辑器，在其中可输入多行命令，再用R窗口的”执行代码“按钮（工具栏第三个图标）可运行全部代码，或先用鼠标选择部分代码，再执行此部分代码。
R编辑器内可用快捷链"Ctrl+R"逐行运行当前光标所在行的代码。

#### 查看帮助
要查看函数的说明，可以通过help()或它的快捷方式(?)来查看：
> help("log10")
>?"log10"
如果你不知道什么函数名，但知道函数的一些相关内容，可以通过help.search()它的快捷方式(??)查找帮助。如你要找一个函数来算一些数值的标准差，可以查找在描述中包含"deviation"的函数：
> help.search("deviation")
> ??"deviation"

### R变量
R中有多种数据类型，包括向量、矩阵、数据框（与数据集类似）以及列表（各种对象的集合）等。R创建的所有变量(标量、矢量、矩阵等)都是对象(objects)。注意R是一种区分大小写的解释型语言，R语言的变量要区分大小写！
R一般用箭头(<-)或等号(=)来给变量赋值：
> x <- 2*3 #数值
> y = "AUGGUGCC" #字符串，注意为英文双引号！
如果只输入变量名，那么就会显示这个R对象的内容：
> x
[1] 6
也可以使用print()函数显示变量内容：
> print(x)
[1] 6
可以用ls()函数将当前运行环境中的对象都列出来
> ls()
[1] "x" "y"
函数rm()用来删除对象，如果要删除所有对象，可以使用：
> rm(list=ls())
 
R对象有各种不同的类型(class)，包括标量(scalar)，向量(vector)，因子(factor)，矩阵(matrix)，数组(array)，数据框(data frame)，table 和列表(list)。 若按R对象的内在特征分，对象的样式(mode)分类可分为：数值(numeric)、字符(character)、逻辑(logical)等，使用class()函数和mode()函数可以查询对象的属性。

#### 向量（vector）
标量(如上述x)只能有一个元素，而矢量可以有多个元素构成。但每个在矢量中的元素的类型必须相同，如数值或字符。创建矢量可以用函数c()，即combine函数：
> myvector <- c(8, 6, 9, 10, 5)
> myvector
[1]  8  6  9 10  5
前面的[1]是矢量myvector的第一个元素的index。我们可以通过变量名加上中括号包括的索引值来读取变量的元素：
> myvector[4]
[1] 10
> myvector[2:4] #提取从位置2到4之间的元素
[1] 6 9 10
> myvector[myvector > 8] #提取向量中大于8的元素
[1] 9 10
> myvector[-4]  #利用负号(-)删除特定位置的元素
[1] 8 6 9 5
针对在一定范围内，有顺序的数据可以用冒号(:)生成：
> 1:6		#生成在1到6范围的整数
[1] 1 2 3 4 5 6

#### 矩阵(matrix)
矩阵就是一个二维的数值数组。矩阵和数组可看成是带维数的向量。创建矩阵的一个方便的方法是使用matrix函数：
> X <- matrix(1:12, nrow=3, byrow=T)
     [,1] [,2] [,3] [,4]
[1,]    1    2    3    4
[2,]    5    6    7    8
[3,]    9   10   11   12
注意矩阵默认是以列按行形式填充，这里byrow=T将矩阵改成以按行形式填充。
对矩阵进行操作的常用函数有rownames(), colnames(),转置函数t()(注意是小写t，与大写T代表“TRUE"不同)等。
> rownames(X)<-LETTERS[1:3] #LETTERS是包含大写字母A-Z的内置变量
> X
  [,1] [,2] [,3] [,4]
A    1    2    3    4
B    5    6    7    8
C    9   10   11   12
> t(X)
     A B  C
[1,] 1 5  9
[2,] 2 6 10
[3,] 3 7 11
[4,] 4 8 12

#### 因子（Factor）
因子可用来存储类别变量(categorical variables)和有序变量，如性别(男女)、成绩(高中低)等。这类变量不能用来计算而只能用来分类或计数。一个因子不仅包括类别变量本身，还包括变量不同的可能水平（即使它们在数据中不出现）。一般用factor()函数创建一个因子，下面是一些例子：
> X <- c(2,3,5,1,2,3,4,1)
> Xfactor <- factor(X)
[1] 2 3 5 1 2 3 4 1
Levels: 1 2 3 4 5
> Y <- factor(1:3, levels=1:5)
> Y
[1] 1 2 3
Levels: 1 2 3 4 5
> Z <- c("A", "B", "C", "D","B","A")
> Zfactor <- factor(Z)
> Zfactor
[1] A B C D B A
Levels: A B C D

函数levels()用来提取一个因子中可能的水平值：
> levels(Xfactor)
[1] "1" "2" "3" "4" "5"

函数summary()给出一个因子中水平的频率表：
> summary(Zfactor)
A B C D 
2 2 1 1

注意，数字形式的因子中的元素不能作为数值进行计算，但可以通过as.numeric()函数转换成数字。
> Xvector <- as.numeric(Xfactor)
同理，as.vector()可以把因子转变成字符串向量
> Zvector <- as.vector(Zfactor)

#### 数据框(data frame)
数据框也是二维数组(2D array)，与矩阵不同的地方是数据框中的数据可以是各种类型同时存在，如数值、字符串或者因子等。数据框是生物医学研究中最常用的数据记录格式，数据框中每行代表一个观测研究对象，每列代表研究对象一个特性的实验结果(图2)。
![数据框](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/R-2.png)
图2 数据框

可以用函数data.frame()创建数据框：
> x <- data.frame(Name = c("tom", "Jimmy", "alice"), Age = c(18, 20, 41), Score = c(90, 30, 77))
> x
   Name Age Score
1   tom  18    90
2 Jimmy  20    30
3 alice  41    77
可以str()函数来查看数据框的基本结构属性：
> str(x)
'data.frame':   3 obs. of  3 variables:
 $ Name : Factor w/ 3 levels "alice","Jimmy",..: 3 2 1
 $ Age  : num  18 20 41
 $ Score: num  90 30 77
下面介绍数据框中数据的提取方法：
> x[2,]   #提取某一行
   Name Age Score
2 Jimmy  20    30
> x$Name    #常用数据框的列名提取某一列，或用x[,1]
[1] tom   Jimmy alice
Levels: alice Jimmy tom
> x[x$Name == "alice",]$Age #或x[3,2]，提取某个点的数据
[1] 41
> x[1:2,1:3]   #提取前两行，前三列

#### 列表（list）
另一种变量list也可以含有多个元素，但与vector不同的是，它可以包含不同类型的元素，如元素即有字符，也有数值元素，甚至包含其它变量，如一个vector、矩阵甚至列表。与数据框不同的是，数据框一般具有相同的长度，而列表并无此特殊规定，所以数据框可以看成是长度相同的列表。
可以用函数list()创建列表：
> mylist <- list(name="Fred", wife="Mary", myvector)
> mylist
$name
[1] "Fred"
$wife
[1] "Mary"
[[3]]
[1]  8  6  9 10  5
列表中的元素are numbered，可以用索引值来取得，与vector不同，是列表名加上两个括号来包括的索引值来读取：
> mylist[[2]]
[1] "Mary"
> mylist[[3]]
[1]  8  6  9 10  5
列表中的元素are named，列表元素可以通过列表名加上“$"，再加上元素名来读取：
> mylist$wife
[1] "Mary"
可以atrributes()函数来查找元素名：
> attributes(mylist)
$names
[1] "name" "wife" ""
可以看到列表mylist有两个元素有名称，"name" 与"wife"。

#### 表格(table)
另一个可能遇到的R对象是table变量。如我们有一个小孩名字的矢量mynames,用table()函数就可以得到一个table变量，包括每个名字及其对应的孩子数:
> mynames <- c("Mary", "John", "Ann", "Sinead", "Joe", "Mary", "Jim", "John", "Simon")
>mytable <-  table(mynames)
> mytable
mynames
   Ann    Jim    Joe   John   Mary  Simon Sinead
     1      1      1      2      2      1      1
与列表一样，可以通过双中括号来得到table变量中的元素：
> mytable[[4]]
[1] 2
> mytable[["John"]]
[1] 2

### 常用函数
R有许多内置函数，如mean(), length(), print(), plot()等。下面介绍一些常用的函数，关于函数更详细的说明，请查看R的帮助文档。
#### 数值处理
#seq()函数生成一组有规律的数值，
> seq(2, length=4, 5)
[1] 2 3 4 5
 
#rep()函数生成一组有重复的数据，
> rep(1:3, each=2, time=3)
 [1] 1 1 2 2 3 3 1 1 2 2 3 3 1 1 2 2 3 3
 
#runif()函数生成均匀分布的随机数，如runif(10, 0, 3)  #生成10个在0到3之间的随机数
> x <- runif(10, 0, 3)
> x
 [1] 0.66087875 2.42687999 2.14814697 0.12664629 0.09590261 0.02613993
 [7] 1.10544266 1.26475600 1.67144153 2.83656489
 
#rnorm()函数生成正态分布的随机数，如rnorm(10, mean=2, sd=3）生成10个平均值为2，方差为3的正态分布的随机数。
> rnorm(10, mean=2, sd=3)
 [1]  1.061149769  0.524625250  4.549493933  7.403447844  5.364699910
 [6]  4.939417826 -0.003161921  1.808738263  3.938803880  2.667750108
 
#round()函数针对数值进行四舍五入的处理，设置参数为保留小数点后的位数。
> round(x, 1)
 [1] 0.1 0.6 2.5 2.4 1.5 2.8 1.8 0.5 1.0 1.2
 
#length()函数给出向量里元素的长度(个数)
> length(x)
[1] 10
#summary()函数对数据进行简要summary统计。
> summary(x)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.1296  0.6784  1.3907  1.4411  2.2368  2.8303 

#### 字符处理
#paste()是针对字符向量的连接编辑函数
> Y <- paste(LETTERS[1:5], 1:5, sep="-")
> Y
[1] "A-1" "B-2" "C-3" "D-4" "E-5"

#strsplit()是用于拆分字符串的函数
> strsplit(Y[1], "-")
[[1]]
[1] "A" "1"

#substr()函数是用于提取字符串的一部分内容
> substr("abcdef", 2,4)
[1] "bcd"
 
### 数据读取
在进行数据文件读取前，需要指定工作路径，可用getwd()与setwd()函数来显示或设置工作路径：
> getwd()	# Get Working Directory
> setwd("c://bigbook//20R")  #Set Working Directory
注意Windows路径用两条斜线
> dir() #显示目录下的内容

工作路径也可以通过R菜单(文件/改变工作目录)手工进行选择目录(图3)：
![改变目录](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/R-3.png)
图3 改变目录

根据不同数据文件类型，可以选择不同的R函数来读取数据，下面介绍两种常用的文件(txt与csv) 读取方法:
* 文本数据可使用read.table()函数
> dat <- read.table("file1.txt", header=TRUE)
由于read.table()默认以空格当间隔符，如果数据中存在缺失项，那么软件会错误地把前后两个或多个空格当成一个间隔符，造成导入数据出现错误。因此，在使用该函数的时候，特别要注意把缺失项使用"NA"来表示出来。
保存数据到文件可用write.table()函数 
> write.table(data, file="filex.txt", sep="\t")

* CSV格式文件可用read.csv()函数 
> dat <- read.csv("file1.csv", header=TRUE)
CSV文件为以逗号分隔的数据，这样不会出现因数据缺失而发生错行的情况，但要注意数据中的内容不能有逗号出现，特别当数据项中有描述性语句时需格外注意。
保存数据到CSV文件可用write.csv()函数：
> write.csv(data, file="filex.csv", sep="\t")

### R语言作图
R语言系统有非常强大的绘图函数，本节对数据作图进行基本介绍。
R语言中最常用的作图函数是plot()。这里用seq()生成x数据，runif()生成y,之后用默认参数运行plot()作图：
x <- seq(1:10)
y <- round(runif(10, min=0, max=10), 1)
plot(x, y)
可以通过plot()的参数修改，得到更佳的图片展示效果(图 20 4)，一般常用的参数如下：

(1)xlim, ylim参数可以定义X轴与Y轴的刻度范围
(2)main参数给定图片的标题；xlab与ylab用来定义X轴与Y轴的名称。
(3)pch参数用于定义绘制点的样式，pch用数字表示各种不同的图形标记，如数字1是空心圆(默认值),2是正三角，3是加号等。
(4)cex参数定义图标的大小，默认值为1，可用一个矢量如c(1:3)。

> plot(x,y,ylim=c(0,12), main="plot parameters", xlab="length", ylab="height", pch=19, cex=c(1:3))

![plot结果](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/R-4.png)
图4 plot结果

(5)col参数用于设定颜色，R语言中预定了657种颜色，可以使用color()要查看。
(6)plot()函数还可以绘制出点的连线图，type参数用于定义线条的类型，常用的类型有，"p"显示点，"l"显示线条， "b"显示点和线， "o"显示点在线上；lwd参数设定线的宽度，lty参数设定线条的性状。
> plot(x,y,ylim=c(0,12), main="plot parameters", xlab="length", ylab="height",pch=20, cex=1.5, type="b", lwd=2, lty=2)
 
另外，如果需要绘制不止一个数据的曲线，可以使用lines()函数来完成，用points()函数增加点，用text()可以增加显示文本，用arrows()画出一个箭头，用rect()画出一个方框等(图 20 5)。

> z <- round(rnorm(10, sd=2, mean=4), 1)
> lines(x,z,pch=1, cex=1.5, type="l", lwd=2, lty=1, col="red")
> legend("topright",c("black", "red"), col=c("black","red"), lwd=2)
> text(2, 10, "This is text")
> rect(4,10,6,11, col="green")
> arrows(6,8,7,8)

![plot作图参数](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/R-5.png)
图5 plot作图参数
 
R作图结果默认都是输出到同一个图形设备（Graphic device），后一个绘制的图会覆盖前一个图。如果你想同时绘制多种类型的图表，可以使用dev.new() 函数新建Device窗口，并在新窗口中绘制图表。
注意，鼠标选中某个Device窗口，并不能使当前窗口成为激活状态，需要使用dev.set()函数设置。不过，用鼠标选中某个Device窗口，可手动导出当前窗口的图表。可以使用dev.list()函数查看当前Device窗口列表。
如果要在一个图形设备绘制多个图，可使用par()设置默认的图形参数：
>par(mfrow=c(1,2)) #图形组合，一行两列图

![图形组合](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/R-6.png)
图6 图形组合

如果想把R作图直接保存为文件，可以用dev.off()函数关掉当前活动的图形设备，如下面命令将图片保存到工作目录的PDF文件：
> pdf("test.pdf", width=10, height=20)
> b <- c(1,3,2,6,4,7)
> plot(b)
> dev.off()
各种图形格式都有对应的命令，如png()，jpeg()，tiff()等。

### R编程
#### 函数
使用R内置函数可执行基本的统计任务。一般R的函数需要参数，即传给函数的变量，来进行一些操作，如log10()需要一个数值，计算基于10的log值：
> log10(100)
2

当你经常需要对一些数值做同样的运算，而R没有内置的函数，可以自己编写一个函数。函数是组织好的，可重复使用的，用来实现单一，或相关功能的代码段。例如下面自编的函数可以计算输入数值的平方加20：
> rfunc <- function(x) { return(20 + (x*x))； }

这个函数先计算x的平方，然后加上20。return()返回计算得到的值。这个函数就可以被重复使用：
> rfunc(10)
[1] 120
> rfunc(25)
[1] 645
注意，函数中如有几个表达式一定要用花括号包括在一起。当没有用return()函数，R函数默认返回最后一行表达式结果。
rcal<-function(x,y)
{
  z <- x^2 + y^2; 
  result<-sqrt(z);
  result;
}
> rcal(3,4) #调用函数
[1] 5
当你写了许多函数可以打包成一个程序包供别人使用。R包(package)是R函数、数据、帮助文件、预编译代码以一种定义完善的格式组成的集合。

#### 流程控制
到现在，我们主要用到了R语言对简单表达式赋值的语法。但是R作为一门编程语言也允许有条件执行和循环结构。
(a) 条件执行（conditional statements）
if (条件) 表达式
if (条件) 表达式1 else 表达式2
比如下面的代码，判断p值是否显著(小于0.05)：
p <- 0.1
if(p <= 0.05){
 print("p <= 0.05!")
}else{
print("p > 0.05!")
}
表达式内的多条语句要用一组用花括号括起来，以开括号({)开始，并以闭括号(})结束。

(b)循环结构(loop structure)
for(变量 in 向量) 表达式
while(条件) 表达式
注意while语句只要条件是真就会执行表达式。这个判断在循环的最开始，所以表达式可能从来不被执行。
v <- LETTERS[1:5]
for (i in v){
  if(i == 'D'){
    next
    #break
  }
  print(i)
}
* next：跳过循环的当次迭代，不终止循环，开始循环的下次迭代。
[1] "A"
[1] "B"
[1] "C"
[1] "E"
* break：当循环中遇到break语句时，循环立即终止。
[1] "A"
[1] "B"
[1] "C"

### 程序包(package)
R语言具有丰富的程序包，但许多R包并没有集成在基础安装包中，如果要使用它们需要额外安装。
* 安装R包
在Windows或MacOS中，你可以简单地使用R窗口的菜单（“程序包”）来安装R包。也可以使用以下命令来安装：
>install.packages("mypkg")  

如指定安装依赖包用命令：install.packages("mypkg", dependencies=TRUE)。
在Linux系统中，如果想让安装的R包让所有用户用，必须先以超级用户权限运行R(如sudo R)，然后R包会安装到系统的库目录，不然只会安装到用户目录，而其他用户将无法读取。
20.7.2  安装Bioconductor包
Bioconductor(www.bioconductor.org)是专门为生物信息开发的R包。安装方法如下：
>source("https://bioconductor.org/biocLite.R")
>biocLite("yeastExpData")

> ♫ Tip
bioconductor默认的下载地址都在国外，所以下载速度十分慢。但可以用它在国内的镜像来下载相关包，提高下载速度。
#指定一个离你最近的国内镜像
options(BioC_mirror="http://mirrors.ustc.edu.cn/bioc/")

在使用某个包前，需要使用library()命令载入程序包到工作环境中以进行相关的运算：
>library("yeastExpData") #导入包
同样如果不需要程序包可以用detach()函数卸载程序包：
>detach("yeastExpData")
注：你可以通过search()命令查看当前导入的包情况。




Reference:
1.	Peter Dalgaard, Introductory Statistics with R (R语言统计入门), 人民邮电出版社, 2014
2. Toivo GM Rebecca J Lai, Kate Haining, Greta Todorova, and Wilhelmiina. Introduction to R.  Available from: https://gabymahrholz.github.io/Intro_to_R/index.html
3. Chang W. R Graphics Cookbook, 2nd edition. Available from: https://r-graphics.org
4. The R Graph Gallery： https://www.r-graph-gallery.com/
5.李东风，R语言教程: https://www.math.pku.edu.cn/teachers/lidf/docs/Rbook/html/_Rbook/index.html