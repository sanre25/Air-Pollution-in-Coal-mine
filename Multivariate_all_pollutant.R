library(ggplot2)
library(reshape2)
library(dplyr)

df <- dat

#multiplot function
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}

p1<-ggplot(data=df, aes(x=s_num, y=PM10,colour=factor(month)))+ geom_line()+
  xlab("Univariate Time")+theme_bw()+
  scale_color_manual(labels=c('Feb', 'Mar','Apr','May'),values = c(2,3,4,5) )+
  labs(title = "PM10 Particle", color = "Month") +
  theme(
    plot.title = element_text(color = "Black", size = 12, face = "bold"),
    #plot.subtitle = element_text(color = "black"),
    plot.caption = element_text(color = "blue", face = "italic")
  )
# Final for PM10
p2<-ggplot(data=df, aes(x=s_num, y=PM2.5,colour=factor(month)))+ geom_line()+
  xlab("Univariate Time")+theme_bw()+
  scale_color_manual(labels=c('Feb', 'Mar','Apr','May'),values = c(2,3,4,5) )+
  labs(title = "PM2.5 Particle", color = "Month") +
  theme(
    plot.title = element_text(color = "Black", size = 12, face = "bold"),
    #plot.subtitle = element_text(color = "black"),
    plot.caption = element_text(color = "blue", face = "italic")
  )
p3 <- ggplot(data=df, aes(x=s_num, y=NO,colour=factor(month)))+ geom_line()+
  xlab("Univariate Time")+theme_bw()+
  scale_color_manual(labels=c('Feb', 'Mar','Apr','May'),values = c(2,3,4,5) )+
  labs(title = "NO Particle", color = "Month") +
  theme(
    plot.title = element_text(color = "Black", size = 12, face = "bold"),
    #plot.subtitle = element_text(color = "black"),
    plot.caption = element_text(color = "blue", face = "italic")
  )
p4<-ggplot(data=df, aes(x=s_num, y=NO2,colour=factor(month)))+ geom_line()+
  xlab("Univariate Time")+theme_bw()+
  scale_color_manual(labels=c('Feb', 'Mar','Apr','May'),values = c(2,3,4,5) )+
  labs(title = "NO2 Particle", color = "Month") +
  theme(
    plot.title = element_text(color = "Black", size = 12, face = "bold"),
    #plot.subtitle = element_text(color = "black"),
    plot.caption = element_text(color = "blue", face = "italic")
  )
p5 <- ggplot(data=df, aes(x=s_num, y=NOX,colour=factor(month)))+ geom_line()+
  xlab("Univariate Time")+theme_bw()+
  scale_color_manual(labels=c('Feb', 'Mar','Apr','May'),values = c(2,3,4,5) )+
  labs(title = "NOX Particle", color = "Month") +
  theme(
    plot.title = element_text(color = "Black", size = 12, face = "bold"),
    #plot.subtitle = element_text(color = "black"),
    plot.caption = element_text(color = "blue", face = "italic")
  )
p6<- ggplot(data=df, aes(x=s_num, y=CO,colour=factor(month)))+ geom_line()+
  xlab("Univariate Time")+theme_bw()+
  scale_color_manual(labels=c('Feb', 'Mar','Apr','May'),values = c(2,3,4,5) )+
  labs(title = "CO Particle", color = "Month") +
  theme(
    plot.title = element_text(color = "Black", size = 12, face = "bold"),
    #plot.subtitle = element_text(color = "black"),
    plot.caption = element_text(color = "blue", face = "italic")
  )
p7 <- ggplot(data=df, aes(x=s_num, y=SO2,colour=factor(month)))+ geom_line()+
  xlab("Univariate Time")+theme_bw()+
  scale_color_manual(labels=c('Feb', 'Mar','Apr','May'),values = c(2,3,4,5) )+
  labs(title = "SO2 Particle", color = "Month") +
  theme(
    plot.title = element_text(color = "Black", size = 12, face = "bold"),
    #plot.subtitle = element_text(color = "black"),
    plot.caption = element_text(color = "blue", face = "italic")
  )
p8 <- ggplot(data=df, aes(x=s_num, y=NH3,colour=factor(month)))+ geom_line()+
  xlab("Univariate Time")+theme_bw()+
  scale_color_manual(labels=c('Feb', 'Mar','Apr','May'),values = c(2,3,4,5) )+
  labs(title = "NH3 Particle", color = "Month") +
  theme(
    plot.title = element_text(color = "Black", size = 12, face = "bold"),
    #plot.subtitle = element_text(color = "black"),
    plot.caption = element_text(color = "blue", face = "italic")
  )
p9 <- ggplot(data=df, aes(x=s_num, y=ozone,colour=factor(month)))+ geom_line()+
  xlab("Univariate Time")+theme_bw()+
  scale_color_manual(labels=c('Feb', 'Mar','Apr','May'),values = c(2,3,4,5) )+
  labs(title = "ozone Particle", color = "Month") +
  theme(
    plot.title = element_text(color = "Black", size = 12, face = "bold"),
    #plot.subtitle = element_text(color = "black"),
    plot.caption = element_text(color = "blue", face = "italic")
  )
p10<-ggplot(data=df, aes(x=s_num, y=benzene,colour=factor(month)))+ geom_line()+
  xlab("Univariate Time")+theme_bw()+
  scale_color_manual(labels=c('Feb', 'Mar','Apr','May'),values = c(2,3,4,5) )+
  labs(title = "benzene Particle", color = "Month") +
  theme(
    plot.title = element_text(color = "Black", size = 12, face = "bold"),
    #plot.subtitle = element_text(color = "black"),
    plot.caption = element_text(color = "blue", face = "italic")
  )
multiplot(p1, p2,p3,p4,p5,p6,p7,p8,p9,p10, cols=2)