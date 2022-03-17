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

### 注释
```
# #号后面的内容全部都是注释
"""
一对三个"符号之内包围起来的是多行字符串
可以用来当注释，通常用来作为文档
"""
# Python使用缩进来规范代码块，行首的空格被称为“缩进(indent)”，缩进一般为4个或8个空格组成。输入[Tab]键就可以一下输入这么多数目的空格。
# 具有相同缩的代码相当于在c语言中的一对{}中，比如定义函数需要缩进
def hello():
  print('Hello, world')
# 错误的缩进会导致程序报错，会出现"Unexpected indent"的错误信息。
```

### 变量
 Python属于动态类型语言，因此不需要对变量进行类型声明。变量可直接定义使用。
```
a = 5   #整数型(int)
b = 3.14    #浮点小数型(float)
c = True    #布尔型(bool)
print(a, b, c)  # => 5, 3.14, True
```
还可以使用指数形式来表示浮点小数类型的值，如1.2e-5。
使用type函数可以对变量的类型进行确认。
```
print(type(a)) # => <class 'int'>
```
此外，布尔型的值可以当作数值来使用。True被当作1，False被当作0。在下面示例中，两个bool型的变量相加，得到结果1。
```
a = True; b = False
print(a+b)  # => 1
```
在上述Python代码中使用分号(;)对语句进行分隔，因此可以在一行代码中写入多个命令语句。

### 运算符

Python语言中对运算符的规定与其他编程语言没有太大区别。
```
# 基本运算
1 + 1 # => 2
1 - 1 # => 0
0.5 * 3 # => 1.5
6 / 2 # => 3.0
# 注意，除法在Python 3中总是返回浮点数，并且不再舍去小数位
7 / 3 # => 2.3333333333333335

# 如果想要强制得到整数，用下面的符号
7 // 3 # => 2
7.0 // 3.0 # => 2.0

# 求余数
5 % 2 # => 1
# 幂运算
2 ** 3 # => 8

# 布尔运算
True and False # => False
True or False # => True
not True # => False
1 == 2 # => False
1 != 2 # => True
1 <= 2 # => True
1 >= 2 # => False
1 < 2 < 3 # => True
```
in运算符是按"x in y"这样的格式使用的，表示如果y中包含x的话就返回true。y中通常是使用后面将会讲到的列表或元组对象。

### 字符串
```
# 单引号和双引号是等价的
s1 = "Hello "
s2 = 'world'
s = s1 + s2 # 字符串的加法就是连接字符串
print(s) # => "Hello world"
# 字符串可以被看成字符的数组，可以索引
s[0] # => 'H'

s = 'a b c d'
# split函数可以把一个字符串拆成一个列表，可以指定分隔符
s.split() # => ['a', 'b', 'c', 'd']
s = 'a|b|c|d'
s.split('|') # => ['a', 'b', 'c', 'd']
# join是split的反向函数
'-'.join(['a', 'b', 'c', 'd']) # => 'a-b-c-d'
```

### 列表
列表是Python中最常用的数据结构，列表在处理多个数据时使用的类型。列表的全体元素使用[]包围起来，每个元素用逗号(,)分隔。Python的列表可以保存任意类型的数值，也可以在列表中包含列表对象。Python列表不要求其中的元素都是相同类型的对象。
访问列表中的元素与访问普通的数组一样，都是使用索引定位，也可以对列表中的元素进行添加和替换等操作。
```
# 列表是有序的
l = [1, 2, 3, 4, 5] # 定义了一个列表，元素为1 2 3 4 5
n = [7,8,9] # => [7, 8, 9]

# 列表可以相加
l + n # => [1, 2, 3, 4, 5, 7, 8, 9]

# 求列表的长度
len(l) # => 5
# 向列表末尾添加元素
l.append(6) 
print(l) #  [1, 2, 3, 4, 5, 6]

# 像数组一样索引任意位置的元素（当然，不能越界）
l[0] # => 1
# 可以对列表元素进行赋值
l[5] = 100 # l现在是[1, 2, 3, 4, 5, 100]
# 用-1获取列表最后一个元素
l[-1] # => 6

# 获取列表的一段子列
l[1:4] # => [2,3,4], 注意1：4包含1，不包含4
l[1:4:2] # => [2, 4], 1:4:2的2表示每两步取一个
l[4::-1] # => [5, 4, 3, 2, 1], 4::-1的-1表示反向取，中间省略的界标表示取到头（会自动判断开头或结尾）

# 自动生成一个范围内的列表
l = list(range(0, 10)) # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# List Comprehension，一个非常好用的语法
l2 = [ i * i for i in l] # => [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
```

