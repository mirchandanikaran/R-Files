#DESCRIPTIVE STATISTICS

data()
data(mtcars)
cardata<-mtcars
str(cardata)
head(cardata)
cardata
table(cardata$vs)
is.factor(cardata$vs)
factor(cardata$vs)
cardata$vs<-factor(cardata$vs)
levels(cardata$vs)
#-----------------------------
levels(cardata$vs)<-c("V Shaped", "Straight or Inline")
table(cardata$vs)
cardata$am<-factor(cardata$am)
cardata$gear<-factor(cardata$gear)
table(cardata$vs)
levels(cardata$am)<-c("Automatic", "Manual")
levels(cardata$gear)
a<-table(cardata$gear)
ctab1<-(table(cardata$vs, cardata$am))
class(a)
prop.table(ctab1)
prop.table(ctab1,1)#row
prop.table(ctab1,2)#column
xtabs(~vs+am, data=cardata)#similar to >prop.table(ctab1)
#-------------------------------------------
install.packages('gmodels')
library(gmodels)
CrossTable(ctab1, expected = TRUE, prop.r = TRUE, prop.c = TRUE, prop.t = TRUE, prop.chisq = FALSE)

#Descriptive Statistics
#----------------------
#summary commands - mean(),median(),max(),min(),range(),var(),sd(),quantile(),summary()
quantile(cardata$mpg)

#Package for Descriptive Statistics
install.packages("psych")
library(psych)
describe(cardata$mpg)

#Sample size <150 -> shapiro.test()
shapiro.test(cardata$mpg)

# KS Test when data >= 150

testdata<-rnorm(150)
ks.test(testdata, "pnorm")


#New file
#=========================================================

dat<-iris
head(dat$Sepal.Length)
min(dat$Sepal.Length)
max(dat$Sepal.Length)
mean(dat$Sepal.Length)
range(dat$Sepal.Length)
sd(dat$Sepal.Length)
var(dat$Sepal.Length)

