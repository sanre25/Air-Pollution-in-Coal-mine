
# summary of data 
library(dplyr)

df <- data.frame(
  Particle=array(data = NA,dim = 10),
  Min_Value=numeric(length = 10),
  Qunt_1=numeric(length = 10),
  Median=numeric(length = 10),
  Mean=numeric(length = 10),
  Qunt_3=numeric(length = 10),
  Max_value=numeric(length = 10),
  NAs=numeric(length = 10)
)
df$Particle =c("PM10","PM2.5","NO","NO2","NOX",
               "CO","SO2","NH3","Ozone","Benzene")

df$Min_Value = c(12.0,3.00,0.10,0.20,4.20,
                 0.10,0.10,4.60,0.10,0.100)
df$Qunt_1=c(84.0,36.00,3.90,39.40,25.00,
            0.950,16.10,9.40,10.50,0.100)
df$Median=c(145.0,61.00,6.10,53.20,37.70,1.420,
            25.30,11.00,32.40,0.100)
df$Mean=c(181.5,75.73,14.67,55.76,42.68,
          1.409,34.31,13.25,35.63,0.178)
df$Qunt_3=c(238.0,101.00,16.50,71.05,53.80,1.850,
            35.20,14.00,58.80,0.200)
df$Max_value=c(847.0,474.0,157.50,106.90,165.90,
               4.0,645.60,62.40,123.80,0.60)
df$NAs=c(1681,226,1396,416,415,496,1451,
         326,453,6195)
df$std.dev =c(136.01,55.24,19.22,20.23,22.43,
              0.63,39.45,6.15,27.01,0.09)
df$uniq_entry=c(376,245,775,861,1009,298,1113,334,973,7)


