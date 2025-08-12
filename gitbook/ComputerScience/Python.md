# Python语言编程教程

本教程旨在帮助生物信息学初学者快速学习Python语言的编程基础知识，因此只精选了部分Python语言的功能，请参考此文后面列出的Python经典教程（A byte of python与Think Python中文版）来更好的学习Python语言。
首先，让我们回顾一下Python的一些特性：
* 它是一种解释性语言。与C或Java等语言不同，Python不需要编译，故可以交互式运行Python代码。 
* 它是动态类型语言。变量类型不需要预先声明，变量的类型在运行时确定。
* 它有支持多种编程范式：过程式编程、面向对象式编程与函数式编程。
这些特性使得Python成为一种非常通用的编程语言，从简单的自动化脚本到复杂的数据科学项目。


## 运行Python命令和脚本
* 对于Linux或macOS用户，直接在终端输入python，然后回车即可打开交互式python解释器，如下图所示。在这个解释器敲入任何合法的python语句即可执行。
![Python Shell](http://www.ligene.cn/images/blog/python-shell.png)

* 对于Windows用户，可以通过“Windows键+R”调出“Run”窗口，再输入“cmd”打开Windows命令解释符，再输入python，即可打开交互式python解释器。此外，也可以双击Python安装后的IDLE快捷方式打开图形界面的Python解释器，可以处理交互式命令和导入Python文件并执行。

* 对于交互式Python解释器，在使用结束后，通过键盘输入"quit()"，或按组合键Ctrl+D (Linux/macOS)或Ctrl+Z (Windows)关闭。

* 当您有许多命令时，而且你想留存这些命令以便以后重用时，还可以将所有的命令存储到一个脚本文件中一起执行。Python脚本保存在扩展名为".py"的文件中。例如，我们有一个包含python命令的文件test.py，只要在终端输入python test.py并回车就可以运行这个文件。

> [!TIP]
> 对于初学者，推荐直接在Jupyter Notebook下学习Python命令和脚本。Jupyter Notebook里面的代码可以随时修改和运行，并能同时记录你的脚本和输出，符合现在流行的“可重复性计算”的概念。
> Linux/macOS用户直接在终端(Terminal)进入你的目标文件夹cd /working_dir[回车]，然后在终端输入Jupyter notebook[回车]即可启动Jupyter notebook。Jupyter notebook启动后会打开默认的浏览器（需要在图形用户界面下工作），这时可以新建或打开相应路径下的ipynb文件。

## Python程序风格
* 层级缩进。空白在Python中是很重要的，它称为缩进。在逻辑行首的空白（空格和制表符）用来决定逻辑行的缩进层次，从而用来决定语句的分组。这意味着同一层次的语句必须有相同的缩进。每一组这样的语句称为一个块。通常的缩进为4个空格, 在Jupyter Notebook中为一个Tab键。

  从下面这两个例子可以看出错误的缩进类型和对应的提示:
    * “unexpected indent” 表示在不该出现空白的地方多了空白，并且指出问题出在第三行(line 3)。
    * “expected an indented block” 表示应该有缩进的地方未缩进，也指出了问题所在行。
    * “unindent does not match any outer indentation level” 表示缩进出现了不一致，问题通常会在指定行及其前面的行。

* 使用冒号分隔程序块。例如，在if语句中使用了冒号作为if嵌套程序块的开始。    
```
print("Hello, Python!") 
=> Hello, Python!
myname = input("Your name: ")
myname = myname.upper()
if myname == "PYTHON":
  print("Hello", myname)
else:
  print("Please input Python.")
=> Your name: Python
=> Hello PYTHON
```

* 注释。Python代码中#号后面的内容全部是注释。此外，一对三个"符号(""")之内包围起来的字符串是多行注释，通常用来作为说明文档。
```
def hello():
  print('Hello, world')
# 错误的缩进会导致程序报错，会出现"Unexpected indent"的错误信息。
"""
Python使用缩进来规范代码块，行首的空格被称为“缩进(indent)”，缩进一般为4个空格组成。输入[Tab]键就可以一下输入这么多数目的空格。
具有相同缩的代码相当于在c语言中的一对{}中，比如定义函数需要缩进
"""
```

* 多行语句。 Python代码中一般一行就是一条语句，但是可以使用斜杠(\)将一条语句分为多行显示。此外，如果语句中包含像括号、中括号和大括号等配对符号，Python会自动将其视为多行语句。
```
>>>total = 1 + 2 +\
...3 + 4 
>>>total
10
```

## 变量与数据类型
在Python中，变量是用来存储数据的。我们可以把它想象成一个存储箱，可在其中放入任何数据，并在需要的时候取出来。Python是动态类型语言，因此变量可直接定义使用，不需要预先声明变量的类型。Python使用等号(=)创建变量。
注意，变量只能包含字母、数字和下划线，但只能以字母与下划线开头，不能以数字开头，如1variable无效。而且变量名是大小写敏感的，如Name与name是不同变量。

### 基本数据类型
Python可存储和处理不同类型的数据，常用的基本类型有6个：int整型, float浮点数,complex复数，bool布尔值，str字符串值及None空值。
```
a = 5   #整数型(int)
b = 3.14    #浮点小数型(float)
c = True    #布尔型(bool)
print(a, b, c)  # => 5, 3.14, True
```
还可以使用指数形式来表示浮点小数类型的值，如1.2e-5。

使用type()函数可以对变量的类型进行确认。
```
print(type(a))  # => <class 'int'>
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

# 如果想要强制得到整数，用下面的整除符号
7 // 3 # => 2
7.0 // 3.0 # => 2.0

# 求余数
5 % 2 # => 1
# 幂（指数）运算
2 ** 3 # => 8 （2的3次方）

# 布尔运算，使用and, or和not关键字执行布尔逻辑运算
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
```
t = [1,2,3]
2 in t  # => True
5 not in t  # => True
```

> [!TIP]
> is和is not标识运算符可以检查两个变量是否引用同一个对象。这与"=="和“!=”运算符不同，后者检查两个变量是否具有相同的值。
> 检查变量是否为无的，可以使用" a == None "，但一般建议使用" a is None "。为什么呢？在Python中，类可以实现自定义比较运算符，因此在某些情况下，a == None的结果可能是不可预测的，因为类可以选择将特殊含义附加到None值。

### 字符串
字符串是由零个或多个字符组成。Python使用双引号或单引号来定义一个字符串。
```
# 单引号和双引号是等价的
s1 = "Hello "
s2 = 'world'
# 字符串的加法就是连接字符串
s = s1 + s2 
print(s) # => "Hello world"
# 字符串可以被看成字符的数组，可以索引
s[0] # => 'H'
# 也可以使用切片来截取字符串中的一部分，切片的语法是[start:end]
print(s[0:5]) #=>输出'Hello'
```
在Python字符串定义中如果出现未配对的双引号或单引号会出错。例如，我想声明一个内容为'I' m on my way home'的字符串，Python解释器会认为在第一个字母I后面的单引号意味着这个变量赋值语句已结束。因此在此后出现的不完整字符串定义就会引起语法错误。这种情况可以通过转义序列来解决。当打算使用一些具有特殊含义的字符(如引号)，或者一些不可打印的字符(如Tab键)时，可以使用转义符来展示。  

Python常用的转义符

|特殊字符|描述|例子|结果|
|:---|:---|:---|:---|
|\"或\'|引号|print "You had me at \"Hello\""|You had me at "Hello"|
|\t|Tab键|print "Item\tUnits\tPrice"|Item Units Price|
|\n|换行|print "Anheusers?\nBusch?\n"| Anheusers? Busch?|

> [!TIP]
> 只有在使用双引号定义的字符串中使用转义符才有效。 

```
# split函数可以把一个字符串拆成一个列表，可以指定分隔符
s = 'a b c d'
s.split() # => ['a', 'b', 'c', 'd']
s = 'a|b|c|d'
s.split('|') # => ['a', 'b', 'c', 'd']
# join是split的反向函数
'-'.join(['a', 'b', 'c', 'd']) # => 'a-b-c-d'
```
* 反转义
反转义是通过在字符串前加上r或R来实现，这会告诉Python忽略所有的转义字符，将字符串中的内容原样输出。这种特性在处理文件路径时特别有用，因为Windows系统中的文件路径使用反斜杠作为分隔符，如C:\Users\Alice。如果不使用反转义，就需要为每个反斜杠加上一个额外的反斜杠，如C:\\Users\\Alice。如果使用反转义，就可以直接写出路径，如r'C:\Users\Alice'，这样更方便。

* f字符串
你可能已经注意到以f开头的字符串，这种语法称为f字符串，是执行字符串插值的一种非常方便和简洁的方法。在字符串中，可以简单地在大括号里插入变量，它们将自动转换为字符串以生成结果字符串。
```
x = 100
print(f"Double of {x} is {x * 2}")
=> Double of 100 is 200
```
这个脚本将值100分配给变量x，并输出一个值为x及它的两倍的字符串。

### 数组
有0个或多个值的有序列表，每个值可以是任何类型。数组使用方括号符号，元素以逗号分隔。以下创建一个数组，然后向这个数组添加元素：
```
>>> temp_list = []
>>> print(temp_list)
[]
>>> temp_list.append("one")
>>> temp_list.append("two")
['one', 'two']
```

## 数据结构

### 列表（list）
列表是由一系列按特定顺序排列的元素组成的可变的序列。列表是Python中最常用的数据结构，列表在处理多个数据时使用的类型。列表的全体元素使用[]包围起来，每个元素用逗号(,)分隔。Python的列表可以保存任意类型的数值，也可以在列表中包含列表对象。Python列表不要求其中的元素都是相同类型的对象。
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

#应用lambda表达式截短字符串
lines = ['this', 'is', 'a', 'list', 'of', 'words']
list(map(lambda it:it[:3], lines)) #=>['thi', 'is', 'a', 'lis', 'of', 'wor']
```

### 元组（tuple）
元组是一种有序的、不可变的数据类型。元组与列表一样，可以用来同时集中处理多个数值，但是无法对元组中的元素进行添加、删除及替换等操作。元组对象的全体元素是用括号()包围起来的，每个元素用逗号(,)分隔。元组在数据处理中会经常使用到。
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

### 字典（dict）
字典是一种可变的、无序的数据集合，它存储了键值对(key-value pair)的映射关系。Python字典类型是将键名与数值组合起来进行保存的数据类型。Python字典支持数值、字符串、元组等对象作为键名。字典的键必须是唯一的，而值可是任何数据类型的。
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

### 集合（set）
集合是一种方便使用的数据结构，用于存储唯一项的集合。它天然就有去重作用，进而可以完成两个集合的取交集、并集和差值等。
```
它使用大括号来定义：
s = {1,2,3,4,5}
contains = 1 in s #判断是否包含
print(contains)   => True
可以将元素添加到集合中，但该结构只确保元素出现一次：
s.add(1)  => {1,2,3,4,5}
s.add(6)  => {1,2,3,4,5,6}
另外，还提供了简便的方法来执行两个集合上的并集或交集等操作：
s.union({4,5,6})  => {1,2,3,4,5,6}
s.intersection({4,5})  => {4,5}
```
Python数据结构的全面信息可以查看Python官方文档： https://docs.python.org/3/library/stdtypes.html

## 控制流语句
控制流用来根据运行时的情况调整语句的执行顺序。没有控制流语句，编程语言就不是编程语言。 在Python中，控制语句主要有三类：条件语句，循环语句和跳转语句。
### 条件语句
在Python语言中，条件判断是使用if语句实现的。如果if的条件没有得到满足，就按照从上到下的顺序对elif的条件进行判断。如果所有这些条件都不满足，就执行else内的程序代码。
在大多数编程语言中，条件语句和函数块都是使用花括号{}表示，但在Python中则是通过插入缩进来表示。也就是说，如果遇到缩进的行，就意味着这一行代码前的代码块执行的结束。缩进符号通常使用四个半角的空格表示。
```
# Python的条件控制有if、 elif、 else三个关键词
a = 5
if a == 5:
   print('a equals 5')
elif a == 3:
   print('a equals 3')
else:
   print('no equal')
```
第一个条件为if，后跟布尔条件，打开一个缩进模块。备用条件为elif（非else if），后备模块为else。当然，如果没有备用条件，也可以不用这些语句。值得注意的是，与其他高级语言不同，Python不提供switch语句。

### 循环语句
在Python中，要实现通过指定次数对程序进行循环执行，需要使用for语句。通常编程语言如下定义for循环：
for(i=0; i<=10; i++), 该语句定义和控制用于迭代的变量。
与其它编程语言不同，Python语言希望你使用迭代器为循环提供信息。迭代器可以看作是一系列元素，可以逐个检索这些元素。为了指定循环的范围，可以将列表或range函数与in运算符结合起来使用。
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
```

* while循环，实现在满足特定条件的区间内对代码进行循环执行的语句。
```
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
### 跳转语句
* break和continue语句
在某些情况下，您可能希望提前结束循环或路过迭代。为了解决这个问题，Python采用经典的break和continue语句来实现。

* pass语句
pass语句在语法上需要一个语句，但实际上不做任何事情，常用于占位。
```
for i in range(5):
  if i == 3:
    pass
  print(i)
```
函数range()用于生成一个数字序列，通常用于指定循环的次数。这个示例中，range(5)生成一个从0开始，到4结束的数字序列。注意，range()函数生成的序列不包括结束值！

## 函数
函数是在程序中封装了一段可重复使用的代码块，用于完成特定的任务。它接受输入参数（可选），经过一系列的操作和计算，然后返回一个输出结果。函数在Python中起着重要作用，实现了代码的模块化，提高了代码的可读性和可维护性。在Python中，可以通过使用函数来实现对多行代码进行集中处理的目的。  
函数的定义方法是在def的后面加上函数的名称，再在括号()中对函数的参数进行定义。return语句后面的数值将被作为函数的返回值。函数的参数是可以指定缺省值的，当对函数的参数指定了缺省值时，在调用函数时就可以省略对参数的定义。
> [!NOTE]
> def是英文单词define（定义）的缩写
> 按照惯例，函数应使用下划线命名，如my_wonderful_function，即蛇形大小写(snake case)命名法;而类一般使用驼峰大小写法（camel case）拼写命名，如MyWonderfulClass。

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

# Python 3里面可以直接把函数的参数当作keyword arguments（关键字参数），所以可以用下面的语法，这样参数与位置无关
subtract(y=5, x=3) # => -2
```

* 使用*args和**kwargs接受动态参数

有时，您可能需要一个支持动态参数的函数，之后运行时在函数逻辑中处理这些参数。
```
def f(*args, **kwargs):
  print("args", args)
  print("kwargs", kwargs)

f(1,2,3, a=4, b=5) 
=> args (1,2,3)
=> kwargs {'a':4, 'b':5}
```

可输出可见，标准参数被放置在元组中，其顺序与它们被调用的顺序相同。另一方面，关键字参数被放在字典中，其中的键是参数的名称。之后使用这些数据来执行逻辑！有趣的是，固定编码参数和动态参数可以混合使用。

```
def f(a, *args):
  print("a",a)
  print("args", args)

f(1,2,3) 
=> a 1
=> args (2,3)
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
print("Global:", a)  # => 456
```

Python解释器内置了一些函数。其中str()将对象转换为易于阅读的字符串；函数len()用于获取对象的长度；函数id()返回对象的标识；函数print()将给定的对象打印到标准输出设备（屏幕）或文本流文件。格式化输出可以使用%或str.format()方法。
```
sub = "python string!"
print("It is a %s" % sub) => It is a python string!
print("It is a {}".format(sub)) => It is a python string!
```

## 类与对象

所谓面向对象编程，是指通过对象之间的相互作用来实现对系统行为进行控制的一种编程思想。在面向对象编程中，有类(Class)与实例(Instance)两种概念，类和实例统称为对象(Object)。具体来讲，类定义了对象的结构与行为，它是如何创建对象的蓝图或模板；而实例则是指对象的实体，使用同一个类可以生成多个实例。所谓实例变量是指在通过对类的实例化生成的对象中可以访问的变量。  
在Python中，对类进行定义要使用class关键字。使用类定义可以将多个方法集中到一处，类的方法与函数类似，使用def关键字来定义。Python类成员方法具有使用self接收参数的特征。通过使用这一self关键字，可以对实例的变量进行访问。
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
其中__init__是特殊方法，被称为构造函数（constructor）。在这个方法中可以对实例进行初始化操作。在上面的代码示例中，self.a=a语句的作用是将通过参数获取的值代入实例变量a中。使用此方法一次代入到实例变量中的数值，在同一个实例中的任意一个方法内部都可以进行访问。add与multiply方法则是将通过参数获取的值与实例变量a进行运算。
此外，Python的类中还有继承的概念。通过对类进行继承操作，可以从现有的类中派生出新的类并对其进行定义。
```
class CalcPlus(Calc):
  def substract(self, b):
    print(self.a - b)

  def divide(self,b):
    print(self.a / b)

calc_plus = CalcPlus(3)   #生成CalcPlus类的实例
calc_plus.add(4)          #Calc类的方法
calc_plus.substract(4)    #CalcPlus类的方法
```
由于这个CalcPlus类继承自Calc类，因此在Calc类中定义的构造函数、add方法、multiply方法在新的类中也同样可以直接使用。此外，在CalcPlus类的内部还增加了新的substract方法和divide方法的定义。在祖先Calc类中定义的方法和对其进行继承所创建的CalcPlus类中的方法，都可以通过同样的方式进行调用。通过这种继承方式，可以将多个类中公用的部分集中到祖先类的代码中实现。


## 模块与包

### 模块

模块是包含Python代码的文件，其中定义了函数、变量和类等。每个Python程序都可以被组织成模块，模块可以被其他程序导入并使用。简单地说，模块就是一个功能丰富的“函数集合”。有些模块是Python自带的，有些是其他作者编写，需要下载并安装后才可以使用。
```
# 用import导入模块，并用“模块名称.函数名”这种模式执行函数
import 模块名
import requests

# 可用as重命名模块名
import Numpy as np
x = np.linspace(1,10,100)

# 用from可以不用写模块名，直接用"函数名"执行函数
# from 模块名 import 要使用的函数名
from datetime import date
date.today()
=> datetime.date(2022,3,12)
```
在这里，我们显式导入date类以直接使用它。

### 编写模块
Python模块(module)包含了Python对象定义和Python语句。在模块里可以定义函数、类和变量。把相关代码分配到一个模块里，可以使代码更好用，更易懂，也提高了代码的可维护性与重用性。不同模块中的函数名和变量名可以相同。模块的使用，避免了庞大代码量中函数名和变量名冲突的问题。

在Python中，模块是包含声明的单个文件，但也可以包含首次导入模块时执行的指令。下面就一个简单的模块的定义。
```
def module_function():
  return "Hello world"
print("Module is loaded")
```

项目的根目录下，创建一个包含此代码的文件，并将其命名为module.py。然后，打开Python解释器运行以下命令：
```
import module
=> Module is loaded
module.module_function()
=> 'Hello world'
```

到此，我们编写了一个Python模块。下面看一下如何构造一个包。包是一种在层次结构中组织模块的方法，然后可以使用其命名空间导入模块。
在项目的根目录下，创建一个名为package的目录，在其内部，创建一个名为subpackage的目录，将module.py移动到其中。项目结构如图所示：
![Python Package](http://www.ligene.cn/images/blog/python-pkg.png)

然后您可以使用完整的命名空间导入模块。

```
import package.subpackage.module
=> Module is loaded
```
这样我们就构造了一个包。但是为了定义一个合适的Python包，强烈建议在每个包和子包的根目录下创建一个空的"__init__.py"文件。此文件一般在第一次导入包或其子模块时执行，为包执行一些初始化逻辑是很有用的。

> 模块文件的扩展名有.py, .pyo, .pyc, .pyd等。py是源代码, pyc是源文件编译后的文件， pyo是源文件优化编译后的文件，pyd是其他语言写的Python模块。严格来说，Python并非完全是解释性语言。 在运行时，系统会先把Python源代码编译成pyc/pyo文件，然后再由Python虚拟机执行。当然也可以手动将Python源代码编译成pyc/pyo，例如在命令行输入下面命令将生成pyo：
python -O -m py_compile 'module.py'

### 创建Python虚拟环境
Python具有大量的第三方库，如Python常用包有：
  １．科学计算 Numpy, SciPy
  ２．类比于R的数据框操作包 Pandas
  ３．可视化工具 Seaborn (配合pandas), matplotlib (类比MATLAB), plotly (交互式绘图), ggplot (类比ggplot2)
  ４．网站开发 web.py, Django, Flask
  ５．任务调度和流程管理 Airflow (pipeline首选)
  ６．机器学习 scikit-learn (经典), PyML, Tensorflow (谷歌释放), pylearn2, Orange (图形界面的机器学习包)
  ７．网页抓取 Beautiful Soup，requests,
  ８．可重复编程 Jupyter
  ９．正则表达式 re

PyPi(Python Package Index)是承载这些包的公共存储库，其内置Python包管理器pip。默认情况下，使用pip安装第三方软件包时，它将为整个系统安装该软件包。这将使你在处理依赖多个有冲突版本的Python项目时会遇到问题。这时Python开发人员通常使用虚拟环境来解决版本冲突。虚拟环境只是项目中的一个目录，其中包含Python安装的副本和项目的依赖项。
* 创建包含项目的目录
```
$ mkdir myproject
$ cd myproject
```
* 创建虚拟环境
```
$ python -m venv
```
这个命令是告诉Python运行标准库的包，在目录中创建一个虚拟环境。此目录的名称是约定俗成的，但可以选择其它名称。

* 激活虚拟环境
```
$ source venv/bin/active
(venv) $ 
```
激活虚拟环境后，提示符前会添加虚拟环境的名称。此时，当前会话(shell session)使用Python解释器和本地目录中的依赖项，而不是全局目录中的依赖项。注意，此虚拟环境的激活仅适用于当前会话。如果关闭它或打开其他命令提示窗必须再次激活它。
现在，你就可以在项目中放心安装Python包了。pip是内置的Python包管理器，它将帮助我们安装第三方库。
```
$ pip install numpy
```
为了确保安装正常，我们可以打开Python交互式shell，并尝试导入numpy包。
```
$ python
>>> import Numpy as np
```
按照惯例，NumPy始终使用别名np导入。如果它通过了，没有出现任何错误，那么恭喜您，Numpy已经安装并且可以使用了。


## 更多Python内容

* lambda
lambda产生一个没有名字的函数，通常为了满足一次使用，其使用语法为lambda argument_list: expression。参数列表是用逗号分隔开的一个列表，表达式是这些参数的组合操作。

* map
map执行一个循环操作，使用语法为map(func, seq)。第一个参数是要调用的函数或函数的名字，第二个参数是一个序列（如列表、字符串、字典）。map会以序列的每个元素为参数调用func，并新建一个输出列表。

* filter
filter用于过滤列表，使用语法为filter(func, list)。以第二个参数的每个元素调用func，返回值为True则保留，否则舍弃。

* reduce
reduce连续对列表的元素应用函数，使用语法为reduce(func, list)。如果我们有一个列表aList = [1,2,3, … ,n ], 调用reduce(func, aList)后进行的操作为: 首先前两个元素会传入函数func做运算，返回值替换这两个元素，成为数组第一个元素aList = [func(1,2),3, … , n];然后当前的前两个元素再传图func函数做运算，返回值返回值替换这两个元素，成为数组第一个元素aList = [func(func(1,2),3), … , n]，直到列表只有一个元素。
```
from functools import reduce
print("列表求和")
aList = [1, 2, 3, 4, 5]
print(reduce(lambda a, b: a + b, aList))
列表求和
15
```

### 编程规范
通常Python编程过程为，首先声明扩展程序库的导入等，接着是函数和类等的定义，最后编写处理主体。下面这个例子中，处理的主体部分开头有if __name__ = '__main__'语句。这是指只在直接运行该程序的情况下（无论是从命令行或双击执行），才执行以下操作。如果是从其他程序调用（不是直接执行），就不执行该处理。当一个模块被导入到另一个模块中时，__name__属性中的值是模块本身的名称（即隐匿声明它的Python文件的名称）。

```
#声明
import sys

#定义函数、类等
def test(a):
  print("Hello", a, ".")

#处理主体
if __name__ = '__main__':
  A= "apple"
  B= sys.version
  test(A)
  test(B)
```
即使不采用"正确的规范"也能正确运行程序，可相当自由地编写Python程序。

## References
1. Allen B. Downey, Think Python 2nd Edition: https://tairraos.github.io/ThinkPython/index.html
2. Swaroop C. H., A Byte of Python: https://python.swaroopch.com/ (简明Python教程)
3. The Python Tutorial: https://docs.python.org/3/tutorial/