library(zoo)
library(corrplot)
df <- dat
df[,c(4,5,6,7,8,9,10,11,12,13)] <- na.spline(df[,c(4,5,6,7,8,9,10,11,12,13)])
sdf <- df[,c(4,5,6,7,8,9,10,11,12,13)]
M<-cor(df[,c(4,5,6,7,8,9,10,11,12,13)])
corrplot(M, method="circle",type = "lower",col = NULL,
         title = "Correlation matrix plot",tl.col = "black",
         tl.cex = 0.8,tl.srt = 0)
