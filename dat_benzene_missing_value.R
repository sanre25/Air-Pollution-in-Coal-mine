

# figure 1
df <- dat
p <- ggplot(data=dat,aes(x=s_num,y=PM10)) + geom_line()+xlab("Univariate Time")
p + labs(title = "Before Interpolation",caption = "mean = 181")+theme_bw()
ind <- which(is.na(df$PM10))
ind
df$cl <- 1
df$cl[ind] <- 2
library(zoo)
df$PM10 <- na.spline(df$PM10)
p <- ggplot(data=df,aes(x=s_num,y=PM10)) + geom_line(colour=df$cl)+xlab("Univariate Time")
p + labs(title = "After Interpolation",caption = "mean = 191.92")+theme_bw()

# dealing with benzene missing value
q <- ggplot(data=dat,aes(x=s_num,y=benzene)) + geom_line()+xlab("Univariate Time")
q
vec<- unique(dat$benzene)
vec
library(dplyr)
table(dat$benzene)
library(plyr)
z <- count(dat$benzene)
z$prob <- (z$freq)/sum(z$freq[1:6])
ind <- which(is.na(dat$benzene))

dat$benzene[ind]<-sample(x=c(0.1,0.2,0.3,0.4,0.5,0.6),size=length(ind),replace = T,
       prob = c(z$prob[1],z$prob[2],z$prob[3],
                z$prob[4],z$prob[5],z$prob[6]))
#### NOt a good solution


