## Linux操作系统入门

* Linux is an open-source Unix-like operating system.
* The **shell** acts as an interface between the user and the kernel.
> 本章简介Linux操作系统的基本知识及常用Linux命令，并结合生物信息学分析实例进行讲解。

操作系统（Operating System，简称OS）是管理和控制计算机硬件与软件资源的计算机程序，是直接运行在“裸机”上的最基本的系统软件，任何其他软件都必须在操作系统的支持下才能运行。现在流行的操作系统有Windows，macOS与Linux等。
Linux系统是一种自由和开放源码(Free and Open Source Software)的操作系统，是一个类UNIX系统，具有UNIX的全部功能与特性。UNIX集成许多实用工具，其设计哲学是“Do One Thing and Do It Well”。Linux内核最初由芬兰赫尔辛基大学的Linus Torvalds在1991年开发，后经成千上万的程序员不断修改完善。Linux操作系统在短短的几年内得到了迅猛发展，这与它的良好特性是分不开的。它是一个完全兼容POSIX标准(可移植操作系统接口)的多用户、 多任务、支持多线程和多CPU的操作系统。Linux系统在运行多任务时效率普遍要比Windows高的多，这种效率对处理大数据是非常重要的，因此许多生物信息学软件是基于Linux系统开发的。掌握Linux系统的操作是从事生物信息分析工作的必备条件之一。
Linux系统有许多不同的发行版本，常用的版本有Ubuntu Linux与Red Hat Linux。由于各个发行版使用相同的Linux内核与GNU程序库，并遵守Linux Standard Base (LSB)行业标准，只有应用软件差异比较大，操作使用大体都是相同的，因此一般只要学会一个发行版的使用方法就可以了。Ubuntu Linux是一个基于Debian系统开发的Linux发行版，提供大量的高质量应用程序，并保留Debian强大的软件包管理系统，以便安装或删除程序。本书主要介绍Ubuntu Linux的使用方法，当前版本是16.04LTS (2016-04-28发布)。
使用Linux系统的方式有：(1)使用Linux操作系统的电脑；(2)安装Linux的虚拟机；(3)远程连接Linux服务器；(4) 使用Windows10的Linux子系统(WSL)。本书介绍在Windows10的Linux子系统(WSL)中的使用，在学习后续内容前，请按照第2章内容先安装WSL系统。

### Linux命令行终端
操作系统的基本结构是由Kernel（内核）和Shell（壳）构成。Shell 是用户与Linux操作系统沟通的桥梁（图1），它的作用是命令解释器(command processor)，负责接收用户输入的命令，翻译后发送给Linux内核处理，并能显示命令输出的信息。Shell一般可以分成两类：一是图形界面(Graphical User Interface)，简称 GUI，用户通过鼠标点击图标与计算机交互。二是命令行界面(Command Line Interface)，简称 CLI，用户通过输入命令与计算机交互。命令行Shell的种类较多，最常用的是Bash (Bourne-Again Shell)，它是 Ubuntu、RedHat及macOS等操作系统默认的命令行Shell。 
![Shell功能](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/Linux-1.png)
图1 Shell功能

Linux命令行终端就是一个文本窗口程序（图2）， 如GNOME桌面环境的Terminal或KDE桌面的Konsole，通过它可使用命令行Shell。Ubuntu系统默认桌面环境是GENOME，要使用命令行Shell，首先要打开一个终端(Terminal)。终端一般在菜单Application->Accessories->Terminal打开，或直接使用快捷键Ctrl+T打开。 
![Linux命令行窗口](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/Linux-2.png)
图2 Linux命令行窗口

终端显示一个提示符，Bash的提示符是一个美元符号($)，“$”符号后面是光标位置，用户可以在此输入命令。如果当前是管理员用户(root)，则命令提示符变成“#”号。Linux系统支持打开多个终端，如果有多个终端窗口，则当前终端窗口的光标是实心方块，可进行命令输入；其它窗口是空心方块，不能输入命令。
“$”符号前面显示“ubuntu@Ubuntu:~”，其意义为：ubuntu是当前用户名；Ubuntu是主机名，当你远程登录另一台服务器，主机名就会变化；“~”是用户主(home)目录的指示符，代表当前目录是‘/home/ubuntu’，Linux系统为每个用户自动分配一个自己使用的home目录。“@”与“：”是系统设定的分隔符号。

