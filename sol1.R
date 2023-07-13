
# estimating density functions
pm10 <- dat$PM10

na_index <- which(is.na(pm10))

pm10[na_index] <- 0
mean(pm10)
pm10[na_index] <- mean(pm10)
plot(density(pm10))

s_pm10 <- sample(pm10,size = 1000,replace = F)
plot(density(log(s_pm10)))
plot(density(s_pm10))
hist(pm10)

# 13:45 to 14:25 time 
index <- c(which(dat$tem=="13:45:00"),which(dat$tem=="14:00:00"),
           which(dat$tem=="14:15:00"),which(dat$tem=="14:30:00"))

summary(dat$PM10)
summary(dat$PM10[index])
### in this case looks like in that time mean is decreased.

summary(dat$NO2)
summary(dat$NO2[index]) ## in this case too same result



library(ggplot2)
ggplot(data = dat,aes(x=det,y=PM10)) + geom_line()

#EuStockDF<-as.data.frame(EuStockMarkets) 
#EuStockDF$Date<-as.numeric(time(EuStockMarkets)) 
#head(EuStockDF) 

dat2 <- dat
dat2$det <- as.numeric(time(dat2$det))

plot.ts(dat$PM10)

ggplot(EuStockDF,aes(x=Date, y=SMI))+geom_line()

ggplot(dat,aes(x=s_num))+
  geom_line(aes(y=PM10),color="blue")+
  geom_line(aes(y=NO2),color="red")+
  geom_line(aes(y=NO),color="green") +
  geom_line(aes(y=PM2.5),color="black")+
  geom_line(aes(y=NOX),color="purple") +
  geom_line(aes(y=CO),color="yellow")

#* lets write code for each day ie create dataset

pm10 <- numeric(length = 90)

dat2 <- dat

index <- which(is.na(dat$PM10))
dat2$PM10[index] <- 0

pm[1] <- mean(dat2$PM10[1:96])

for(i in 2:90){
  pm10[i] <- mean(dat2$PM10[(96*(i-1)+1):(96*i)])
}
plot(x=1:90,y=pm10,type = "p")
abline(h=mean(pm10),col = "red")
