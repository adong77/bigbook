## 生命组学(Life Omics) 

* Multi-omics: genome, transcriptome, proteome, metabolome, and microbiome

![Omics-different-layers](http://www.ligene.cn/images/Omics_differentLayers.gif)

### Omics data
The omics data that are produced by the instruments are called raw data, and their size (generally large), the types of file, and structure will depend on the technology that is used. Below we illustrate two such examples using Sanger sequencing and mass spectrometry.

In Sanger sequencing (Figure 1), DNA is labelled using fluorophores, and different nucleotides are marked with different colours. Upon acquisition, light signal is acquired and recording of the different colours can be used to reconstruct the DNA sequence.
![Omics-different-layers](http://www.ligene.cn/images/book/sanger-sequencing.jpg)
In mass spectrometry, charged molecules are separated based on their mass-to-charge (M/Z) ratio and their intensities recorded to produce a spectrum. In proteomics, the molecules that are assayed are protein fragments called peptides. Upon fragmentation of peptides, the different between the M/Z peaks of the peptide fragment ions can be used to reconstruct the peptide sequence (Figure 2).
![Omics-different-layers](http://www.ligene.cn/images/book/de-novo-pep-sequencing.jpg)

The acquired data, even once processed, is still of very little use when it comes to understanding biology. Before samples are collected and data are generated, it is essential to carefully design a question of interest (research hypothesis) and the experiement that will allow to answer it. For example, if we want to understand the effect of a particular drug on cancer cells, and more specifically understand the effect on the transcription of all the expressed genes, on would need to measure gene expression (using for example RNA-Seq) in cancer cells in presence and absence of that drug.