#### 终端常用技巧
* Tab键自动补全名称：输入命令、文件或目录名称的开头几个字母，然后按下Tab键，名称中的其它部分会自动补充完成。如输入his[Tab]，就会看输入history命令。如果shell找到多个以输入字母开头的名称，将会响铃提醒，可再输入几个字符再按Tab键。
* 向上（↑）或向下键（↓）：可以显示最近终端中使用过的命令，如可以调出以前输入过的长命令，不用再重新输入，节省时间。
* 如果输入有误，可以用Ctrl-U（同时按下Ctrl键与U键）取消整个输入行内容。
* 编辑命令可快速移动光标：Ctrl-A可以把光标定位到行首，而 Ctrl-E移到行尾
* 清理终端显示内容: Ctrl-L，功能相当于命令“clear”。
* 终止进程：Ctrl-C（同时按下Ctrl键与C键终止命令）。

18.2 Linux文件系统
Windows系统的"我的电脑"可分为不同的分区，如C, D, E等不同驱动器盘符。各个分区下再保存不同的文件与目录，并都以分区的名字为根目录，如“C:\Windows”。Linux系统的目录结构与Windows有较大差异。Linux中所有文件与目录都位于根目录”/”下，根目录有点像Windows下的“我的电脑”，但没有再分不同的分区。Linux系统的根目录下也有许多不同文件或目录，用于不同的功能。Linux路径显示从根目录开始，如“/home”，代表根目录下的home目录。Linux系统目录的命名及作用遵循一定的标准，如”/dev”用于存放设备文件，“/lib”用于存放库文件，包含各种被系统和用户所使用的程序库，“/home”存放用户个人文件等。即使不同的LINUX发行版，其文件夹的作用也基本相同。
![Linux文件系统](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/Linux-3.png)
图3 Linux文件系统

> ♫ Note/Tip
* 绝对路径：从根目录开始的目录，绝对路径由根目录“/”写起，如目录：/usr/local/bin。 
* 相对路径：从当前目录开始的目录，相对路径写法，例如由当前目录/home/mats要到/home/mats/tests目录，可以写成：cd tests （或cd ./tests）。
代表目录的快捷字符： 
* “/”: 根目录 
* “.”: 当前目录 
* “..”: 上级目录 
* “~”: home目录

Linux下常见的文件类型为：文本文件(-)、链接文件(l)和目录(d)。与Windows不同，Linux系统将所有的硬件设备作为文件处理，如U盘在Linux中的文件名为/dev/sda， 当前CD ROM/DVD ROM的文件名为/dev/cdrom。另外，不像Windows系统下的文件使用后缀名决定打开文件的程序，如文本文本加后缀名“.txt”，以便记事本打开。Linux下的文件不注重后缀名，我们看到Linux下的有些文件也有后缀名，主要是帮助用户识别文件的类型。
Linux最优秀的地方之一，就在于它的多用户、多任务环境。为了让各个用户具有较保密的文件数据，文件的权限管理就变得很重要。 Linux一般将文件可存取访问的身份为三个类别：owner(用户), group(组), others(其它)；三种身份类别分别有read (r),write (w)和execute (x)等权限。
打开终端，输入命令“ll”或“ls -l”，可显示用户目录下的所有文件与文件夹的详细信息（图4），每一行显示一个文件的相关信息。
![Linux文件系统](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/Linux-4.png)
图4 目录列表信息

上图第三行表示含义：d代表文件夹。rwx代表用户可读可写可执行，r-x代表用户组可读不可写可执行，r-x代表其他人可读不可写可执行。3代表3个人正在查看，前一个aseethar代表用户，后一个cri代表用户组，22代表文件夹大小，Jun 6 10:57代表创建时间，最后是文件或目录的名称。注意，文件名前的点号(".")代表隐藏文件。 

### Linux常用命令

