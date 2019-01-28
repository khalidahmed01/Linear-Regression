#Linear Regression

library(dplyr)
library(ggplot2)
library(car)

#loading data

salesdata=read.csv("H:\\Analytics\\Regression Analysis\\Car_sales.csv")

#calculating car sales with variables Engine_size, horsepower and Fuel_Efficiency

colnames(salesdata)

#subsetting data with variables Engine_size, horsepower and Fuel_Efficiency

samplesalesdata= select(salesdata, Engine_size, Horsepower, Sales_in_thousands)

#plotting sample data to find out linearity between variables

plot(samplesalesdata)

#by viewing the plot, Engine_size and Horspower vairable seems to be linear with each other
# but the Sales_in_thousands is not linear with any of the other vairables.

#Developing a linear model

result=lm(Sales_in_thousands~Engine_size+Horsepower, data= samplesalesdata)

# by looking t the result
# y=c+m(Engine_size)+m(horsepower)
# Sales_in_thousands= 89.461+40.572(1.8)-0.864(140)

summary(result)

#looking at the summary, the p value is god for all variables
# We have confidence rate of 99.9 for Engine_size and 99.6 for horsepower
# I am not sure about r squared and adjusted r square value!


predict(result, data.frame(Engine_size= 1.3, Horsepower= 22), interval= "confidence")

        