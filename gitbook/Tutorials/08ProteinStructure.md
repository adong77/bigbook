## Protein Structure Prediction


1.1.1 利用RasMol查看蛋白质三维结构
RasMol是在Windows系统下直观再现生物大分子3D结构的软件，提供多个模式效果图、旋转缩放功能、及命令行操作功能，并可以存成普通图形文件。
（1）获得RasMol程序
1.	RasMol是开源软件，可以从互联网上免费下载。其官方网站是：http://www.openrasmol.org。下载最新的Windows版本RasWin2.7.5。
2.	以默认参数安装RasMol程序后，运行RasMol程序(图 8 8)：开始菜单→程序→RasWin。

![RasMol运行窗口](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/book/fig8-8.png)
图 8-8 RasMol运行窗口

（2）获得蛋白质结构数据文件
3.	在浏览器中输入http://www.pdb.org, 进入RCSB PDB数据库。
4.	在搜索框中输入GFP的PDB ID(1EMA)，查寻所需蛋白GFP的pdb文件。
5.	在搜索结果网页中，单击列表中的下载(Download Files)图标，选择“PDB format”下载文件（1ema.pdb）到电脑本地文件夹。

（3）	RasMol使用
（4）	打开pdb文件： 菜单file→open→选择”1ema.pdb”文件。打开后，可以看到蛋白GFP的分子结构以“线框模型(wireframe)”显示图像(图1)。
注意：在RasMol中已经打开一个pdb文档的情况下，要想打开另一个文件，必须先关闭前一个（点击file→ close）。否则，新打开的分子结构会与前一个分子结构叠加显示，不便于观察与分析。
（5）	点击菜单file→Information,可以看到此蛋白质的一些基本信息。
（6）	图形窗口中鼠标操作
* 先点击蛋白质，按住鼠标左键拖动，分子绕中心旋转；
* 按住鼠标右键拖动，分子在X-Y平面内平移。向左向右拖动光标，或向上向下拖动光标。
* 按住”Shift”键，鼠标左键拖动向上、向下移动，从而放大或缩小图像。
* 按住”Shift”键，鼠标右键拖动向左、向右移动，使图像以分子中心为中心在平面内顺时针、逆时针旋转。
* 按住“Ctrl”键，鼠标左键拖动向上使Z平面向远离视线方向移动，并显示Z平面以内的结构，下移向靠近视线方向移动。

（7）	DISPLAY菜单可以直接完成生物大分子相关模型的显示与分析，点击菜单”Display”，并分别选择每个子菜单，察看显示效果。
点击Display → Spacefill，然后点击Colours菜单选择不同颜色模式： 
* CPK：蛋白质的每个原子有单独的颜色，如炭原子为灰色，氮为蓝色，氧为红色，硫为黄色）。
* Shapely：每个氨基酸都有一种颜色。
* Chain：不同颜色显示多肽链，可清晰反映蛋白质亚基或DNA双链结构。
* Temperature：表示不同原子在分子中的热运动性（即位置的准确性），该数值包含在PDB文件的一列中。红色代表原子易于振动，而绿色与蓝色代表原子位置更加稳定不易于振动。
（8）	Options菜单的功能是调整显示选项，点击Options的各个子菜单选中或取消。如Hydrogens（H原子）与Hetero atoms（异原子，非蛋白质链上的原子或分子配体）显示与否，选中状态表示命令操作时有效。最后点击“Labels”，Labels (标记)可在显示立体分子的同时，将各原子或片段相应的信息标注在上面。
注意：X射线衍射法一般测不到H原子，所以PDB文件中没有H原子信息，H原子一般是显示软件根据结构化学原理加入的。
（9）	点击Export菜单，可以把图像存为BMP，GIF等格式文件，用于WORD、PPT文档等。
（10）	RasMol命令行窗口的使用，在Windows任务栏中选择命令行窗口（图 8-9）：
![RasMol命令行窗口](https://raw.githubusercontent.com/adong77/bigbook/master/imageBed/book/fig8-9.png)
图 8-9 RasMol命令行窗口

一些常用命令：
* select Lys: 选定分子中所有赖氨酸；
* select all: 选择所有的原子；
* select protein： 选择蛋白质原子；
* select hetero： 选择非蛋白质，非DNA原子。
* restrict protein： 在图形窗口中去除所有的非蛋白质原子； 
* restrict lys: 在图形窗口中去除所有的非lys残基；
注：在多亚基的分子聚合物中，需要指明所选分子的链。分子链一般用大写字母或数字表示，并用一个冒号与残基符号分隔，如“Lys70:A”或“Lys70:1”。

（11）	输入命令“select ligand”，回车后可以看到54个原子被选择。你可以通过输入“spacefill”显示这些原子，也可以通过Display菜单→Spacefill显示。
注：Ligands可能是任何可以与蛋白质特异性结合的分子或离子

（12）	放大显示选择的原子，将光标可以放到一个灰色的原子上。
（13）	鼠标单击此原子，可以在命令窗口看到如下信息：
Atom: CE 582 Hetero: MSE 78 Chain: A （说明你点击的原子为第5个碳原子在MSE分子上）

（14）	输入“color red”回车，可以看到选择的原子颜色变成红色了，后输入”color cpk”回车恢复。
（15）	再输入“select protein”回车。点击Display → “Ball and Stick”。 点击“Colour”→ “Shapely”。此时你看到”Ball and Stick”的蛋白质包含一个”spacefill”的MSE与CRO分子。
（16）	点击”Export” → GIF，文件存为“Ligand.gif”。
（17）	放大图像，直到MSE/CRO分子为窗口的1/4大小。鼠标点击任何一个接近MSE分子的氨基酸，可以在命令窗口看到氨基酸的信息，请查看接近MSE的所有氨基酸？
（18）	点击Display菜单→ Cartoon，此时可以看到组成蛋白质的氨基酸链
（19）	输入“select all”回车，及“select solvent”回车，可以看到溶剂分子，溶剂分子是蛋白质做晶体时的一部分。
（20）	再试试下面的命令：
* Select polar：选择极性的氨基酸
* Select hydrophobic： 选择疏水氨基酸
* Select charged：选择带电的氨基酸
* Select buried：选择包埋的氨基酸
* Select neutral： 选择中性的氨基酸
通过以上操作可以看出，利用“命令窗口”与“窗口菜单”都可以完成相关操作，但对“原子、残基或基团的选择”操作通过命令行窗口更方便，操作时注意切换使用。