Linux系统主要使用终端命令进行任务处理，不像Windows那样用鼠标操作方便，如在Windows下新建一个文件夹，只要鼠标右击，新建文件夹即可。Linux命令让初学者很不适应，但一旦熟练掌握linux命令，可以非常高效完成分析任务。作为初学者，我们只需要使用一些常用命令就可以完成日常操作。下面选取一些与生物信息学分析相关的常用的Linux命令进行详细介绍，帮助读者能熟练运用这些Linux命令进行生物信息学相关的数据分析。

> ♫ Note
Linux命令的基本格式：COMMAND [OPTIONS…] [ARGUMENTS…] 
COMMAND：命令(可执行程序)，如ls 
OPTIONS：选项（前面带“-”），多个选项可以组合使用，如ls -al 
ARGUMENTS：参数，命令的作用对象,如显示home目录, ls -al /home 
注意：命令、选项、参数三部分之间一定要用空格分隔开，多个空格算一个空格。
command_name -i input_file -o output_folder
注意：目录或文件名不要用空格，而用下划线，如output_folder；如输入的命令较长，可用”\”换行使长命令更好读。
Linux命令较多，无需记住所有的命令及其选项，可以通过命令“man”查看各个命令的用法与参数等，如man ls。也可在命令后加参数(-h)查看帮助信息：command_name –h。


#### 基本命令
1. ls - 列出文件与目录(list)
ls命令能够显示当前目录下的内容。
$ls    #列出当前所在目录下的所有可见文件
$ls -l    #想要列出详细信息（文件名，大小，访问权，所有者）可以用:
$ls -a    #想要列出所有文件，包括隐藏文件(开头为"."的文件)
$ls -al /home    #列出home目录的所有文件
$ls -lh    #文件大小按”K”/”M”/”G”等human readable格式来显示
$ls -ltr     #按时间反序显示
注：ll是该命令默认设置的别名：ll='ls -l –color=autor'，列表显示当前文件夹的内容，并用不同颜色显示不同类型的文件与文件夹。

2. cd - 改变当前目录(Change Directory)
只要在cd命令后输入要切换的目录，可以是绝对路径，也可以是相对路径。
$cd /usr/local/   #切换到目录/usr/local/ (绝对路径)
$cd  dir1/    #切换到当前目录下的路径dir1(相对路径)
$cd ~    	#代表当前登录用户的home目录；
$cd ..		#改变到上层目录(..)
$cd -     #代表进入上一级操作目录

3. pwd - 查看当前所在的目录 (print work directory)
如果用户不知道当前在哪个目录操作，可以使用此命令：
$ pwd    #查看当前路径，以绝对路径显示

