## SMS-生物序列分析的在线工具
SMS (Sequence Manipulation Suite)是一个生物序列分析工具的集合。SMS由JavaScript编写，使用十分方便，只要浏览器打开SMS网站(http://www.bioinformatics.org/sms2/index.html)，就可以直接运行这些分析工具。但在线使用可能受电脑网络速度的影响会比较慢，你也可以免费下载到本地电脑上，解压后离线使用SMS。
> The Sequence Manipulation Suite is a collection of JavaScript programs for generating, formatting, and analyzing short DNA and protein sequences. It is commonly used by molecular biologists, for teaching, and for program and algorithm testing.

SMS提供60多种常用的序列分析功能，主要包括格式转换（Format Conversion）、序列分析（Sequence Analysis）、序列作图（Sequence Figures）、随机序列（Random Sequences）和其他序列分析（Miscellaneous）5个部分。这些分析工具全部列在SMS网站主页的左边栏(见图1左侧)。
![SMS-HomePage](https://raw.githubusercontent.com/adong77/ligene/master/Images/SMS_fig1.jpg)
图1. SMS网站主页

SMS网站提供很多DNA和蛋白质序列分析工具，如DNA/蛋白质序列过滤，序列反向互补，蛋白质翻译和PCR引物分析等。下面就给大家简单介绍几个例子。

1. GenBank文件特征提取
有时候我们得到了一个GenBank文件，想要拿到里面的mRNA，或者CDS序列。我们需要去看GenBank注释信息，然后找到对应mRNA的起始位点和终止位点，然后复制相应的序列，比较麻烦。SMS有一个GenBank Feature Extractor提取工具，可以很容易完成这件事情。
首先我们点击网站左边的“GenBank Feature Extractor”，弹出如图2页面，我们只需要将GenBank文件的内容粘贴到文本框里，点击提交按钮（submit）就可以。
![SMS-GenBank](https://raw.githubusercontent.com/adong77/ligene/master/Images/SMS_fig2.jpg)
图 2. GenBank Feature Extractor分析页面

SMS网站提供了一个示例，我们可以直接点击提交按钮，在新跳出的网页查看结果（见图3），拉下网页将看到生成了mRNA，CDS序列等，序列格式都是fasta。
![SMS-GenBank-Feature](https://raw.githubusercontent.com/adong77/ligene/master/Images/SMS_fig3.jpg)
图 3. GenBank Feature Extractor结果页面

2. 反向互补序列
很多时候，如设计反向引物序列时，我们需要得到DNA序列的反向互补序列。SMS提供了序列反向互补处理功能。
点击网页左侧的“Reverse Complement”，出现如图4的页面，只要把我们的序列粘贴到文本框中，点击提交即可在新的页面看到结果，是不是so easy！该网页分别提供了参数选择框，可选择Reverse(反向)，或Complement（互补）序列分析。
![SMS-RevComp](https://raw.githubusercontent.com/adong77/ligene/master/Images/SMS_fig4.jpg)
图 4. Reverse Complement分析页面

3. 序列比对的保守序列分析
通过多序列比对找出保守序列是常见的生物信息分析之一。SMS网站提供了该项分析，并且可以将保守序列着色，突出显示。
点击网页左侧的“Color Align Conservation”，在弹出的页面的输入框中提供已经比对好的序列，还可以设置其他参数，如一致性或者相似性多少（Percentage of sequences that must agree for identity or similarity coloring to be added），着色背景还是文字（Used colored）等。
我们提交示例，使用默认参数，将看到下图结果，左边显示序列的名称，右边显示序列的位置。
![SMS-Align-Conservation](https://raw.githubusercontent.com/adong77/ligene/master/Images/SMS_fig5.jpg)
图5. Color Align Conservation结果页面

这种图在很多论文中都采用！如果想制作彩色比对，而不是黑白比对，可以试试另一个工具(Coloar Align Properties)，使用方法和Color Align Conservation工具一致。
