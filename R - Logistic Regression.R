#------------------------------------
#       LOGISTIC REGRESSION
#------------------------------------


#install.packages('tidyverse')
#install.packages('caret')
#install.packages('mlbench')

library(tidyverse)
library(caret)
library(mlbench) # for the PimaIndiansDiabetes2 Dataset
library(dplyr)

# Dataset
data("PimaIndiansDiabetes2")
View(PimaIndiansDiabetes2)

# Loading data and removing NAs
data('PimaIndiansDiabetes2', package = 'mlbench')
summary(PimaIndiansDiabetes2)
PimaIndiansDiabetes2 <- na.omit(PimaIndiansDiabetes2)

# Inspecting the data
sample_n(PimaIndiansDiabetes2, 3)

# Splitting the data into training and test set
set.seed(123)
training.samples <- PimaIndiansDiabetes2$diabetes %>% createDataPartition(p=0.8, list=FALSE) 
train.data <- PimaIndiansDiabetes2[training.samples,]
test.data <- PimaIndiansDiabetes2[-training.samples,]
nrow(train.data)
nrow(test.data)


# Fitting the model
model <- glm(diabetes~., data = train.data, family = binomial)
summary(model)
coef(model) # or summary(model)$coef


# Make predictions
probabilities <- model %>% predict(test.data, type = 'response')
predicted.classes <- ifelse(probabilities > 0.5, 'pos', 'neg')


# Model accuracy
mean(predicted.classes==test.data$diabetes) # '==' operator compares two values 
# result is 0.7564 i.e. 75.64%  which means accuracy of our model is 75.64%
# Accuracy is equal to Number of correct predictions/Number of all predictions

# Confusion Matrix
table(test.data$diabetes, predicted.classes)
 
# For percentage:
table(test.data$diabetes, predicted.classes) %>% prop.table() %>% round(digits=3)



model <- glm(diabetes~glucose, data=train.data, family=binomial)
summary(model)$coef

# Predicting new values
newdata <- data.frame(glucose=c(20,180))
probabilities <- model %>% predict(newdata, type='response')
predicted.classes <- ifelse(probabilities > 0.5, 'pos', 'neg')
predicted.classes
