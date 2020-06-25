2019年12月在武汉爆发的新冠病毒肺炎（COVID-19），已经被世卫组织(WHO)宣布为全球大流行(pandemic)。国际病毒分类委员会(ICTV)最开始将导致COVID-19的新型冠状病毒命名为2019-nCoV，后正式命名为SARS-CoV-2，而我国部分病毒专家建议命名为HCoV-19。一个新冠病毒同时有三个英文名字，相当于我国古人的名，字，号。
目前关于2019-nCoV病毒的起源与可能传播途径有各种报道，众说纷纭。如果从基因组序列比对来看，还是武汉病毒所石正丽团队报道的蝙蝠病毒RaTG13与2019-nCoV序列相似度最高（96%）。后来报道的广东海关扣压的马来西亚穿山甲病毒(Guangdong1/P2S)只有90%的相似度，不大可能为新冠病毒从蝙蝠到人传播的中间宿主。后续研究可能会发现比RaTG13序列更相似的动物源冠状病毒。
  但是还有一种可能性：蝙蝠病毒可以直接感染人，而不需要通过中间宿主，已经有些研究报道蝙蝠病毒只要一点改变，如Spike蛋白突变，就可以传染人类。有些这方面的研究，也使许多人认为此新冠病毒可能为人工生物合成的病毒。总之，病毒的起源还是未解之谜！

  然而，我从一些病毒专业分析网站（如https://nextstrain.org/ncov）可以看到，目前进化树都是以来武汉病毒为根(图1)。这些进化树给人一个印象是病毒是从武汉起源，可能美国总统Trump也是看了这个图就说病毒是Chinese virus。但是这个图明显有一个问题，进化树中的节点(病毒序列)是以时间为顺序排列。这个时间是病毒被检测到并被测序的时间点，而最初测序的病毒都来自我国武汉等地区。但是病毒被测序的时间不代表是病毒的真实进化时间，这两者甚至没有关系。假如一个国家不进行病毒检测与测序，那么就不会发现新冠病毒。正如钟南山院士所说，病毒最先在武汉爆发，但不一定起源于武汉。
![ncov_tree1.png](https://raw.githubusercontent.com/adong77/ligene/master/imageBed/ncov_tree1.png)
图1. 新冠病毒进化树 (来源https://nextstrain.org/ncov)

  根据在生物信息学中学到的构建进化树知识，一般在不知道物种的进化亲缘关系时，进化树最好以无根(unrooted)树形式显示。目前500多株已测序的新冠病毒序列的无根树如下图所示。这个图可以预测不同病毒之间的亲缘关系，但不说明哪个病毒出现更早或更晚，即不推断祖先序列。从图2中可以看出，我国分离到的病毒序列（蓝色）都集中在上面几个分枝，而下面一大分枝并没有出现我国的病毒株；而有趣的是，分离自美国的病毒(红色)却在所有进化分枝中都存在。这说明从目前已测序的病毒序列来看，美国的病毒序列的多样性比中国的病毒更高。而多样性高一般可以作为物种起源的一个证据。例如现在科学界都认为人类起源于非洲，其中一个原因是人类基因组序列研究表明，非洲人的基因序列多样性比较高。而美国的冠状病毒的多样性高是不是可以说明新冠病毒起源于美国呢？ 当然，这是基于现在已测序的基因序列信息，随着各国病毒序列的增加，可能会有变化。
![ncov-tree2.png](https://raw.githubusercontent.com/adong77/ligene/master/imageBed/ncov_tree2.png)
图2 新冠病毒进化无根树 (来源https://www.gisaid.org/epiflu-applications/next-hcov-19-app/)

  学习生物信息学时，老师一般会说要确定一个进化树的根部，要利用一个与所分析物种亲缘关系比较远的物种作为外群(outgroup)来确定树根。我们知道蝙蝠病毒RaTG13是目前已知与新冠病毒最接近的序列，那么我们是不是可以以RaTG13为外群来确定新冠病毒的进化关系？通过网络查找，我没有发现以RaTG13为外群的进化树。从网站virological.org看到有一个人已经专门做了新冠病毒的进化树分析Phylogenetic analysis of nCoV-2019 genomes(http://virological.org/t/phylogenetic-analysis-of-23-ncov-2019-genomes-2020-01-23/335)，但可惜他没有以RaTG13为外群构建进化树，而是以武汉病毒为根（图3）。但他在进化树的图注中说明树根选武汉病毒是任意的(arbitrary)，原话是“The tree is rooted using the oldest sequence but this is an arbitrary choice”。这里的最老的(oldest)序列是指最早被检测并测序的意思。
![nCoV_phyml_tree_20200125.png](https://raw.githubusercontent.com/adong77/ligene/master/imageBed/nCoV_phyml_tree.png)
图3 Maximum likelihood tree of nCoV2019 genomes constructed using PhyML. The tree is rooted using the oldest sequence but this is an arbitrary choice. The scale bar shows the length of branch that represents 1 nucleotide change in the genome. (from http://virological.org/t/phylogenetic-analysis-of-23-ncov-2019-genomes-2020-01-23/335)

  为了反映新冠病毒的进化关系，我通过GISIAD数据库（https://www.gisaid.org/）下载部分新冠病毒基因组序列，包括中国、美国、欧洲、亚洲、美洲等国家，经过基因组序列比对，以最大似然法构建进化树，并以RaTG13为外群，以MEGA-X显示进树(图4)。图中红色为源自美国（USA）病人的病毒，而蓝色为源自中国不同地区病人的病毒。从图4中可以看出部分美国病毒(WA1/WA4-UW2)与蝙蝠病毒RaTG13的亲缘关系更接近，而从武汉分离到的最早病毒(Wuhan-Hu-1)相对遗传距离较远。 因此，从这个进化树来看，说明冠状病毒更可能起源于美国。
由于受我能使用的计算机性能限制，不能把所有500多株的序列都放一起构建进化树，但这些30株病毒序列是按照图2中所有序列的分枝clade选择部分代表序列，而且去除了部分测序质量差的序列，如含许多未知碱基(N)的序列。所以还是很有代表性，增加病毒序列数量不会对树的结构有很大改变。
![nCoV-tree3.png](https://raw.githubusercontent.com/adong77/ligene/master/imageBed/ncov_tree3.png)
图4 部分新冠病毒的进化树 （图中红色为源自美国（USA）病人的病毒，而蓝色为源自中国不同地区病人的病毒，以蝙蝠病毒RaTG13为树根并加黑显示。）

  特别需要说明的是，进化树是根据序列的差异及分子钟(molecular clock)理论来推断物种的进化关系。这个进化树中所用的新冠病毒序列之间的差异还是比较少，不到10个碱基，因此它们之间的遗传关系推断可能不准确。但是我们要强调的是，同理也不能按前面以武汉病毒为根的进化树来说病毒是起源于武汉，是吧？
  
  总之，根据目前的病毒序列信息，关于新冠病毒的起源及演化关系还没有定论，任何说病毒来源于武汉的言论都是没有根据的！而本文的分析结果，根据新冠病毒的序列多样性，及与蝙蝠病毒的遗传距离却说明病毒更可能来源于美国，但也需要进一步的验证，“让子弹再飞一会”。
