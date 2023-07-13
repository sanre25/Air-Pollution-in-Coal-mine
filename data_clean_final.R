
# load the dataset
df <- read.csv("Open pit blasting 01-02-2023 000000 To 01-05-2023 235959.csv")

# Changing column name
colnames(df) <- c("s_num","From","To","PM10","PM2.5","NO",
                  "NO2","NOX","CO","SO2","NH3","ozone","benzene")

# Standard Time format
df$From <- as.POSIXct(df$From,format="%Y-%m-%d %H:%M:%OS")
df$To   <- as.POSIXct(df$To,format="%Y-%m-%d %H:%M:%OS")

# Removing last rows
df <- df[-c(8641,8642,8643),]

# Extra Column of month,day,hour
df$month <- as.numeric(format(df$From,"%m"))
df$day <- as.numeric(format(df$From,"%d"))

# For hour
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
