SAM是一种存储大规模测序短序列比对结果的文件格式。Samtools则是操作这个文件格式的一系列工具。下面介绍这款软件的下载、编译、安装和运行方法，详情见其官网(http://www.htslib.org/download/)。
## 下载
* 可通过Samtools官网下载Samtools安装包，下载当前版本的源码(Download current source releases)。同时，由于Samtools自身依赖于HTSlib库，因引还需要下载HTSlib库的安装包。
* 下面通过命令行方式下载安装包：
```
$mkdir ~/biosoft/samtools
$cd ~/biosoft/samtools
$wget -c https://github.com/samtools/samtools/releases/download/1.15.1/samtools-1.15.1.tar.bz2
$wget -c https://github.com/samtools/htslib/releases/download/1.15.1/htslib-1.15.1.tar.bz2
$tar -xjvf samtools-1.15.1.tar.bz2
$tar -xjvf htslib-1.15.1.tar.bz2
```
解压之后，多了一个文件夹samtools-1.15.1，里面有很多个文件，其中有一个configure文件，用于配置安装变量。

## 安装
从源码安装软件：
```
$cd samtools-1.15.1/
$./configure --prefix=/home/adong/biosoft/samtools
$make
$make install
```
如果屏幕上没有报错信息，则表示安装成功了。
> 如果configure命令运行报错，可根据提示安装相应缺少的库文件。这里缺少两个库文件： `sudo apt install libbz2-dev liblzma-dev`

为方便在任何路径运行Samtools程序，可把可执行文件所在bin文件夹放到环境变量$PATH中：
```
$echo 'export PATH="/home/adong/biosoft/samtools/bin:$PATH" ' >> ~/.bashrc
$source ~/.bashrc
```
## 使用
通过直接输入samtools查看其有哪些命令:
```
$samtools
```
从上面命令输出可以看到，大致有5类命令：Indexing,Editing,File operations,Statistics,Viewing。
常用命令的使用方法可以参考：[https://www.jianshu.com/p/6b7a442d293f](https://www.jianshu.com/p/6b7a442d293f)
