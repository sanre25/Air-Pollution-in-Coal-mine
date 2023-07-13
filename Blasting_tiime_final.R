load("cleaned_data3.Rdata")

df <- dat

# First I load the cleaned_data.Rdata file
# where first time I will separete time component separately
load("cleaned_data.Rdata")
df$Timing <- dat$tem[1:8640]
load("cleaned_data3.Rdata")

#####################3
# Problem Statement

#  Approach for getting blast time
index <- which(df$PM10>238) # greater than 3rd quantile
length(index) # total of 1721 entries
unique(df$Timing[index])
table(df$Timing[index])
library(plyr)
y <- count(df$Timing[index])
y$freq
mean(y$freq)
summary(y$freq)
ind <- which(y$freq>25)
y[ind,]
library(dplyr)
y <- y %>% arrange(freq)
y
y <- y %>% arrange(x)

# y contains total 96 entries it means it covers
# whole day 