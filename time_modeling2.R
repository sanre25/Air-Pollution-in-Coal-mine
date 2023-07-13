
##################

library(forecast)
library(tseries)

# applying model on first 8000 entries
pm2.5 <- dat[ ,c(2,5)]
pm2.5 <- pm2.5[c(1:8000),]

spm2.5 <- ts(data=pm2.5$PM2.5,start =1,end = 8000,frequency = 1 )
class(spm2.5)

acf(spm2.5)
pacf(spm2.5)
plot(spm2.5)
adf.test(spm2.5)

spm2.5_ml=auto.arima(spm2.5,ic="bic",trace = FALSE,seasonal = T,seasonal.test = c("seas", "ocsb", "hegy", "ch"))
spm2.5_ml
spm2.5_ml$seasonalorder
#spm2.5_ml2 <- arima(spm2.5,order = c(0,1,0))
#acf(ts(spm2.5_ml$residuals))
#pacf(ts(spm2.5_ml$residuals))
pm2.5forecast=forecast(spm2.5_ml,level = c(95),h=100)
pm2.5forecast
plot(pm2.5forecast,xlim=c(7500,8000))
lines(x=c(8001:8100),y=dat$PM2.5[8001:8100])


library(forecast)

# Assuming your time series data is stored in the 'data' variable as a vector or time series object

# Convert the data into a time series object
#ts_data <- ts(data)

# Determine the seasonal differences of the time series data
seasonal_diffs <- diff(spm2.5, differences = 1, lag = 4)  # Replace 'D' and 's' with appropriate values
plot(seasonal_diffs)
library(ggplot2)
# Plot the seasonal autocorrelation function (SACF)
acf(seasonal_diffs, lag.max = 40)

# Plot the seasonal partial autocorrelation function (SPACF)
pacf(seasonal_diffs, lag.max = 40)

sarima_model <- arima(spm2.5,order = c(5, 1, 0),seasonal = list(order = c(1, 1, 1), period = 4))
sarima_model_f=forecast(sarima_model,level = c(95),h=100)
sarima_model_f
plot(sarima_model_f,xlim=c(7000,8200))
lines(x=c(8001:8100),y=dat$PM2.5[8001:8100])

plot(sarima_model_f$residuals)


################
# 