### 元组
元组与列表一样，可以用来同时集中处理多个数值，但是无法对元组中的元素进行添加、删除及替换等操作。元组对象的全体元素是用括号()包围起来的，每个元素用逗号(,)分隔。元组在数据处理中会经常使用到。
```
a = (1,2,3,4,5)
b = a[2]
print(b) # => 3

#即使是只包含一个元素的元组，在定义时也需要在元素的后面加上逗号
(3,)
#使用+运算符可以将两个元组进行合并产生一个新的元组对象
print(a + (6,7,8,9)) # => (1,2,3,4,5,6,7,8,9)
```
此外，列表和元组的元素还可以使用下面的方法对变量进行集中赋值。
```
a = [1,2,3]
a1,a2,a3 = a    #将列表中的元素分别代入不同变量中
print(a1,a2,a3)  # => 1 2 3
b = (4,5,6)
b1,b2,b3 = b    #将元组中的元素分别代入不同变量中
print(b1,b2,b3) # =>4 5 6
```

### 字典
Python字典类型是将键名与数值组合起来进行保存的数据类型。Python字典支持数值、字符串、元组等对象作为键名。
```
# 字典存储从键到值的映射
d = {'a': 1, 'b': 2, 'c': [1, 2, 3, 4, 5], 1:'a'}
d['a'] # => 1
d['b'] = 3  # 元素的替换
d['name'] = 'Jack'  # 元素的添加

# Python 3中keys不再返回列表，所以需要显示构建列表
list(d.keys()) # => ['a', 'b', 'c', 1]
# Python 3中dict.iteritems被dict.items替代
list(d.items()) # => [('a', 1), ('b', 2), ('c', [1, 2, 3, 4, 5]), (1, 'a')]
```

### 条件控制
在Python语言中，条件判断是使用if语句实现的。如果if的条件没有得到满足，就按照从上到下的顺序对elif的条件进行判断。如果所有这些条件都不满足，就执行else内的程序代码。
在大多数编程语言中，条件语句和函数块都是使用花括号{}表示，但在Python中则是通过插入缩进来表示。也就是说，如果遇到缩进的行，就意味着这一行代码前的代码块执行的结束。缩进符号通常使用四个半角的空格表示。
```
# Python的条件控制很简单，if elif else三个关键词
a = 5
if a == 5:
   print('a equals 5')
elif a == 3:
   print('a equals 3')
else:
   print('no equal')
```

### 循环
在Python中，要实现通过指定次数对程序进行循环执行，需要使用for语句。为了指定循环的范围，可以将列表或range函数与in运算符结合起来使用。
range函数的使用方法如下所示，被[]包围起来的参数部分是可以省略的。
range([起始编号,]终止编号[,步长数])
例如，range(3)表示的是从0到2之间的范围。

```
# 对列表进行循环
l = [1, 2, 3]
for i in l:
  print(i)
# 打印结果：
1
2
3

# 用range函数遍历一个范围
for i in range(0, 5):
  print(i)
# 打印结果：
0
1
2
3
4 
# 不包含5

# 用enumerate遍历列表元素的同时获取元素的位置
l = ['Jack', 'Harry', 'Mary']
for i, v in enumerate(l):
  print(i, v)
# 打印结果：
0 Jack
1 Harry
2 Mary

# while循环，实现在满足特定条件的区间内对代码进行循环执行的语句。
a = 0
while a < 3:
  # 无限循环
  print('Hi')
  a+=1
# 打印结果：
Hi
Hi
Hi
```


### 函数
在Python中，可以通过使用函数来实现对多行代码进行集中处理的目的。函数的定义方法是在def的后面加上函数的名称，再在括号()中对函数的参数进行定义。return语句后面的数值将被作为函数的返回值。函数的参数是可以指定缺省值的，当对函数的参数指定了缺省值时，在调用函数时就可以省略对参数的定义。
> [!NOTE]
> def是英文单词define（定义）的缩写