#### 文件和目录操作
4. cp - 复制文件(copy)
从源目录复制文件或文件夹到目标文件夹下。
$cp file1 dir1/         #把file1文件复制到dir1目录
$cp file1 dir1/file2    #复制文件file1到目录dir1，并重命名为file2
$cp -r dir1/  dir2/    #复制目录，若dir2已经存在，dir1复制到dir2 目录下，若不存在，dir1复制并重命名为dir2
$cp ~/test/*.txt .	#将用户test目录下的所有后缀为txt文件复制到 当前目录(.)
注：星字符(*)可以代表任何字符，称为wildcard。

5. mv - 移动文件、文件夹（目录）或改名 (move)
在同一个文件夹下移动文件为将文件重命名。
$mv file1 file2    #把文件file1重命名为file2
$mv dir1/  dir2/    #复制目录，若dir2已经存在，dir1移动到dir2目   录下，若不存在，dir1重命名为dir2

6. rm - 删除文件或目录 (remove)
$rm test.txt    #删除文件test.txt
$rm -r dir1/     #删除目录dir1（含有子目录或文件都可以删掉）
$rm -rf dir1/        #不会提示是否删除，直接删掉
注意，不要轻易以管理员权限执行这个命令，如"rm –rf /"会删除系统所有文件:-(

7. mkdir - 创建目录 (make directory)
使用“-p”参数可同时创建多级目录。 相反，rmdir删除空目录。
$mkdir testdir    #在目录下创建testdir目录
$mdir -p newdir/testdir    #在目录下创建newdir目录和子目录testdir

8. cat - 显示文档内容(catenate)
该命令后接要查看的文件名，文件内容输出到屏幕。 
$cat /etc/passwd    #显示系统文件passwd
$cat file1 file2 > file #将file1和file2的内容合并到file中
利用转向符“>”，可利用该命令合并文件。

9. head / tail – 列出文件前面或后面若干行
$head -n 10 test.txt   #显示文件前10行内容
$tail -n 10 test.txt   #显示文件后10行内容
参数说明：
-n : 只显示文件的行数

10. less / more - 查看文件内容
两个命令类似，但查看文件显示方式及快捷操作有些不同，如more到最后一行会自动退出，而less不会退出，需要输入q退出。
$less file1       #显示文件file1
$less -S file1      #每行不显示长于屏幕宽度的字符（默认显示于下一行）
$more file1      #显示文件file1
使用less或more打开文件后，可以用下列功能键进行操作：
	“q”：退出；
	“空格键(Space)”：向下翻页；
	“回车键(Enter)”：下移一行；
	"f"与"b"或PgUp与PgDn：向前或后翻页；
	"j"与"k"：可以上下移动内容；
	“u”: 向前或回退（back）；
	"/pattern"：向后查找pattern，如/HIV查找“HIV”字符；
	"?pattern"：向前查找pattern。

11. echo - 在终端上显示字符串
可用于显示环境变量的内容，或将终端输入的字符保存到文件中。
$echo "Hello Linux" > test.txt 	#将字符串保存到文件test.txt 
$echo $PATH        #显示环境变量PATH的值
$echo -e "chr\t100\n"     #参数-e可以显示转义符，\t: 水平制表符，\n: 换行符

12. touch - 新建文本文件
$touch new_file.txt    #创建文件new_file.txt

13. wc – 统计文件内容(word count)
wc命令用来统计一个文本的行数(line)、词数(word)及字数(character)，对应参数分别为-l, -w, -c。
$ wc -l test.txt	#只统计文件行数

14. find - 查找文件
该命令的基本格式为: find [PATH] [options]，即在某路径下查找某文件。
$find /opt -name "*.txt"        #在opt目录下查找以txt结尾的文件
$find . -type f -name "*.fasta"    #列出当前目录(.)下所有FASTA文件（包括子目录）
$find -name “*.fa” -exec grep HIV {} \;	#查找含有HIV字符的FASTA文件的行
参数说明：
-type f: 只显示文档，不显示目录
-maxdepth 1: 限制在当前目录内查找，不包括子目录
-exec: 运行后面的命令，“{}”为查找到的文件的占位符，“\;”为命令结束符

15. ln - 链接目录或文件
语 法：ln [-s] <source file/dirname> [file/dirname]
参 数：-s 对目标文件进行符号链接而非硬链接
$ ln -s file1 file2 将file1链接为file2（注：file2必须不存在）
$ ln -s file1 file2 dirname/ 将file1和file2链接到目录dirname/

16. chmod - 改变文件或目录的访问权限 (change mode)
权限范围：文件所有者u(user), 用户组g (group), 其他人o (other), 所有人a (all)
权限模式：r(可读), w (可写), x (可执行)，可通过+(增加)或-(删除)与rwx搭配来对文件的权限进行更改。用数字表示可读r=4, 可写w=2, 可执行x=1。
$chmod u+x test.sh    #给文件拥有者增加对文件test.sh的执行权限
$chmod 755 file    #把文件file的权限改为rwxr-xr-x (拥有者可读可写 可执行，同组成员与其它用户可读可执行)
$chmod u+w -R test    #给文件拥有者增加test目录下所有文件的写权限
参数说明：
-R：对目录及目录下所有文件均设置权限

17. du - 显示目录或文件的大小
语 法：du [-ash] [--max-depth=<n>] <file/dirname>
$ du -sh ./ 显示当前目录的大小
$ du -ah --max-depth=1 /home #显示/home目录下所有文件大小，不包括下一级目录
参数说明：
-a 显示目录中个别文件大小
-s 只显示总计
-h 以“K” ，“M” ，“G”为单位显示
--max-depth=<n> 只显示n层目录以内的文件

#### 文件打包与压缩
18. gzip/gunzip  - 文件的压缩和解压缩
gzip命令压缩后的文件扩展名为”.gz”。 事实上，gunzip就是gzip的硬连接，因此不论是压缩或解压缩，都可通过gzip指令单独完成。
$ gzip filename 	#压缩为filename.gz
$ gunzip filename.gz	#解压缩
$ gunzip -c filename.gz > filename	#解压缩并保留源文件
参数说明：
-c = 把解压后的文件输出到标准输出设备。

19. bzip2/bunzip2  - 文件的压缩和解压缩
bzip2命令压缩后的文件扩展名为”.bz2”。 
$ bzip2 filename 	#压缩为filename.bz2
$ bunzip2 filename.bz2	#解压缩

20. tar - 文件的打包(tape archive)
压缩工具gzip或bzip2只能一次处理一个文件，如果要处理多个文件，就需要先用tar工具打包成一个文件，再使用压缩工具处理。Tar工具可以设置相关参数一次完成打包与压缩。
$tar -czvf files.tar.gz file1 file2    #打包两个文件并压缩至文件files.tar.gz
$tar -xzvf files.tar.gz            #解压缩文件files.tar.gz
$tar -xjvf files.tar.bz2            #解压缩文件files.tar.bz2
参数说明：
-f = 文件(the file to extract/compress)，必加参数
-x = 解压缩(extract)
-c = 新建打包文件(compress)
-z = 调用gzip或gunzip来压缩或解压缩文件
-j = 调用bzip2或bunzip2来压缩或解压缩文件
-v = 显示更多信息 (verbose)

#### 文本处理命令
21. grep - 在文件中查找特定的内容 
该命令搜索与指定的文本(或正则表达式pattern)相匹配的行。
$less seq.fa | grep ">" | wc -l  #显示FASTA文件中的序列数
$grep -v “^>” seq.fa	#不显示>开头的行
$grep -l -i “AACGTA” seqfiles		#显示含有此序列的文件名
常用的参数：
-i: 不区分大小写
-v: 反向选择，即选中没有pattern所在的行。
-c: 统计搜索匹配到的行数。
-l: 只显示文件名，不显示匹配的行内容

22. cut – 显示文件中的指定的列或字段
此命令通常用来处理“列表”方式排列的句子，cut命令默认使用“tab”分隔符将句子分成多“列”，然后显示指定的“列”。
$ cut -f3 data.gff		#显示文件的第三列内容
$ cut -f1,7 -d ‘:’ /etc/passwd 	#指定分隔符为“：”
参数说明：
-f: 指定列，多列用逗号分隔；
-d: 指定分隔符。

23. sort – 对文件的内容排序
此命令除了显示文档的内容外，还可以将每一行句子按指定的要求进行重新排序。
$ sort data.txt		#对文件的每行文本按照字母进行排序
$sort -n -k2 data.txt 	#对第二列按数字排列
参数说明：
-n: 按数字排序，默认按照字母排序；
-k: 指定第几列；
-r: 按逆向排序。

24. uniq – 只显示不重复的行
此命令比较相邻的行，如果有连续相同的行，只会显示一行。如果相同的行是不连续的，则各行还是会显示。一般与sort配合使用，去除所有重复行
$ sort data.txt | uniq -c		#对文件的每行文本按照字母进行排序，只显示不重复行
参数说明：
-c: 显示每行出现次数；
-d: 显示内容相同的行；
-u: 显示内容不同的行。

25. sed – 文件处理工具
此命令以行为单位进行处理，可将文件每行的内容进行替换、删除或新增等操作。
$ echo -e ‘seq1,acacagaag\nseq2,tcgtagcat\n’ > seq.txt
$ sed ‘s/,/\n>/’ seq.txt		#将每行的逗号，替换成回车符加>号
seq1
>acacagaag
seq2
>tcgtagcat

#### 系统及进程
26. top - 查看进程
top命令可查看进程ID (PID)、CPU、内存占用等信息。按“q”键退出。
$top    #显示系统当前进程信息

27. ps - 查看进程状态(process status)
ps命令可查看进程ID (PID)、CPU、内存占用等信息。
$ps    #显示当前进程信息

28. kill - 结束进程
命令格式为：kill [-num] PID (进程ID)
$kill -9 78101    #杀死进程号为78101的进程
参数说明：
-9：强制杀死，不返回信息

29. nohup - 后台运行命令
功能说明：加到命令前使得该命令在用户退出登录后也能继续执行。一般与转后台符’&’一起使用，将&加到命令结尾，使该命令在后台运行。
$ nohup perl test.pl &	#后台执行perl脚本
nohup使屏幕输出默认重定向到nohup.out文件中，特别是在命令终端关闭后也不会使程序中断。

#### 网络转输工具
30. scp – 远程拷贝文件命令(secure copy)
scp命令与cp命令功能类似，但scp能在本机与远程服务器间进行文件拷贝，而且SCP传输是加密的。
如要将远程服务器(remote_host)上的用户目录（~）下的file1文件复制到当前目录(“.”):
$scp user@remote_host:~/file1 .		
$scp -r user@remote_host:/dir1 ~/dir1	#将服务器上的整个目录复制到 本地下
$scp filename user@remote_host:~/	#将本地文件复制到服务器上的用户 目录
参数说明：
-r：表示复制目录

31. wget – 下载文件命令
wget是Linux系统中的一个下载文件的命令工具。wget支持HTTP，HTTPS和FTP协议，可以使用HTTP代理，可以自动下载、支持断点续传等。
$wget -c ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.2.30+-x64-linux.tar.gz
参数说明：
-c：接着下载没下载完的文件(continue)

### 数据流重定向与管道

在Linux命令行界面中，如果命令所需要的输入不是来自键盘，而是来自指定的文件，这就是输入重定向。同理，命令的输出不是显示在屏幕上，而是写入到指定的文件中，就是输出重定向。生物信息分析经常需要用到重定向，将程序的运行结果或过程信息保存到文件上，便于后续查看分析。一般通过“>”实现输出重定向，而"<"是输入重定向。如：
$ls > file.txt #显示文件列表到文件file.txt，如果file.txt已经存在，则会覆盖内容。
$cat file1 file2 file3 >> files.txt #追加内容到files.txt
数据流重定向的涉及的重要概念有三个：
* 标准输入(stdin)：代码为0，使用<或<<表示，默认从键盘输入；
* 标准输出(stdout)：代码为1，使用>或>>表示，默认显示在屏幕上；
* 标准错误输出(stderr): 代码为2，使用2>或2>>表示，默认显示在屏幕上。
其中，“<”表示从文件输入，其后接着待输入的文件名，遇到 “<<”后的文字则终止标准输入。“>”表示输出到文件，如当前目录有同名文件存在，则会覆盖其内容。“>>”表示将标准输出的内容累加输入到该文件。
#### 管道操作
Linux系统使用管道将多个命令组合起来，形成非常强大的工具组合，可完成复杂的分析工作。管道符“｜”将两个命令隔开，管道符左边命令的输出就会作为管道符右边命令的输入。连续使用管道意味着第一个命令的输出作为第二个命令的输入，第二个命令的输出又会作为第三个命令的输入，依此类推。 
$ls | wc  #显示当前目录下的文件数
$less seq.fa |grep ">" | wc -l  #显示FASTA文件中的序列数
该管道命令的执行过程是用less查看seq.fa文件，在打开的seq.fa中用grep查找其中的“>”所在行，再用wc统计行数。由于FASTA格式文件一个>符号对应一条序列，所以可以得到序列数。

### Linux环境变量
Linux环境变量是一个符号名，系统把它关联到一些信息，它代表了变量的值。常用的变量名有USER（你的登录名），HOST（计算机名称），HOME（你的家目录）以及PATH(系统搜索命令的目录)。当用户在终端输入一个命令或程序时，系统会自动到PATH变量中的目录列表中去查找命令，一般系统命令默认放在/sbin与/usr/bin目录。如果用户自己安装的程序，需要把安装程序的路径添加到PATH中，才可以在任何目录运行程序，不然要在程序前加上程序的完整路径才可以运行。
Linux的命令export可以把安装程序目录输出到环境变量，如：
$export PATH=$PATH:/opt/blast-2.2.21/bin    #将blast程序安装目录加入PATH变量
在终端的命令行输出的环境变量只在当前shell可用，关闭终端窗口后就失效了。为了使输出 的环境变量在以后都能运行，则需要将export命令写入配置文件(~/.bashrc)。
$echo "export PATH=$PATH:/opt/blast-2.2.21/bin" >> ~/.bashrc
$source ~/.bashrc

### Linux软件安装
与Windows系统相比，以前Linux系统下安装软件显得比较麻烦，需要下载软件源代码，要查看软件的安装说明，然后再安装。现在许多Linux发行版也都有软件管理工具，如Ubuntu使用Debian的APT包管理器，而Redhat使用RPM (Redhat Package Manager)。这使Linux安装软件也就跟安装windows软件一样简单了。
#### 包管理器
(1) APT命令行软件包管理器 
常用命令apt-get来安装软件：
$ sudo apt-get install software_name 
如果您不知道具体的软件包名称，可以使用apt-cache search来搜索软件包：
$ apt-cache search software_name
在搜索软件包之前，最好使用apt-get update命令在网上更新一下目前所有可用的软件包列表。
$ sudo apt-get update

Ubuntu 16.04版本起采用更友好的apt命令行软件包管理器。apt提供软件包搜索，管理和信息查询等功能，与apt-get和apt-cache等功能相同。
以下是apt常用命令的说明，更多信息可通过apt --help查看:
	list - 根据名称列出软件包
	search - 搜索软件包描述
	show - 显示软件包细节
	install - 安装软件包
	remove - 移除软件包
	autoremove - 卸载所有自动安装且不再使用的软件包
	update - 更新可用软件包列表(只检查)
	upgrade - 安装/升级软件来更新系统
要自动升级系统可以联合update与upgrade命令：
$ sudo apt update && sudo apt upgrade -y


(2) Debian软件包
另外有些程序只提供Debian软件包 (文件扩展名.deb)，可以下载deb包，并用Debian经典命令dpkg安装。
安装基本命令为： 
$ sudo dpkg –i filename.deb (deb包名)
这里参数-i是指安装deb包，更多参数的说明可以参考dpkg的命令帮助。
dpkg将自动将deb文件解包，并将软件安装到默认的目录下，同时将软件的安装信息注册到Debian软件包的数据库中。

#### 源码安装方法
一般软件源代码是以压缩包的形式提供下载，如software_name-1.5.1.tar.gz. software_name表示软件名称, 1.5.1表示版本号。后缀.tar.gz指用linux系统打包工具tar打包，并压缩后的文件。 
因此在安装前，先要解压缩： 
$tar -xvzf software_name-1.5.1.tar.gz 
源代码安装程序一般只需要几个基本步骤：
$ ./configure          #配置信息
// 参数"--prefix=目录"指定安装路径(目录), 默认是“/usr/local/bin”。
$ make          #编译
// 参数" -f "可指定make编译的对象文件，默认为当前目录下，名为"Makefile"的文件。
make原理是执行Makefile文件里的指令，make的基本用处是自动根据makefile里的指令来编译源文件，安装软件及卸载软件等。
$ make install #完成安装，一般需要超级用户权限（sudo make install）。
//把所安装程序的可执行文件复制到系统的PATH路径下，如“/usr/local/bin"是系统默认的执行文件目录。这样系统才能找到相应的程序，如果程序不是安装在系统目录下，就需要你再设置PATH变量，才能在任何目录下正常运行。
源代码安装方法对很多平台都适用，但此方法需要平台已经安装有程序相关的编译器和依赖的库。如果软件安装比较复杂，你可以阅读软件提供的INSTALL或README文件，了解软件的具体安装说明。

### 参考资料
1. 极客学院Linux教程：http://wiki.jikexueyuan.com/project/learn-linux-step-by-step/