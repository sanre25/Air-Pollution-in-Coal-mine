#using ggplot
library(ggplot2)

dat$PM2.5 <- na.spline(dat$PM2.5)

feb <- subset(dat,(dat$month==2))
mar <- subset(dat,(dat$month==3))
apr <- subset(dat,(dat$month==4))

p <- ggplot(dat, aes(x=s_num, y=PM2.5)) + 
  geom_line() +   xlab("")+
  labs(title="PM2.5 variation across all given month")+theme_bw()+
  theme(
    plot.title = element_text(color = "Black", size = 10, face = "bold"),
  )
p

p1 <- ggplot(feb,aes(x=s_num,y=PM2.5))+geom_line()+xlab("")+theme_bw()+
  labs(title="Zoomed Version for each month")+
  theme(
    plot.title = element_text(color = "Black", size = 8, face = "bold"),
    #plot.subtitle = element_text(color = "black"),
    #plot.caption = element_text(color = "blue", face = "italic")
  )

p2 <- ggplot(mar,aes(x=s_num,y=PM2.5))+geom_line()+xlab("")+theme_bw()

p3 <- ggplot(apr,aes(x=s_num,y=PM2.5))+geom_line()+xlab("Univariate Time")+theme_bw()
multiplot(p,p1,p2,p3)
#boxplot(PM10~hr,data = feb)

week_feb <- subset(dat,subset = (dat$month==2)&((dat$day==1)|
                                                  (dat$day==2)|(dat$day==3)|(dat$day==4)|
                                                  (dat$day==5)|(dat$day==6)|(dat$day==7)))
ggplot(week_feb, aes(x=s_num, y=PM2.5)) + 
  geom_line() +   xlab("First Week of Feb 2023")+theme_bw()+
  labs(title="Variation of conc. across Week")
