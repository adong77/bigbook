Matplotlib库中的图表由两部分构成，画布(Figure)和子图(Axes)，其各部分主要结构如图所示。Figure为绘图提供了画布区域，Axes则包括了图表的组成元素，如坐标轴、标签、线和标记等，Axis为坐标轴对象。
![Matplotlib的图表结构](<../Images/matplotlib_figure_axes_axis.png>)

图表中的主要元素包括：
1. 标题：title()
2. 图例：legend()
3. X/Y轴标签：xlabel(), ylabel()
4. X/Y轴的上下限：xlim(), ylim()
5. 网格线：grid()
6. 水平线与垂直线：axhline(), axvline()
7. 区间: axvspan(), axhspan()
8. 注释：annotate().

其主要分布如下图所示：
![Matplotlib的图表各元素](https://matplotlib.org/stable/_images/anatomy.png)