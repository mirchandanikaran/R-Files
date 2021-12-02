# Three bifurcations of Data Science: 
#                                   Data Manipulation
#                                   Data Visualization 
#                                   Machine Learning


#==========================================================================================
#                               DATA MANIPULATION
#==========================================================================================

#------------------------------------INFO--------------------------------------------------
# Data set: 'hflights' 
# Packages required = dplyr

# This is a case study on data set hflights in which we study different aspects of the data

# Step 1: Install the dplyr package as 
  install.packages('dplyr')

# Step 2: Call the dplyr package as
  library('dplyr')

# Step 3: Call the hflights data set as
  library(hflights)

# Step 4: Verify the presence of the data set as
  View(hflights)

# If the data set opens up in a new window, we are ready to go.
#-------------------------------------------------------------------------------------------

# We have to perform some operations on the data like selecting, filtering etc.
  
  
# Let's begin with
# Selecting specific columns from the data set
select(hflights,FlightNum,ArrTime,DepTime)->flight1
View(flight1)

# Selecting columns by column numbers
select(hflights, 5,6,8)->flight1
View(flight1)

# Selecting all those columns which have the string 'time' in them
select(hflights, contains("Time"))->flight1
View(flight1)

# Selecting all the columns from Year to ArrTime
select(hflights,Year:ArrTime)->flight1
View(flight1)

#                 OR

select(hflights, 1:6)->flight1
View(flight1)

# Selecting all those columns which start with string 'Day', and end with string 'Time'
select(hflights, starts_with("Day"),ends_with("Time"))->flight1
View(flight1)



# MUTATE

# Subtracting AirTime from ActualElapsedTime and storing the values in a new column i.e. ActualGroundTime
mutate(hflights,ActualGroundTime=ActualElapsedTime-AirTime)->flight1
View(flight1)

# Average Speed of the flight
mutate(flight1, AverageSpeed = Distance / AirTime * 60)->flight1
View(flight1)


# FILTER
filter(hflights, Distance>3000) ->flight1
View(flight1)

range(hflights$Distance)


# Filtering those Unique Carriers which have OO,AA,US in them
filter(hflights,UniqueCarrier %in% c("OO","US","AA"))->flight1
View(flight1)

table(flight1$UniqueCarrier)

# Are there any values where total time spent in taxi is greater than airtime

filter(hflights,TaxiIn+TaxiOut>AirTime)->flight1
View(flight1)

# How many flights have departed before 5AM and arrived after 10 OPM

filter(hflights, DepTime<500|ArrTime>2200)->flight1
View(flight1)

filter(hflights,Dest=="JFK" & Cancelled==1)->flight1
View(flight1)

# ARRANGE

arrange(hflights,DepDelay)->flight1
View(flight1)

arrange(hflights, DepDelay+ArrDelay)->flight1
View(flight1)


# SUMMARISE

summarise(hflights,min_dist=min(Distance),max_dist=max(Distance))
summarise(hflights,earliest=min(ArrDelay,na.rm = T), average=mean(ArrDelay,na.rm = T), latest=max(ArrDelay,na.rm = T), sd = sd(ArrDelay, na.rm = T))


# PIPE

hflights %>% select(contains("Time")) %>% filter(AirTime>60)->flight1
View(flight1)

hflights %>% filter(UniqueCarrier=="WN") %>% summarise(Min_Time=min(AirTime,na.rm = T))


#==========================================================================================
#                               DATA VISUALIZATION
#==========================================================================================

# Data Visualization deals with understanding the significance of data through graphs/plots
# Packages required: ggplot2
# Call the package: 
library('ggplot2')

# Data set used: mtcars
View(mtcars)
#      data = ___,     x-axis  

ggplot(data=mtcars, aes(x=hp))+geom_histogram(fill='palegreen4',col='green')
#                                                  colorinside     border

# When the distribution of a continuous variable is demanded, we use histogram
# When the distribution of a categorical variable is demanded, we use bar plot

ggplot(data=mtcars, aes(x=hp))+geom_bar(fill='orange')
# this will only work when the observations recorded in a category (for eg - YES or NO)

# Scatter plot
# Used to see how does one variable change with respect to another variable
#-----------------------------------------

ggplot(data=mtcars, aes(y=disp, x=cyl, col=factor(hp)))+geom_point()


# Box Plot
# Used to understand how does a continuous variable change with respect to a categorical variable
#------------------------------------------

ggplot(data=mtcars,aes(y=disp, x=factor(hp), fill=factor(cyl)))+geom_boxplot()



#==========================================================================================
#                               MACHINE LEARNING
#==========================================================================================

# Machine Learning is the field that deals with how to make the computers learn
#
# Types of Machine Learning Algorithms:
#                                       Supervised Learning
#                                       Reinforcement Learning
#                                       Unsupervised Learning
#
#
# Supervised Learning :
# -------------------
#
# It is a machine learning algorithm that uses a known dataset (training data set) to make predictions
# We already have a set of labels and from these set of labels, we build a model and we predict these values on a new dataset
#
# Linear Regression : It comes under the purview of supervised learning. We try to determine how the dependent variables change with respect to independent variables
# -----------------
# 
# We try to determine how does miles per gallon column vary with respect to other columns
# For ML algorithm, we need to split the data into 2 parts : training part and testing part
# Packages required: caTools
install.packages("caTools")
library(caTools)

sample.split(mtcars$mpg, SplitRatio = 0.65)->mysplit
# The sample.split function helps us to split the observations into 2 parts in 2 categories: True and False
# SplitRatio=0.65 means 65% of the observations will have the true label and the rest will have False label
# The data is to be divided now
train<-subset(mtcars,mysplit==T)
test<-subset(mtcars, mysplit==F)
nrow(test)

#Building the linear model on top of the training set
lm(mpg~.,data = train)->mod1
#Values on the left of tilde(~) are dependent variables and values on the right side are independent variables

predict(mod1,test)->result
View(result)
# Now we comibine the actual values and the predicted values
cbind(actual=test$mpg, predicted=result)->final
View(final)

# Now we have to convert the data into a dataframe
as.data.frame(final)->final

# To calculate errors in predictions, we subtract predicted values from actual values
cbind(final,error=final$actual-final$predicted)->final
View(final)

# Now we have to evaluate the performance of our model with the help of RMSE
# Lower the RMSE, better the model
rmse1<-sqrt(mean((final$error)^2))
rmse1            


lm(mpg~. -gear,-carb,data = train)->mod2
predict(mod2,test)->result
cbind(actual=test$mpg,predicted=result)->final
View(final)
as.data.frame(final)->final
class(final)
cbind(final,error=final$actual-final$predicted)->final
View(final)

rmse2<-sqrt(mean((final$error)^2))
rmse2
rmse1


View(census)
install.packages('census')
library('census')
 