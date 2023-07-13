
#
library(ggplot2)
library(reshape2)
library(dplyr)

covid1 =(read.csv(file="EUCOVIDdeaths.csv",header=TRUE)[,-c(2)])

head(covid1)


covid_deaths <- melt(covid1,id.vars=c("Country"),value.name="value",
                     variable.name="Day")

head(covid_deaths)

covid_plot <- ggplot(data=covid_deaths, aes(x=Day, y=value, group = Country,
                                            colour = Country))+ geom_line() +labs(y= "Deaths", x = "Day")
covid_plot + ggtitle("Daily Deaths for European countries in March,2020")+geom_point()

covid_plot
#################################################################3
library(ggplot2)
library(reshape2)
library(dplyr)
feb <- dat[which(dat$month==2),]
feb <- feb[ ,c(-14,-15,-16,-1,-3)]
melt(feb)

# convert feb data in desired format as above
df <- dat
row.names(feb) <- feb$From
feb <- feb[ ,-1]
cfeb <- data.frame(particle = colnames(feb))
#cfeb <- cbind(cfeb, as.numeric(feb[1,]))

for(i in 1:2688){
 # y <- paste(as.character(feb[i,1]))
  cfeb <- cbind(cfeb, as.numeric(feb[i,]))
}

dum_feb <- dat[which(dat$month==2),]

colnames(cfeb)[2] <- "sawre"
colnames(cfeb)[2] <- as.character(df$From[1])
for(i in 2:2689){
  colnames(cfeb)[i] <- as.character(dum_feb$From[i-1])
}

cfeb_melt <- melt(cfeb)
ggplot(data=cfeb_melt, aes(x=variable, y=value, group = particle,
                                            colour = particle))+ geom_line() +labs(y= "Concentration", x = "Day")+
  theme(axis.text.x = element_blank())+
  labs(title = "Multivariate Time-series Plot",
       subtitle = "Feb 2023",
       caption = "Data Source: Singrauli Coalfield")+
  theme(
    plot.title = element_text(color = "Black", size = 12, face = "bold"),
    plot.subtitle = element_text(color = "black"),
    plot.caption = element_text(color = "blue", face = "italic")
  )
### my final plot for 

#cfeb_melt$variable <- as.POSIXct(cfeb_melt$variable)
#
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

#c('Feb', 'Mar','Apr','MAy')

############ Rough
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
