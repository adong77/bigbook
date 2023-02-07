#首先还是先分享一下码吧！！
setwd("位置") 
# 安装R包 
# ############################## 
# if (!requireNamespace("VennDiagram", quietly = TRUE)) 
#   install.packages("VennDiagram",repos = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/") 
# if (!requireNamespace("ggplot2", quietly = TRUE)) 
#   install.packages("ggplot2",repos = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/") 
# if (!requireNamespace("venn", quietly = TRUE)) 
#   install.packages("venn",repos = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/") 
# if (!requireNamespace("RColorBrewer", quietly = TRUE)) 
#   install.packages("RColorBrewer",repos = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/") 
# if (!requireNamespace("data.table", quietly = TRUE)) 
#   install.packages("data.table",repos = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/") 
# ################################ 
#  
# ## 

library(VennDiagram) 
library(ggplot2) 
library(venn) 
library(RColorBrewer) 
## 自定义函数 
## 快速读入数据 
readFlie=function(input,type,row=T,header=T){ 
 # input 为读入文件的路径，type为读入文件的类型，格式为‘.txt’或‘.csv’,row=T,将文件的第一列设置为列名 
  library(data.table,quietly = TRUE) 
 if(type=='txt'){ 
    dat = fread(input,header = header,sep='\t',stringsAsFactors = F,check.names = F) 
 if(row){ 
      dat = as.data.frame(dat,stringsAsFactors = F) 
      rownames(dat) = dat[,1] 
      dat = dat[,-1] 
    }else{ 
      dat = as.data.frame(dat,stringsAsFactors = F) 
    } 
  }else{ 
    dat = fread(input,header = header,sep=',',stringsAsFactors = F,check.names = F) 
 if(row){ 
      dat = as.data.frame(dat,stringsAsFactors = F) 
      rownames(dat) = dat[,1] 
      dat = dat[,-1] 
    }else{ 
      dat = as.data.frame(dat,stringsAsFactors = F) 
    } 
  } 
  return(dat) 
} 

## 绘制venn图 
wn_venn=function(list,col='black'){ 
 # 定义颜色体系 
  library(RColorBrewer,quietly = TRUE) 
 #corlor = brewer.pal(8,'Dark2') 
  corlor = brewer.pal(8,"Accent") 
 # 绘制Venn图 
  library(VennDiagram, quietly=TRUE) 
  library(venn,quietly = TRUE) 
 if(length(list)<=11){ 
 if(length(list)<=4){ 
      graphics=venn.diagram(list,filename=NULL,fill = corlor[1:length(list)], 
                            col = col,alpha = 0.5, cat.cex = 1.5,rotation.degree = 0) 
      grid.draw(graphics) 
    }else if(length(list)==5){ 
      graphics=venn(list, zcolor = corlor[1:length(list)],box=F,ellipse =TRUE,cexil = 1, cexsn = 1) 
    }else{ 
      graphics=venn(list, zcolor = corlor[1:length(list)],box=F,cexil = 1, cexsn = 1) 
    } 
    return(graphics) 
  }else{ 
    print('The function only supports data of dimension 7 and below.') 
  } 
} 
## 保存图片,只支持ggplot对象 
savePlots=function(path,plot,type=c('pdf','png','tiff')[1],width=10,height=8,dpi=300){ 
 # path表示保存图片路径,需要加上相应的文件扩展名称 
  library(ggplot2) 
 if(type=='pdf'){ 
    ggsave(filename = path,plot = plot,width = width,height = height,device = 'pdf') 
  }else if(type=='png'){ 
    ggsave(filename = path,plot = plot,width = width,height = height,device = 'png',dpi = dpi) 
  }else{ 
    ggsave(filename = path,plot = plot,width = width,height = height,device = 'tiff',dpi = dpi) 
  } 
} 

# 读入数据 

df = readFlie('df_test.txt',type = 'txt',row = F) 
# 抽取数据，制造测试数据 
head(df) 
df_list = list('set01'=sample(df$set01),'set02'=sample(df$set02), 
               'set03'=sample(df$set03),'set04'=sample(df$set04), 
               'set05'=sample(df$set05),'set06'=sample(df$set06), 
               'set07'=sample(df$set07),'set07'=sample(df$set07), 
               'set08'=sample(df$set08),'set09'=sample(df$set09), 
               'set10'=sample(df$set10),'set11'=sample(df$set11)) 
# 绘制venn图 
## 4维veen图 
fg_4 = wn_venn(df_list[1:4]) 
## 5维veen图 
fg_5 = wn_venn(df_list[1:5]) 
## 6维venn图 
fg_6 = wn_venn(df_list[1:6])+theme(text = element_text(size = 12)) 
## 7维veen图 
fg_7 = wn_venn(df_list[1:7])+theme(text = element_text(size=12)) 
## 8维veen图 
fg_8 = wn_venn(df_list[1:8])+theme(text = element_text(size=12)) 
# 保存图片ePlots(path = './fg_4.pdf',plot = fg_4,type = 'pdf',width = 10,h10,height = 10vePlots(path = './fg_4.png',plot = fg_4,tye = 'png',width = 10,height = 10,dpi = 300) 

savePlots(path = './fg_4.tiff',plot = fg_4,type = 'tiff',width = 10,height = 10,dpi = 600) 
savePlots(path = './fg_5.tiff',plot = fg_5,type = 'tiff',width = 10,height = 10,dpi = 600) 
savePlots(path = './fg_6.tiff',plot = fg_6,type = 'tiff',width = 10,height = 10,dpi = 600) 
savePlots(path = './fg_7.tiff',plot = fg_7,type = 'tiff',width = 10,height = 10,dpi = 600) 

pdf('./fg5.pdf',width = 10,height = 10) 
fg_5 = wn_venn(df_list[1:5]) 
dev.off() 
###### 