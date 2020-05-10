library(imager)
setwd("C:/Users/adong/Pictures")
bio <- load.image("bio-big-data.jpg")
str(bio)
# 'cimg' num [1:460, 1:259, 1, 1:3] 0.02353 0.00784 0.00392 0.00784 0.01569 ...
#可见图片为三维数组,第三维为RGB
bio[ , , 3] <- 0	#黄色==#FFFF00
plot(bio)

#区域马赛克
area_coor_x <- 350:449 #100
area_coor_y <- 100:199 #100
array_dim <- c(length(area_coor_x), length(area_coor_y), 3)
array_data <- runif(prod(array_dim))
> str(array_data)
 num [1:30000] 0.286 0.822 0.491 0.033 0.246 ...

random_noise <- array(dim = array_dim, data = array_data)
bio[area_coor_x, area_coor_y, ] <- (1 - 0.3) * bio[area_coor_x, area_coor_y, ] + 0.3 * random_noise
plot(bio)
