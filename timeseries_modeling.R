
rm(list = ls())

library(readxl)
gdp <- read_excel("C:/Users/psand/OneDrive/Desktop/EE798_FISA/Assignment_1/time series GDP-ARIMA youtube.xlsx")
View(gdp)

# Actual class is not in time series format
class(gdp)

# To convert it into time series we use ts() function
gdptime=ts(gdp$GDP,start = min(gdp$DATE),end = max(gdp$DATE),frequency = 4)
class(gdptime)

# 
library(forecast)
library(tseries)

# this will give me actual graph like simple plot.ts() 
plot(gdptime)
# the data is showing upword trend hence this is non-stationary
# we cant perform arima model untill we know its is stionary or not
# ARIMA model is only applicable to the stionary process
# For that we apply some test to check stationarity
# Three aspect of time series 1. sesonality 2. staionarity 3. autocorrelation

# First we check the autocorrelation of gdptime data
acf(gdptime)
# in plot we see there are many veritcal linres which 
# crosses the blue line that means data is highly autocorrelaterd
# with itself
# Overall the spikes does not go above blue line if it is go
# that means data is not staiinarity


pacf(gdptime)
# this have no issue crossing of blue line

# The last test of checking
adf.test(gdptime)
# In this ouotput pvalue is greater than 0.5 this impies data is non-stationary

# modeling
gdpmodel=auto.arima(gdptime,ic="aic",trace = TRUE)
# Aiche information crierteri it should be minimum for best model

acf(ts(gdpmodel$residuals))
# now the no line passes blue line
pacf(ts(gdpmodel$residuals))

# now we direct go for the forecasting
mygdpforecast=forecast(gdpmodel,level = c(95),h=10*4)
mygdpforecast
plot(mygdpforecast)

# VAlidation using BOXtest
Box.test(mygdpforecast$resid, lag=5, type= "Ljung-Box")
Box.test(mygdpforecast$resid, lag=15, type= "Ljung-Box")
Box.test(mygdpforecast$resid, lag=25, type= "Ljung-Box")
# if p value is less than 0.5 in this test that means data is still aurt




# ARIMA model for PM2.5 concentration
library(forecast)
library(tseries)

# applying model on first 8600 entries
pm2.5 <- dat[ ,c(2,5)]
pm2.5 <- pm2.5[c(1:8000),]

spm2.5 <- ts(data=pm2.5$PM2.5,start =1,end = 8000,frequency = 1 )
class(spm2.5)

acf(spm2.5)
pacf(spm2.5)
plot(spm2.5)
adf.test(spm2.5)

spm2.5_ml=auto.arima(spm2.5,ic="aic",trace = FALSE,seasonal = T)

spm2.5_ml2 <- arima(spm2.5,order = c(0,1,0))
acf(ts(spm2.5_ml$residuals))
pacf(ts(spm2.5_ml$residuals))

pm2.5forecast=forecast(spm2.5_ml,level = c(95),h=100)
pm2.5forecast
plot(pm2.5forecast)

Box.test(pm2.5forecast$residuals, lag=5, type= "Ljung-Box")


spm2.5_ml=auto.arima(spm2.5)
cat("Selected SARIMA model order: ", spm2.5_ml$armaorder, " x ", spm2.5_ml$seasonalorder, "\n")











