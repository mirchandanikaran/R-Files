library(ggplot2)
qplot(Sepal.Length,Sepal.Width,data=iris)
qplot(Petal.Length,Petal.Width,data=iris)
ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width))+geom_point()
ggplot(iris,aes(x=Petal.Length,y=Petal.Width))+geom_point()
plen=ggplot(data=iris,aes(x=Petal.Length,y=Petal.Width))
plen+geom_point()+coord_flip()
plen+geom_point()+ggtitle("Iris Petal Size Analysis\nData Source:Anderson(1935)") +labs(x="Petal Length(cm)",y="Petal Width(cm)")
common_theme=function(){}
ptcolor='grey20'
plen+geom_point()+ggtitle("Iris Petal Size Analysis\nData Source:Anderson(1935)")+labs(x="Petal Width(cm)")+
  theme(plot.title = element_text(size=14,lineheight = 0.8,color=ptcolor,hjust = 0.5),
        axis.title.x=element_text(color = ptcolor),
        axis.title.y = element_text(color = ptcolor))
plen+geom_point()+ggtitle()
plen+geom_point()+ggtitle("Iris Petal Size Analysis\nData Source:Anderson(1935)")+labs(x="Petal Width(cm)")+labs(x="Petal Length(cm)",y="Petal Width(cm)")+
  common_theme()
plen+geom_point(shape=iris$Species)+ggtitle("Iris Petal Size Analysis\nDataSource:Anderson(1935)")+
labs(x="Petal Length(cm)",y="Petal Width(cm)")+common_theme()

plen + geom_point(shape=iris$Species, aes(colour = Species), shape=15, size=1.5) + 
  ggtitle("Iris Petal Size Analysis\nData Source:Anderson(1935)") + labs(x='Petal Length (cm)', y = 'Petal Length(cm)') + common_theme()

# Category wise Visualization for Sepal Length and Sepal Width
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_point(aes(colour=Species), shape=15, size = 1.5) + ggtitle('Iris Sepal Size Analysis\nDataSource:Anderson(1935)') + labs(x='Sepal Length(cm)', y='Sepal Width(cm)') + common_theme()

# Histogram plot for Petal Length
ggplot(iris,aes(x=Petal.Length)) + geom_histogram()

# Histogram plot for Petal Length with fill
ggplot(iris,aes(x=Petal.Length, fill=Species)) + geom_histogram(binwidth = 0.1)

# Histogram plot for Sepal Length with fill
ggplot(iris,aes(x=Sepal.Length, fill=Species)) + geom_histogram(binwidth = 0.1000)

# Creating subplots within a plot

install.packages('gridExtra')
library(gridExtra)

plen <- ggplot(iris, aes(x=Petal.Length, fill=Species)) + geom_histogram(binwidth = 0.1)
pwid <- ggplot(iris, aes(x=Petal.Width, fill=Species)) + geom_histogram(binwidth = 0.1)
slen <- ggplot(iris, aes(x=Sepal.Length, fill=Species)) + geom_histogram(binwidth = 0.1)
swid <- ggplot(iris, aes(x=Sepal.Width, fill=Species)) + geom_histogram(binwidth = 0.1)

grid.arrange(plen, pwid, slen, swid, nrow =2)


# Density Plot

common_subplot <- function(data, field) {ggplot(data, aes(x = get(field), fill = Species)) + geom_density(alpha=0.5) + labs(x=field, y='Density')}

plen <- common_subplot(iris, 'Petal.Length')
pwid <- common_subplot(iris, 'Petal.Width')
slen <- common_subplot(iris, 'Sepal.Length')
swid <- common_subplot(iris, 'Sepal.Width')

grid.arrange(plen, pwid, slen, swid, nrow=2)

# 24-5-2021
# Box Plot
ggplot(iris, aes(x=Species, y=Petal.Length)) + geom_boxplot(width=0.5) + coord_flip()
summary(iris)

# Showing mean in the boxplot
ggplot(iris, aes(x=Species, y=Petal.Length)) + geom_boxplot(width=0.5) + coord_flip() + stat_summary(fun = 'mean', geom='point', shape=23, size=3, fill='white')

# Violin Plot
ggplot(iris, aes(x=Species, y=Petal.Length)) + geom_violin() + stat_summary(fun = 'mean', geom='point', shape=23, size=3, fill='white')

# Combining Violin & Box Plot
ggplot(iris, aes(x=Species, y=Petal.Length)) + geom_violin(trim=FALSE) + geom_boxplot(width=0.1) + stat_summary(fun = 'mean', geom='point', size=1.5, color='red') + coord_cartesian(ylim = c(0,10))

# Exercise
data('AirPassengers')
install.packages('lubridate')

mths <- seq(as.Date('1949/1/1'), as.Date('1960/12/31'), by = 'months')
airp <- data.frame(Year=mths, PassengerCount=AirPassengers)
qplot(Year, PassengerCount, geom='line', data=airp)


#Adding Month and Date as Data labels on x-axis
qplot(Year, PassengerCount, geom='line', data=airp) + scale_x_date(date_breaks = '4 month', date_labels = "%b %Y") + theme(axis.text.x = element_text(angle=90, hjust=1))
