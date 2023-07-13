
# take vector y with ommiting na value imn column

y <- na.omit(dat$PM10)
hist(y)
plot(density(y))
mean(y)
sd(y)

log.y <- log(y)
x <- seq(-10,10,length=1000)
y <- dnorm(x,mean = mean(log.y),sd=sd(log.y))
plot(density(log.y))
lines(x=x,y=y)
#### implies pm10 follow log normal distribution roughly


y <- na.omit(dat$PM2.5)
hist(y)
plot(density(y))
mean(y)
sd(y)

log.y <- log(y)
x <- seq(-10,10,length=1000)
y <- dnorm(x,mean = mean(log.y),sd=sd(log.y))
plot(density(log.y))
lines(x=x,y=y)


y <- na.omit(dat$NO)
hist(y)
plot(density(y))
mean(y)
sd(y)

log.y <- log(y)
x <- seq(-10,10,length=1000)
y <- dnorm(x,mean = mean(log.y),sd=sd(log.y))
plot(density(log.y))
lines(x=x,y=y)
# NO does not follow the log normal

y <- na.omit(dat$NO2)
hist(y)
plot(density(y))
mean(y)
sd(y)


log.y <- log(y)
x <- seq(-10,10,length=1000)
y <- dnorm(x,mean = mean(log.y),sd=sd(log.y))
plot(density(log.y))
lines(x=x,y=y)
# NO2 thoda thoda

# There are few elements which follw log normal and few are not 

########################
# To find distribution of
# PM2.5 particle
########################


### In this i am working with cleaned_data3.Rdata
y <- na.omit(dat$PM2.5) #8414 entries
y <- y[-c(50001,8414)]
x <- seq(-10,10,lenth=1000)
y_x <- dnorm(x,mean = mean(y),sd=sd(y))
hist(y)
plot(x=density(y))
lines(x=x,y=y_x)
mean(y)
sd(y)

log.y <- log(y)
x <- seq(-10,10,length=1000)
y_x <- dnorm(x,mean = mean(log.y),sd=sd(log.y))
plot(density(log.y),ylim=c(0.0,0.6))
lines(x=x,y=y_x)

# quantile quantile plot
qqnorm(log.y, pch = 1, frame = FALSE)
qqline(log.y, col = "steelblue", lwd = 2)

###
# lets assume log.y follow normal distribution
# with mean = mean(log.y),and sd=sd(log.y)

# let Y1 Y2 Y3 ... Yn are the observed value now test 
# hypothesis test of two sided
# Y1,Y2 Yn == log(dat$PM2.5[1:n]) #
# value which is not taken parent data 
# i have to perform z test

vec <- log(dat$PM2.5[5001:6000])

z <- (sqrt(1000)*abs(mean(vec)-4.1))/sd(vec)
z







#alp <- (mean(y)^2)/(sd(y)^2)
#bet <- (sd(y)^2)/mean(y)
#y_b <- dgamma(x,shape = alp,scale = bet)
#plot(x,y_b,type = "l")
