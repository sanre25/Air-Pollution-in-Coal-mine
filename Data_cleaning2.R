
load("cleaned_data2.Rdata")

x <- as.Date(dat$From)
head(x)
str(x)
class(x)

month <- as.numeric(format(x,"%m"))
day <- as.numeric(format(x,"%d"))

str <- df$From
str <- as.character(str)
sstr<-strsplit(str,split = " ")
hr <- array(data = NA,dim = 8640)
for(i in 1:8640){
  hr[i] <- sstr[[i]][2]
}
shr <- strsplit(hr,split = ":",fixed = T)
for(i in 1:8640){
  hr[i] <- shr[[i]][1]
}
df$hr <- as.numeric(hr)

typeof(hr)

y <- as.POSIXct(dat$From,format="%Y-%m-%d %H:%M:%OS")
dat$From <- y

dat <- cbind(dat,month,day,hr)

# since dat$from is not in actual fromat

save(dat,file = "cleaned_data3.Rdata")
