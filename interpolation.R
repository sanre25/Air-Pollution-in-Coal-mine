###################################
# Interpolation for missing values
###################################

library(dplyr)
library(zoo)
library(ggplot2)
library(forecast)

df <- dat %>%
  mutate(column_name = na.approx(PM10))
plot.ts(df$column_name)
# Not seeing much usefull


# and first I complete PM2.5 missing values
dat$PM2.5 <- na.spline(dat$PM2.5)
save(dat,file = "cleaned_data3.Rdata")
# on this data I will perform ARIMA model


y <- na.spline(df$PM10) # this can be useful
plot.ts(y)

plot.ts(df$PM10[1:(96*15)])

Box.test(df$PM10,lag = 100,type = "Ljung-Box")
