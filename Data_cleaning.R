
dim(dat)

head(dat)
summary(dat)

# Change column names
colnames(dat)[1] <- "s_num"
colnames(dat)[4] <- "PM10"
colnames(dat)[5] <- "PM2.5"
colnames(dat)[6] <- "NO"
colnames(dat)[7] <- "NO2"
colnames(dat)[8] <- "NOX"
colnames(dat)[9] <- "CO"
colnames(dat)[10] <-"SO2"
colnames(dat)[11] <-"NH3"
colnames(dat)[12] <-"ozone"
colnames(dat)[13] <-"benzene"
colnames(dat)[3] <- "To"

# NA entries in each column
vec_na <- c(length(which(is.na(dat$PM10))),length(which(is.na(dat$PM2.5))),
            length(which(is.na(dat$NO))),length(which(is.na(dat$NO2))),
            length(which(is.na(dat$NOX))),length(which(is.na(dat$CO))),
            length(which(is.na(dat$SO2))),length(which(is.na(dat$NH3))),
            length(which(is.na(dat$ozone))),length(which(is.na(dat$benzene))))

summary(dat$PM10)
summary(dat$PM2.5)
summary(dat$NO)
summary(dat$NO2)
summary(dat$NOX)
summary(dat$CO)
summary(dat$SO2)
summary(dat$NH3)
summary(dat$ozone)
summary(dat$benzene)


#************************************ this gives error in final dataset so i
#*i donot apply below code
#*
# operations for separate data and time stamp

str <- dat$From[1]
rstr <- strsplit(str,split = " ")
rstr[[1]][1] #date
rstr[[1]][2] #time

len <- dim(dat)[1]
det <- array(data = NA,dim=len)
#det[1] <- rstr[[1]][1]
tem <- array(data = NA,dim = len)

for(i in 1:len){
  str <- dat$From[i]
  rstr <- strsplit(str,split = " ")
  det[i] <- rstr[[1]][1]
  tem[i] <- rstr[[1]][2]
}

dat <- cbind(dat,det)
dat <- cbind(dat,tem)
dat <- dat[ , -c(2,3)]

fdat <- dat[,c(1,12,13,2,3,4,5,6,7,8,9,10,11)]
colnames(fdat)[1]<-"s_num"

dat <- fdat
dat <- dat[c(-8641,-8642,-8643),]
save(dat,file = "cleaned_data2.Rdata")

## changing date and time to its form from string

from_time <- as.POSIXct(dat$From,format = "%Y-%m-%d %H:%M:%OS")

