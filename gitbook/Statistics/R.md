# R语言入门

> 本文简介了一些R语言的基础知识，希望读者能够理解并能利用R语言进行数据统计分析与绘图的方法。R is a free software environment for statistical computing and graphics.

R是一款集数据分析与绘图功能于一体的编程语言环境(A Programming Environment for Data Analysis and Graphics)，生物信息的数据统计或绘图任务一般都可使用R完成。R官网为：https://www.r-project.org/。

R是优秀的统计工具，同时它也是一种开放的编程语言，语法简单易学，非常灵活，可编制自己的函数扩展现有的功能。R属于GNU系统的一个自由、免费、源代码开放的软件，最初由新西兰奥克兰大学的Ross Ihaka和Robert Gentleman开发（两人名字都以R开头，因此称为R），现在由“R核心团队（the R Core Team）”负责开发。R是现今最受欢迎的数据分析和可视化平台之一，可在多种平台下运行，包括Windows、macOS和Linux系统等。 做生物信息分析是避免不了使用R语言的，特别是R的bioconductor社区，在基因组学，尤其在单细胞测序数据分析上，已经是独步江湖了。

## 安装与运行
最新的R软件可以从CRAN(Comprehensive R Archive Network)网站下载，网址为：[http://cran.r-project.org](http://cran.r-project.org/)。鼠标单击“Download R for Windows”链接，下载适用Windows系统的版本，并选择下载基础(base)安装软件包。CRAN有许多镜像站点，打开CRAN网页，点击左边的Mirrors链接，可以选择一个下载速度比较快的中国（China）镜像站点，如中国科技大学的镜像(https://mirrors.ustc.edu.cn/CRAN/)。下载后安装程序后，鼠标双击该文件按提示默认安装即可。
> 对于Ubuntu系统，只要运行命令：`apt-get install r-base`

### 运行
安装后可以在桌面或开始菜单找到“R”图标来运行。若你使用的是64位Windows系统，R在默认安装条件下，会生成两个R图标，一个为32位软件(如R i386 3.5.1)，另一个为64位软件(如R x64 3.5.1)，数字为R的版本号。一般运行R x64 3.5.1即可。
![R运行界面](http://www.ligene.cn/images/R-1.png)
图1 R运行界面

如图1所示，打开R后，就会显示控制台窗口(R Console)，在其命令提示符 (>)后可以输入命令或表达式(expressions)，回车后就输出命令运行结果：
```R
> 2*3
[1] 6
```
因此，R可以当计算器用，这里结果前的[1]表示6是结果里的第一个元素(此例仅有一个，结果可以有多个元素)。
```R
> R.Version() #查看R版本
```
此命令将给出你系统所安装的R版本等信息。在R的命令行中#后面的内容是不执行的，#号代表后面是命令注释。**注意:R是一种大小写敏感（case sensitive）的语言，输入命令要区分大小写！**

如要退出R，可使用命令：
```R
> q()	#或quit()
```
退出R前会询问是否保存当前的工作空间(workspace)，工作空间含有当前会话(session)定义的所有变量。不保存工作空间，则这些变量的数据就会丢失。如果保存工作区，下次运行R时只要在文件菜单选“加载工作空间”就可以导入此会话的所有命令与变量。

#### 运行脚本
在命令提示符（>）后，每次只能输入并执行一条命令。R也可以一次性执行写在脚本文件中的一组命令。编写R脚本的方法如下：
* 鼠标点击R窗口的文件菜单，选择”新建程序脚本“，就可打开R编辑器，
* 在其中可输入多行命令，
* 再用R窗口的”执行代码“按钮（工具栏第三个图标）可运行全部代码，或先用鼠标选择部分代码，再执行此部分代码。

> [!TIP]
> R编辑器内可用快捷链"Ctrl+R"逐行运行当前光标所在行的代码, "Ctrl+Enter"运行全部代码。

### 查看帮助
要查看函数的说明，可以通过help()或它的快捷方式(?)来查看：
```R
> help("log10")
>?"log10"
```
如果你不知道什么函数名，但知道函数的一些相关内容，可以通过help.search()它的快捷方式(??)查找帮助。如你要找一个函数来算一些数值的标准差，可以查找在描述中包含"deviation"的函数：
```R
> help.search("deviation")
> ??"deviation"
```
R作为一个开源软件有强大的社区支持，可容易获得社区帮助，国外活跃的社区有GitHub和Stack Overflow等，国内的R语言社区有统计之都(COS)及其旗下的COS论坛。


## R变量
R中有多种数据类型，包括向量、矩阵、数据框（与数据集类似）以及列表（各种对象的集合）等。R创建的所有变量(标量、矢量、矩阵等)都是对象(objects)。注意R是一种区分大小写的解释型语言，R语言的变量要区分大小写！
R可用箭头(<-)或等号(=)来给变量赋值,一般建议用箭头符号(<-)：
```R
> x <- 2*3 #数值
> y = "AUGGUGCC" #字符串，注意为英文双引号！
```

如果只输入变量名，那么就会显示这个R对象的内容：
```R
> x
[1] 6
```
也可以使用print()函数显示变量内容：
```R
> print(x)
[1] 6
```
可以用ls()函数将当前运行环境中的对象都列出来：
```R
> ls()
[1] "x" "y"
```
函数rm()用来删除对象，如果要删除所有对象，可以使用：
```R
> rm(list=ls())
```
 
R对象有各种不同的类型(class)，包括标量(scalar)，向量(vector)，因子(factor)，矩阵(matrix)，数组(array)，数据框(data frame)，表格(table)和列表(list)。 若按R对象的内在特征分，对象的样式(mode)分类可分为：数值(numeric)、字符(character)、逻辑(logical)等，使用class()函数和mode()函数可以查询对象的属性。
```R
> x = pi*10^2 #pi是圆周率
> class (x) #x的class
[1] "numeric"
> typeof (x) #x的type
[1] "double"
```

### 标量(scalar)
最简单的R数据类型是标量，主要有6种：逻辑型logical（TRUE,FALSE）、数值型numeric（1.22）、整型integer（12）、字符型character("good","爸爸")、原型raw(48 65 6c 6c 6f)、复数complex(4i+1)。最常用的是前四种。
```R
> 5 < 6
  [1] TRUE
```

### 向量（vector）
标量(如上述x)只能有一个元素，而向量可以有多个元素构成。但每个在向量中的元素的类型必须相同，如数值或字符。创建向量可以用函数c()，即combine/concatenate函数，表示连接：
```R
> myvector <- c(8, 6, 9, 10, 5)
> myvector
[1]  8  6  9 10  5
```
前面的[1]是向量myvector的第一个元素的index。我们可以通过变量名加上中括号包括的索引值来读取变量的元素：
```R
> myvector[4]
[1] 10
> myvector[2:4] #提取从位置2到4之间的元素
[1] 6 9 10
> myvector[myvector > 8] #提取向量中大于8的元素
[1] 9 10
> myvector[-4]  #利用负号(-)删除特定位置的元素
[1] 8 6 9 5
```
针对在一定范围内，有顺序的数据可以用冒号(:)生成：
```R
> 1:6		#生成在1到6范围的整数
[1] 1 2 3 4 5 6
> x = sample(1:200000,10000)  #从1,...,200000中随机不放回地抽取10000个值作为样本
> z = sample(x, 10, rep=TRUE) #从有放回地随机抽取10个值作为样本
> print(z)
 [1] 150517  48627 141260 179097 159144  12734 179539  91287 197402  13812
> sample(1:100,20,prob=1:100) #从1:100中不等概率随机抽样, 各数目抽到的概率与1:100成比例
```
向量化计算是R语言特有的一种并行计算方式，即当你对一个向量进行操作时，程序会对向量中每个元素进行分别计算，计算结果以向量的形式返回。向量化计算基本可以取代循环计算，高效的完成计算任务。
```R
> x=rep(1,10); y=1:3
> x*z   #向量乘法(如果长度不同，R给出警告和结果)
 [1] 1 2 3 1 2 3 1 2 3 1
 Warning message:
 In x * z : longer object length is not a multiple of shorter object length
```
* 与向量有关的函数
函数: min(x)最小值, max(x)最大值, which.min(x)显示最小值所在位置, which.max(x)显示最大值所在位置, sum(x)加, length(x)x的长度,mean(x)均值, median(x)中值, var(x)方差, sd(x)标准差, sqrt(x)平方根, abs(x)取绝对值, unique(x)去冗余, intersect(x)取交集, union(x,y)取并集, setdiff(x,y)差集, setequal(x,y)判断两向量是否相同(对顺序无要求), identical(x,y)判断两向量是否相同(对顺序有要求)。

### 因子（Factor）
因子可用来存储类别变量(categorical variables)和有序变量，如性别(男女)、成绩(高中低)等。这类变量不能用来计算而只能用来分类或计数。一个因子不仅包括类别变量本身，还包括变量不同的可能水平（即使它们在数据中不出现）。一般用factor()函数创建一个因子，下面是一些例子：
```R
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
```

函数levels()用来提取一个因子中可能的水平值：
```R
> levels(Xfactor)
[1] "1" "2" "3" "4" "5"
```

函数summary()给出一个因子中水平的频率表：
```R
> summary(Zfactor)
A B C D 
2 2 1 1
```
注意，数字形式的因子中的元素不能作为数值进行计算，但可以通过as.numeric()函数转换成数字。
```R
> Xvector <- as.numeric(Xfactor)
```
同理，as.vector()可以把因子转变成字符串向量:
```R
> Zvector <- as.vector(Zfactor)
```

### 矩阵(matrix)
矩阵就是一个二维的数值数组。矩阵和数组可看成是带维数的向量。创建矩阵的一个方便的方法是使用matrix函数：
```R
> X <- matrix(1:12, nrow=3, byrow=T)
     [,1] [,2] [,3] [,4]
[1,]    1    2    3    4
[2,]    5    6    7    8
[3,]    9   10   11   12
```
注意矩阵默认是以按列形式填充，这里byrow=T将矩阵改成以按行形式填充。
对矩阵进行操作的常用函数有rownames(), colnames(),转置函数t()等。
```R
> rownames(X)<-LETTERS[1:3] #LETTERS是包含大写字母A-Z的内置变量
> X
  [,1] [,2] [,3] [,4]
A    1    2    3    4
B    5    6    7    8
C    9   10   11   12
> dim(X)  #行列数目
[1] 3 4
> t(X)  #注意转置函数t()是小写t，与大写T代表“TRUE"不同
     A B  C
[1,] 1 5  9
[2,] 2 6 10
[3,] 3 7 11
[4,] 4 8 12
> apply (x, 1, mean) #对行(第一维)求均值
> apply (x, 2, sum) #对列(第二维)求和
```

### 数据框(data frame)
数据框也是二维数组(2D array)，与矩阵不同的地方是数据框中的数据可以是各种类型同时存在，如数值、字符串或者因子等。数据框是生物医学研究中最常用的数据记录格式，数据框中每行代表一个观测研究对象，每列代表研究对象一个特性的实验结果(图2)。
![数据框](http://www.ligene.cn/images/R-2.png)
图2 数据框

可以用函数data.frame()创建数据框：
```R
> x <- data.frame(Name = c("tom", "Jimmy", "alice"), Age = c(18, 20, 41), Score = c(90, 30, 77))
> x
   Name Age Scorep
1   tom  18    90
2 Jimmy  20    30
3 alice  41    77
```
可以使用内置命令str()(structure的简写)来查看数据框的基本结构属性：
```R
> str(x)
'data.frame':   3 obs. of  3 variables:
 $ Name : Factor w/ 3 levels "alice","Jimmy",..: 3 2 1
 $ Age  : num  18 20 41
 $ Score: num  90 30 77
> names(x)  #查看数据的变量名字
```
下面介绍数据框中数据的提取方法：
```R
> x[2,]   #提取某一行
   Name Age Score
2 Jimmy  20    30
> x$Name    #常用数据框的列名提取某一列，或用x[,1]
[1] tom   Jimmy alice
Levels: alice Jimmy tom
> x[x$Name == "alice",]$Age #或x[3,2]，提取某个点的数据
[1] 41
> x[1:2,1:3]   #提取前两行，前三列
> head(x) #头几行数据，与x[1:10,]相同
```

### 列表（list）
另一种变量list也可以含有多个元素，但与vector不同的是，它可以包含不同类型的元素，如元素即有字符，也有数值元素，甚至包含其它变量，如一个vector、矩阵甚至列表。与数据框不同的是，数据框一般具有相同的长度，而列表并无此特殊规定，所以数据框可以看成是长度相同的列表。
可以用函数list()创建列表：
```R
> mylist <- list(name="Fred", wife="Mary", myvector)
> mylist
$name
[1] "Fred"
$wife
[1] "Mary"
[[3]]
[1]  8  6  9 10  5
```
列表中的元素are numbered，可以用索引值来取得，与vector不同，是列表名加上两个括号来包括的索引值来读取：
```R
> mylist[[2]]
[1] "Mary"
> mylist[[3]]
[1]  8  6  9 10  5
```
列表中的元素are named，列表元素可以通过列表名加上“$"，再加上元素名来读取：
```R
> mylist$wife
[1] "Mary"
```
可以atrributes()函数来查找元素名：
```R
> attributes(mylist)
$names
[1] "name" "wife" ""
```
可以看到列表mylist有两个元素有名称，"name" 与"wife"。

### 表格(table)
另一个可能遇到的R对象是table变量。如我们有一个小孩名字的矢量mynames,用table()函数就可以得到一个table变量，包括每个名字及其对应的孩子数:
```R
> mynames <- c("Mary", "John", "Ann", "Sinead", "Joe", "Mary", "Jim", "John", "Simon")
>mytable <-  table(mynames)
> mytable
mynames
   Ann    Jim    Joe   John   Mary  Simon Sinead
     1      1      1      2      2      1      1
```

与列表一样，可以通过双中括号来得到table变量中的元素：
```R
> mytable[[4]]
[1] 2
> mytable[["John"]]
[1] 2
```

## R语言编程

### 流程控制
到现在，我们主要用到了R语言对简单表达式赋值的语法。但是R作为一门编程语言也允许有条件执行和循环结构。

* (a) 条件执行（conditional statements）

if (条件) 表达式  
if (条件) 表达式1 else 表达式2  

比如下面的代码，判断p值是否显著(小于0.05)：
```R
p <- 0.1
if(p <= 0.05){
 print("p <= 0.05!")
}else{
print("p > 0.05!")
}
```
表达式内的多条语句要用一组用花括号括起来，以开括号({)开始，并以闭括号(})结束。

* (b)循环结构(loop structure)

for(变量 in 向量) 表达式   
while(条件) 表达式  

注意: while语句只要条件是真就会执行表达式。这个判断在循环的最开始，所以表达式可能从来不被执行。
```R
v <- LETTERS[1:5]
for (i in v){
  if(i == 'D'){
    next
    #break
  }
  print(i)
}
# next：跳过循环的当次迭代，不终止循环，开始循环的下次迭代。
[1] "A"
[1] "B"
[1] "C"
[1] "E"
# break：当循环中遇到break语句时，循环立即终止。
[1] "A"
[1] "B"
[1] "C"
```

### 函数
使用R内置函数可执行基本的统计任务。一般R的函数需要参数，即传给函数的变量，来进行一些操作，如log10()需要一个数值，计算基于10的log值：
```R
> log10(100)
2
```
当你经常需要对一些数值做同样的运算，而R没有内置的函数，可以自己编写一个函数。函数是组织好的，可重复使用的，用来实现单一，或相关功能的代码段。例如下面自编的函数可以计算输入数值的平方加20：
```R
> rfunc <- function(x) { return(20 + (x*x))； }
```
这个函数先计算x的平方，然后加上20。return()返回计算得到的值。这个函数就可以被重复使用：
```R
> rfunc(10)
[1] 120
> rfunc(25)
[1] 645
```
注意，函数中如有几个表达式一定要用花括号包括在一起。当没有用return()函数，R函数默认返回最后一行表达式结果。
```R
rcal<-function(x,y)
{
  z <- x^2 + y^2; 
  result<-sqrt(z);
  result;
}
> rcal(3,4) #调用函数
[1] 5
```
当你写了许多函数可以打包成一个程序包供别人使用。R包(package)是R函数、数据、帮助文件、预编译代码以一种定义完善的格式组成的集合。


### 常用函数

R有许多内置函数，如mean(), length(), print(), plot()等。下面介绍一些常用的函数，关于函数更详细的说明，请查看R的帮助文档。

#### 数值处理
* seq()函数生成一组有规律的数值
```R
> seq(2, length=4, 5)
[1] 2 3 4 5
> seq(0, 10, by = 2) #从0到10，每次增加2
[1]  0  2  4  6  8 10
```
* rep()函数生成一组有重复的数据
```R
> rep(1:3, each=2, time=3)
 [1] 1 1 2 2 3 3 1 1 2 2 3 3 1 1 2 2 3 3
```
* runif()函数生成均匀分布的随机数，如runif(10, 0, 3)  #生成10个在0到3之间的随机数
```R
> x <- runif(10, 0, 3)
> x
 [1] 0.66087875 2.42687999 2.14814697 0.12664629 0.09590261 0.02613993
 [7] 1.10544266 1.26475600 1.67144153 2.83656489
```

* rnorm()函数生成正态分布的随机数，如rnorm(10, mean=2, sd=3）生成10个平均值为2，方差为3的正态分布的随机数。
```R
> rnorm(10, mean=2, sd=3)
 [1]  1.061149769  0.524625250  4.549493933  7.403447844  5.364699910
 [6]  4.939417826 -0.003161921  1.808738263  3.938803880  2.667750108
```

* round()函数针对数值进行四舍五入的处理，设置参数为保留小数点后的位数。
```R
> round(x, 1)
 [1] 0.1 0.6 2.5 2.4 1.5 2.8 1.8 0.5 1.0 1.2
``` 
* length()函数给出向量里元素的长度(个数)
```R
> length(x)
[1] 10
```
* summary()函数对数据进行简要summary统计。
```R
> summary(x)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.1296  0.6784  1.3907  1.4411  2.2368  2.8303 
```

#### 字符处理
* paste()是针对字符向量的连接编辑函数,默认在连接的字符串之间加上一个空格。如果不需要空格，则可以使用paste0()函数。
```R
> Y <- paste(LETTERS[1:5], 1:5, sep="-")
> Y
[1] "A-1" "B-2" "C-3" "D-4" "E-5"
```

* strsplit()是用于拆分字符串的函数
```R
> strsplit(Y[1], "-")
[[1]]
[1] "A" "1"
```

* substr()函数是用于提取字符串的一部分内容
```R
> substr("abcdef", 2,4)
[1] "bcd"
```

## 数据读取
在进行数据文件读取前，需要指定工作路径，可用getwd()与setwd()函数来显示或设置工作路径：
```R
> getwd()	# Get Working Directory
> setwd("c://bigbook//20R")  #Set Working Directory
# 注意Windows路径用两条斜线, 路径要用反斜杠"/"或者双斜杠"\\"。
> dir() #显示目录下的内容
```
工作路径也可以通过R菜单(文件/改变工作目录)手工进行选择目录(图3)：
![改变目录](http://www.ligene.cn/images/R-3.png)  
图3 改变目录

根据不同数据文件类型，可以选择不同的R函数来读取数据，下面介绍两种常用的文件(txt与csv) 读取方法:
* 文本数据可使用read.table()函数
```R
> dat <- read.table("file1.txt", header=TRUE)
```
由于read.table()默认以空格当间隔符，如果数据中存在缺失项，那么软件会错误地把前后两个或多个空格当成一个间隔符，造成导入数据出现错误。因此，在使用该函数的时候，特别要注意把缺失项使用"NA"来表示出来。
保存数据到文件可用write.table()函数 
```R
> write.table(data, file="filex.txt", sep="\t")
```

* CSV格式文件可用read.csv()函数 
```R
> dat <- read.csv("file1.csv", header=TRUE)
```
CSV文件为以逗号分隔的数据，这样不会出现因数据缺失而发生错行的情况，但要注意数据中的内容不能有逗号出现，特别当数据项中有描述性语句时需格外注意。
保存数据到CSV文件可用write.csv()函数：
```R
> write.csv(data, file="filex.csv", sep="\t")
```

## R语言作图
R语言系统有非常强大的绘图函数，本节对数据作图进行基本介绍。
R语言中最常用的作图函数是plot()。这里用seq()生成x数据，runif()生成y,之后用默认参数运行plot()作图：
```R
x <- seq(1:10)
y <- round(runif(10, min=0, max=10), 1)
plot(x, y)
```
可以通过plot()的参数修改，得到更佳的图片展示效果(图4)，
```R
> plot(x,y,ylim=c(0,12), main="plot parameters", xlab="length", ylab="height", pch=19, cex=c(1:3))
```
![plot结果](http://www.ligene.cn/images/R-4.png)
图4 plot结果

一般常用的参数如下：  
(1)xlim, ylim参数可以定义X轴与Y轴的刻度范围。  
(2)main参数给定图片的标题；xlab与ylab用来定义X轴与Y轴的名称。  
(3)pch参数用于定义绘制点的样式，pch用数字表示各种不同的图形标记，如数字1是空心圆(默认值),2是正三角，3是加号等。  
(4)cex参数定义图标的大小，默认值为1，可用一个矢量如c(1:3)。  
(5)col参数用于设定颜色，R语言中预定了657种颜色，可以使用color()要查看。
(6)plot()函数还可以绘制出点的连线图，type参数用于定义线条的类型，常用的类型有，"p"显示点，"l"显示线条， "b"显示点和线， "o"显示点在线上；lwd参数设定线的宽度，lty参数设定线条的性状。
```R
> plot(x,y,ylim=c(0,12), main="plot parameters", xlab="length", ylab="height",pch=20, cex=1.5, type="b", lwd=2, lty=2)
```
另外，如果需要绘制不止一个数据的曲线，可以使用lines()函数来完成，用points()函数增加点，用text()可以增加显示文本，用arrows()画出一个箭头，用rect()画出一个方框等(图5)。
```R
> z <- round(rnorm(10, sd=2, mean=4), 1)
> lines(x,z,pch=1, cex=1.5, type="l", lwd=2, lty=1, col="red")
> legend("topright",c("black", "red"), col=c("black","red"), lwd=2)
> text(2, 10, "This is text")
> rect(4,10,6,11, col="green")
> arrows(6,8,7,8)
```
![plot作图参数](http://www.ligene.cn/images/R-5.png)
图5 plot作图参数
 
R作图结果默认都是输出到同一个图形设备（Graphic device），后一个绘制的图会覆盖前一个图。如果你想同时绘制多种类型的图表，可以使用dev.new() 函数新建Device窗口，并在新窗口中绘制图表。
注意，鼠标选中某个Device窗口，并不能使当前窗口成为激活状态，需要使用dev.set()函数设置。不过，用鼠标选中某个Device窗口，可手动导出当前窗口的图表。可以使用dev.list()函数查看当前Device窗口列表。

如果要在一个图形设备绘制多个图，可使用par()设置默认的图形参数：
```R
>par(mfrow=c(1,2)) #图形组合，一行两列图
```

![图形组合](http://www.ligene.cn/images/R-6.png)
图6 图形组合

如果想把R作图直接保存为文件，如产生一个TIFF或PDF格式的图片，可以利用tiff()或pdf()打开这些文件类型的设备。执行绘图命令后，必须要用dev.off()函数关掉当前活动的图形设备。否则，已绘制的图形将被后面的屏幕输出所覆盖。例如，下面命令将图片保存到工作目录的PDF文件：
```R
> tiff(filename="test.tif", width=1000, height=1000)
> b <- c(1,3,2,6,4,7)
> plot(b)
> dev.off()
```
该代码将产生一个tiff图像，高和宽都是1000像素。在纸上，这通常比10cm宽一点。如果你发现图形中的文字已经变得很小，可以调整图的边距和文本大小。这些图形参数可以通过par()函数来设置。
各种图形格式都有对应的命令，如png()，jpeg()，tiff()等。对于PDF图形设备，宽度与高度不是用像素指定，而是以英寸为单位。原则上，你仍然可以使用像素，但别忘了要将像素除以分辨率，否则将得到一个巨大的文件。例如，要得到300DPI的分辨率的文件，可以将像素的数值除以300：
```R
> pdf(filename="test.pdf", width=1000/300, height=1000/300)
```

## 程序包(package)
R语言具有丰富的程序包，但许多R包并没有集成在基础安装包中，如果要使用它们需要额外安装。R语言综合档案库CRAN（The Comprehensive R Archive Network）包含了大量开发者贡献的扩展包，截至2020年5月30日，总共有15707个包，涉及统计分析、数值计算、量化投资、金融分析、数据挖掘、机器学习、生物信息学、生物制药、数据可视化等各个领域。
### 安装R包
* 在Windows或MacOS中，你可以简单地使用R窗口的菜单（“程序包”）来安装R包。也可以使用以下命令来安装：
```R
> install.packages("mypkg")  
> install.packages("mypkg", dependencies=TRUE)  #指定安装依赖包用命令
> install.packages("mypkg", repos='mirror.lzu.edu.cn/CRAN') #指定CRAN国内镜像
```
* 在Linux系统中，如果想让安装的R包让所有用户用，必须先以超级用户权限运行R(如sudo R)，然后R包会安装到系统的库目录，不然只会安装到用户目录，而其他用户将无法读取。

### 安装Bioconductor包
Bioconductor(www.bioconductor.org)是专门为生物信息开发的R包。安装方法如下：
```R
>source("https://bioconductor.org/biocLite.R")  #https or http
>biocLite("yeastExpData")
```

> [!TIP]
> bioconductor默认的下载地址都在国外，所以下载速度十分慢。但可以用它在国内的镜像来下载相关包，提高下载速度。
可指定一个离你最近的国内镜像:
```R
options(BioC_mirror="http://mirrors.ustc.edu.cn/bioc/")  #中科大镜像
options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor") #清华镜像
```
同样，可指定基础R包的国内源：
```R
options("repos" = c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))  
```

在使用某个包前，需要使用library()命令载入程序包到工作环境中以进行相关的运算：
```R
>library("yeastExpData") #导入包
```
同样如果不需要程序包可以用detach()函数卸载程序包：
```R
>detach("yeastExpData")
```
注：你可以通过search()命令查看当前导入的包情况。

表1 R中常见的使用包的函数  

| 函数名称 |  含义  |  
|:------|:-------|  
|install.packages()|下载并安装包|  
|update.packages()|更新包|  
|liabrary()|加载（导入）包|  
|.libPaths()|显示库所在的目录|  

## 使用dplyr包进行数据处理
近年来，数据处理工作越来越多使用dplyr包，在R中使用dplyr包使数据处理更高效，它的速度比R基础函数快，并允许将多个函数连接使用。按照前面描述的方法安装dplyr包，然后加载到R语言环境：
```R
> library(dplyr)
```
下面使用R基础包中的鸢尾花数据集(iris)为例介绍它的使用方法。下面代码将生成一个按Species分组的包括Sepal.Length的均值的表格，均值保存在变量average中。
```R
> summarize(group_by(iris, Species), average = mean(Sepal.Length))
# A tibble: 3 x 2
  Species    average
  <fct>        <dbl>
1 setosa        5.01
2 versicolor    5.94
3 virginica     6.59
```
dplyr允许使用管道操作符%>%帮助阅读代码。通过管道操作符，可以将函数连接在一起，从而避免函数之间的嵌套使用。可以从要使用的数据框开始，将多个函数连接在一起，使得第一个函数的函数值或参数可以传递给下一个函数，以此类推。下面的代码将得到和前面同样的结果：
```R
> iris %>% group_by(Species) %>% summarize(average = mean(Sepal.Length))
# A tibble: 3 x 2
  Species    average
  <fct>        <dbl>
1 setosa        5.01
2 versicolor    5.94
3 virginica     6.59
```
distinct()函数可以找出一个变量中的唯一值。count()函数自动对变量进行分类计数。filter()函数可以基于一个匹配条件选取特定的行。
```R
> distinct(iris, Species) #查看变量Species中有哪些不同的值
     Species
1     setosa
2 versicolor
3  virginica

> count(iris, Species)  #计算每个Species的数量
     Species  n
1     setosa 50
2 versicolor 50
3  virginica 50

> filter(iris, Sepal.Width > 4.0) #选取Sepal.Width大于4.0的行
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.7         4.4          1.5         0.4  setosa
2          5.2         4.1          1.5         0.1  setosa
3          5.5         4.2          1.4         0.2  setosa
```
接下来看一下这个数据框。首先按照Petal.Length的值对行进行降序排列：
```R
> df <- arrange(iris, desc(Petal.Length))
> head(df)
  Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
1          7.7         2.6          6.9         2.3 virginica
2          7.7         3.8          6.7         2.2 virginica
3          7.7         2.8          6.7         2.0 virginica
4          7.6         3.0          6.6         2.1 virginica
5          7.9         3.8          6.4         2.0 virginica
6          7.3         2.9          6.3         1.8 virginica
```
通过可select()函数选出感兴趣的变量，创建两个数据框，一个由Sepal开头的列组成，另一个由Petal开头的列和Species列组成，也就是不以Se开头的列组成。在select()函数中指定这些特定的列即可完成上述任务，也可以用starts_with语法：
```R
> iris2 <- select(iris, starts_with("Se"))
> iris3 <- select(iris, -starts_with("Se"))
> theIris <- bind_cols(iris2, iris3)  #按列合并两个数据框，相当于基础包中的cbind()函数
> head(theIris)
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
```
可以看到合并后的theIris与iris完全一样。如果你想使用rbind()函数那样按行连接数据，可以使用bind_rows()函数。如果有行名称或其它关键字，还可以使用left_join()和inner_join()这样的函数来连接数据。
iris数据集中一共有150个观测值，如果想知道Sepal.Width中有多少个唯一值，可以使用下面这个代码：
```R
> summarize(iris, n_distinct(Sepal.Width))  #查看有多少个唯一值
  n_distinct(Sepal.Width)
1                      23
```
几乎所有大数据集中都存在重复测量值，使用dplyr删除重复数据也非常简单。假设想创建一个只由Sepal.Width中的唯一值组成的数据框，并在数据框中保留所有列，可以使用下面的代码：
```R
> dedup <- iris %>% distinct(Sepal.Width, .keep_all = T)
> str(dedup)
'data.frame':   23 obs. of  5 variables:
 $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 4.4 5.4 5.8 ...
 $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 2.9 3.7 4 ...
 $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.4 1.5 1.2 ...
 $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.2 ...
 $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
```
注意，这里使用管道操作符连接iris数据集和distinct()函数，并在distinct()函数中设定.keep_all = T，使得所有列都包括在新的数据框中，否则新数据框中就只有Sepal.Width一列。

## References
1. Peter Dalgaard, Introductory Statistics with R (R语言统计入门), 人民邮电出版社, 2014
2. Toivo GM Rebecca J Lai, Kate Haining, Greta Todorova, and Wilhelmiina. Introduction to R.  Available from: https://gabymahrholz.github.io/Intro_to_R/index.html
3. Chang W. R Graphics Cookbook, 2nd edition. Available from: https://r-graphics.org
4. The R Graph Gallery: https://www.r-graph-gallery.com/
5. 李东风，R语言教程: https://www.math.pku.edu.cn/teachers/lidf/docs/Rbook/html/_Rbook/index.html
6. Giorgi FM, Ceraolo C, Mercatelli D. The R Language: An Engine for Bioinformatics and Data Science. Life. 2022; 12(5):648. https://doi.org/10.3390/life12050648