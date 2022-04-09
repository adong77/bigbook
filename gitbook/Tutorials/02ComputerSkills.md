# 计算机技能基础(Computer Skills)


## Tools
* [Notepad2代替Windows记事本](http://blog.ligene.cn/2017/07/04/notepad2/)
* BioEdit
* [谷歌上网助手](http://blog.ligene.cn/2020/04/08/ghelper/)

### WSL
Windows 10中的Linux子系统对Linux初学者十分友好。无论是Linux命令行还Linux图形应用，都可以通过WSL在Windows 10中使用。
* 为方便在Linux系统下直接访问Windows系统分区下的文件夹，可以通过ln (link)命令把Windows下的目录链接到Linux系统的用户目录下面：

```
$ ln -s /mnt/c/bigbook   ~/bigbook
$ ls
```

可以看到已经在用户目录下有个bigbook的链接（相当于Windows下的快捷方式）。这样下次打开Ubuntu终端，然后切换到这个bigbook目录(cd bigbook)，就相当到Windows系统下的bigbook文件夹(/mnt/c/bigbook)。如果Windows系统下的目录路径较长会比较方便。

* 使用Ubuntu的图形应用
要在WSL中使用Ubuntu丰富的图形界面应用，需要首先安装X-Window的Windows显示服务器，如Xming与VcXsrv。
1. 安装VcXsrv
首先从SourceForge上面下载最新版本的VcXsrv: https://sourceforge.net/projects/vcxsrv/
目前版本是vcxsrv-64.1.20.8.1.installer.exe, 下载好后直接使用默认的Full完整安装就行。
安装完成后，启动开始菜单中的XLaunch,设置一般默认即可。注意，勾选禁止访问控制。
2. 运行Ubuntu图形应用
要在Windows 10上运行Ubuntu图形应用，需要提前运行VcXsrv，并在WSL中安装相应的应用。
```
sudo apt install x11-apps -y
DISPLAY=:0  xeyes
```
稍等片刻，就可以在Windows 10桌面上看到Ubuntu的xeyes图形应用运行起来了。

每次运行程序都要输入DISPLAY=:0挺累的，执行下列指令后重启bash即可省去这个步骤：
```
echo "export DISPLAY=:0.0" >> ~/.bashrc
source ~/.bashrc
```
原理很简单，VcXsrv是一个X-Window的Windows显示服务器，由于已经设置了环境变量，就可以模拟出一个Ubuntu的图形运行环境。