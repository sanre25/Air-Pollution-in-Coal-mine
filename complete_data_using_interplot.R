
load("cleaned_data3.Rdata")
str(dat)
class(dat)
head(dat)

library(dplyr)
library(zoo)

summary(dat)

#for ozone
plot.ts(dat$benzene)
y <- na.spline(dat$benzene) 
plot.ts(y)
# for ozone it is not useful to use cubic spline
y <- na.approx(dat$benzene)
plot.ts(y)
# linear interpolation is also not useful

