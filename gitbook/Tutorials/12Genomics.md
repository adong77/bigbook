# Genomics


### JRE安装
打开JAVA网址(java.com), 点击大红按钮Free Java Download，再点击大红按钮Agree and Start Free Download，下载Java安装程序，然后双击安装，跟普通安装程序一样。JAVA(64-bit)默认安装的路径在C:\Program Files\Java。

* 安装完后进行环境配置:
注意：JRE1.8之后安装程序会自动增加环境变量，不需要再自己手动配置环境变量。
打开环境变量的步骤：
右键选中我的电脑，点击属性，再选择高级系统设置，点击按钮“环境变量”。
1.JAVA_HOME 
变量值：C:\Program Files\Java\jre1.8.0_161
2.CLASSPATH 
.;%JAVA_HOME%\lib（注意前面的.）
3.Path
在变量值最前面添加变量值：%JAVA_HOME%\bin;

