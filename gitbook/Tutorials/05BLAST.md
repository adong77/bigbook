# 序列数据库搜索(BLAST)

[TOC]

* [Linux下BLAST+的本地化安装与基本使用方法](http://blog.ligene.cn/2017/07/05/BLAST-Tutorial/)

In order to increase the speed of alignment, the BLAST algorithm was designed to approximate the results of an alignment algorithm created by Smith and Waterman (1981), but to do so without comparing each residue against every other residue (Altschul et al., 1990). BLAST is therefore heuristic in nature, meaning it has "smart shortcuts" that allow it to run more quickly (Madden, 2005). However, in this trade-off for increased speed, the accuracy of the algorithm is slightly decreased.  
![Figure 2: Generating word seeds.](http://www.ligene.cn/images/book/blast_f2.jpg)

### The BLAST Heuristic 
BLAST increases the speed of alignment by decreasing the search space or number of comparisons it makes. Specifically, **instead of comparing every residue against each other, BLAST uses short "word" (w) segments to create alignment "seeds."** BLAST is designed to create a word list from the query sequence with words of a specific length, as defined by the user (Figure 2). Requiring only three residues to match in order to seed an alignment means that fewer sequence regions need to be compared. Larger word sizes usually mean that there are even fewer regions to evaluate (e.g., Figure 3A compared to Figure 3B). Once an alignment is seeded, BLAST extends the alignment according to a threshold (T) that is set by the user. When performing a BLAST query, the computer extends words with a neighborhood score greater than T (Figure 3C). A cutoff score (S) is used to select alignments over the cutoff, which means the sequences share significant homologies. If a hit is detected, then the algorithm checks whether w is contained within a longer aligned segment pair that has a cutoff score greater than or equal to S (Altschul et al., 1990). When an alignment score starts to decrease past a lower threshold score (X), the alignment is terminated (Figure 3C). These and many other variables can be adjusted to either increase the speed of the algorithm or emphasize its sensitivity.
![Figure 3: Generating word seeds.](http://www.ligene.cn/images/book/blast_f2.jpg)

Scitable:
[Basic Local Alignment Search Tool (BLAST)](https://www.nature.com/scitable/topicpage/basic-local-alignment-search-tool-blast-29096/#)

### 习题
1. 通过BLAST搜索新冠病毒棘突蛋白(Spike)序列 (NCBI索引号：YP_009724390.1) 的同源基因，并推断新冠病毒的可能来源动物是什么？(提示：BLASTP数据集选项Organism中输入“SARS-CoV-2”并勾选“exclude”排除新冠病毒自身序列。)

### References
1. Lobo, I. (2008) Basic Local Alignment Search Tool (BLAST). Nature Education 1(1):215