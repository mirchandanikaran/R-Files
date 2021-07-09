data(mtcars)
View(mtcars)
data<-as.matrix(mtcars)
heatmap(data)
heatmap(data,scale ="column")
heatmap(data,scale ="column",col=colors(256))

#weekly data of covid patients
x<-c(580,7813,28266,59287,57580,87820,95314,126214,218843,471497,936851,150875,2072113)
library(lubridate)
png(file="timeSeries.png")
mts<-ts(x,start = decimal_date(ymd("2020-01-22")),frequency = 365.25/7)
plot(mts,xlab="Weeklydata",
     ylab="Total Positive Cases",
     main="CoVID-19 Pandemic",
     col.main="darkgreen")
dev.off()


PositiveCases<-c(580,7813,28266,59287,57580,87820,95314,126214,218843,471497,936851,150875,2072113)
deaths<-c(17,270,565,1261,2126,2800,3285,4628,8951,21283,47210,88480,138475)
library(lubridate)
png(file="multivariateTimeSeries.png")
mts<-ts(cbind(PositiveCases,deaths),
start = decimal_date(ymd("2020-01-22")),frequency = 365.25/7)
plot(mts,xlab="Weeklydata",
    main="CoVID-19 Pandemic",
     col.main="darkgreen")
dev.off()


