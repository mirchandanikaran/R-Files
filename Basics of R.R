#Creating a list
#This list contains different types of elements including matrices, vectors, boolean values, arrays etc.

things = list("Red", c(1,2,3), TRUE, matrix(1:6,), array(5:10, dim=c(3,3,2)))
class(things)

#Creating a vector

vector = c("red", 1,2,3, "red", TRUE, array(5:10, dim=c(3,3,2)))
class(vector)
vector

#Difference between a list and a vector is that unlike vetors, the class of the elements in a list are not changed.
#Vectors can also store different types of elements but under a common class.

things



list_data = list(c("Jan", "Feb", "Mar"), matrix(c(3,9,5,1,-2,8), nrow = 2), list("Green", 12.3))
list_data


names(list_data)=c("1st Quarter", "A-Matrix", "An inner list")
list_data



#Accessing elements in a list
list_data[1]


#Accesssing the third element in a list. As it is also a list, elements of that particular list are printed.

list_data[3]


#Manipulating elements in a list

#Changing an element
list_data[4] ="New element"

#Removing the last element
list_data[4] = NULL

#Updating the third element
list_data[3] = "Updated element"


#We use '<-' operator to declare global variables

mean(x<-1:10)
x


#Factors
#Factors store the data in levels as follows


data = c("East","West","East","North","North","East","West","West","West","East","North")
data
is.factor(data)

factor_data=factor(data)
is.factor(factor_data)
factor_data

#6-1-2021
#Creating data frames


Name = c("Anastasia S", "Dima R", "Katherine S", "JAMES A", "Laura Martin")
Gender = c("M", "M", "F", "F", "M")
Age = c(23,22,25,26,32)
Designation = c("Clerk", "Manager", "Executive", "CEO", "Assistant")
SSN = c("123-34-234", "123-44-779", "556-24-433", "123-98-987", "679-77-576")
emp_data=data.frame(name,gender,designation,ssn)

#Adding columns to an existing data frame

emp_data$department = c("IT", "Finance", "Operations", "Management", "HR")
emp_data$joiningDate = c(as.Date("2010-12-10", "2009-08-09", "2012-09-11", "2005-07-01", "2007-08-25"))

emp_data$joiningDate = c("10-12-2010", "09-08-2009", "11-09-2012", "01-07-2005", "25-08-2007")
 
emp_data