```
def Hello():
  print("Hello, world!")

def subtract(x, y):
  return x - y

subtract(1, 1) # => 0

def add(a, b=4):    #为第二个参数设置缺省值
    c = a + b
    return c
print(add(3))   #调用函数不用指定第二个参数

# Python 3里面可以直接把函数的参数当作keyword arguments，所以可以用下面的语法，这样参数与位置无关
subtract(y=5, x=3) # => -2
```
此外，在Python中通过添加星号（*）到元组中，可以实现对多个参数的函数进行一次性的参数传递。
```
def add (a, b, c):
    d = a + b + c
    print(d)

e = (1,2,3) #将要传递的参数保存到元组中
add(*e)     #添加星号到元组实现一次性参数传递
```

在Python中，在函数内部定义的变量属于局部变量，在函数外部定义的变量属于全局变量。局部变量只能在对其定义的函数内部进行访问，全局变量则可以从程序的任何地方访问。
```
a = 123     #全局变量

def showNum():
    b = 456     #局部变量
    print(a,b)

showNum() # => 123 456
```
在Python中,如果在函数内部对全局变量进行赋值操作，会导致全局变量被当作局部变量来处理。如果要在函数内部对全局变量进行更改，必须使用global或nonlocal关键字来明确指定变量不是局部的。
```
a = 123

def setLocal():
    a = 456     #a被当作局部变量进行处理
    print("local:", a)  # => 456

setLocal()
print("Global:", a) # => 123

def setGlobal():
    global a    #也可以使用nonlocal关键字，a作为全局变量
    a = 456
    print("Global:", a)  # => 456

setGlobal()
print("Global:", a) # => 456

```

### 模块
简单地说，模块就是一个功能丰富的“函数集合”。有些模块是Python自带的，有些是其他作者编写，需要下载并安装后才可以使用。模块需要导入Python程序才能使用。
```
# 用import导入模块，并用“模块名称.函数名”这种模式执行函数
import 模块名
# 可用as重命名模块名
import Numpy as np

# 用from可以不用写模块名，直接用"函数名"执行函数
from 模块名 import 要使用的函数名
```

### 面向对象编程
所谓面向对象编程，是指通过对象之间的相互作用来实现对系统行为进行控制的一种编程思想。在面向对象编程中，有类与实例两种概念，类和实例统称为对象。具体来讲，类就相当于设计图一样的东西，而实例则是指对象的实体。使用同一个类可以生成多个实例。
在Python中，对类进行定义要使用class关键字。使用类定义可以将多个方法集中到一处，类的方法与函数类似，使用def关键字来定义。
```
class Calc():
  # 类的方法需要指定self作为参数
  def __init__(self, a):
    self.a = a
  def add(self, b):
    print(self.a + b)
  def multiple(self, b):
    print(self.a * b)

calc = Calc(3) # 构造一个Calc的实例
calc.add(4) # => 打印4
```
Python类成员方法具有使用self接收参数的特征。通过使用这一self关键字，可以对实例的变量进行访问。所谓实例变量是指在通过对类的实例化生成的对象中可以访问的变量。其中__init__是特殊方法，被称为构造函数（constructor）。在这个方法中可以对实例进行初始化操作。在上面的代码示例中，self.a=a语句的作用是将通过参数获取的值代入实例变量a中。使用此方法代入一次到实例变量中的数值，在同一个实例中的任意一个方法内部都可以进行访问。add与multiply方法则是将通过参数获取的值与实例变量a进行运算。
此外，Python的类中还有继承的概念。通过对类进行继承操作，可以从现有的类中派生出新的类并对其进行定义。
```
class CalcPlus(Calc):
  def substract(self, b):
    print(self.a - b)

  def divide(self,b):
    print(self.a /b)

calc_plus = CalcPlus(3)   #生成CalcPlus类的实例
calc_plus.add(4)          #Calc类的方法
calc_plus.substract(4)    #CalcPlus类的方法
```
由于这个CalcPlus类继承自Calc类，因此在Calc类中定义的构造函数、add方法、multiply方法在新的类中也同样可以直接使用。此外，在CalcPlus类的内部还增加了新的substract方法和divide方法的定义。在祖先Calc类中定义的方法和对其进行继承所创建的CalcPlus类中的方法，都可以通过同样的方式进行调用。通过这种继承方式，可以将多个类中公用的部分集中到祖先类的代码中实现。