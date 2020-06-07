#Stacked Bar Plots in R
install.packages("ggplot2")
install.packages("reshape2")
install.packages("scales")
library(ggplot2)
library(reshape2)
library(scales)

#set your working directory by either setwd() 
setwd("c:/bigbook/")
#upload your data to R
data <- read.table("otus_taxa.txt", header = T, sep = "\t")
head(data)
#data <- data[,c(0:12)]	# select 11 genus
#convert data frame from a "wide" format to a "long" format
datam = melt(data, id = c("Sample"))
datam$value <- datam$value * 100


#make the plot!
n <- length(levels(datam$variable))
#n = 11?
cols <- hue_pal(h = c(0,360) + 15, c = 100, l = 65, h.start = 0, direction = 1)(n)[c(11,7,1,3,5,9,2,6,4,8,10)]
ggplot(datam, aes(x = Sample, y = value)) + 
    geom_bar(aes(fill = variable), stat = "identity") +
    labs(x = "Sample", y = "Relative abundance (%)") +
    scale_fill_manual(name = "Genus", values = cols)
