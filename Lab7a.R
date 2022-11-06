# Installing library
#Verfy package installing
any(grepl("readxl", installed.packages()))

library(readxl)
?read_excel

#Identify and setting the folder path
getwd()

# Import excel file
uforeport <- read_excel("C:/Users/USER/OneDrive/Documents/Undergraduate/Year 2/SEM 2/Introduction to Data Science/Database/Lab 7_uforeport.xls")

titanic <- read.csv("C:/Users/USER/OneDrive/Documents/Undergraduate/Year 2/SEM 2/Introduction to Data Science/Database/Lab 7_titanic.csv")

# Identify empty cells in data frame
#To count out the total NA values
sum(is.na(uforeport))
sum(is.na(titanic))

#To get the position where NA values are
which(is.na(uforeport))
which(is.na(titanic))

#TO see how it work in smaller dataset
demo = c(1, 2, NA, 4, NA, 6, 7)
sum(is.na(demo))
which(is.na(demo))

#Get count of NA in each column
print(sapply(uforeport, function(x) sum(is.na(x))))
print(sapply(titanic, function(x) sum(is.na(x))))
print(sapply(demo, function(x) sum(is.na(x))))

#Managing empty values in data frame
dim(uforeport)
uforeport_cleaned = na.omit(uforeport)
dim(uforeport_cleaned)

dim(titanic)
titanic_cleaned = na.omit(titanic)
dim(titanic_cleaned)

dim(demo)
demo_cleaned = na.omit(demo)
dim(demo_cleaned)

# Filtering values in data frame
library(dplyr)

#Get column name
colnames(uforeport_cleaned)
colnames(titanic_cleaned)
#OR
names(uforeport_cleaned)
names(titanic_cleaned)

#Renaming unconventional variable names
names(uforeport_cleaned)
#Replace blank with underscore
names(uforeport_cleaned) = gsub(" ", "_", colnames(uforeport_cleaned))
names(uforeport_cleaned)

# Filtering values in data frame
print(filter(uforeport_cleaned, City == 'Belton'))
print(filter(uforeport_cleaned, Colors_Reported == 'GREEN'))

print(filter(titanic_cleaned, sex == 'female'))
print(filter(titanic_cleaned, fare > 500))

# Searching in data frame
print(filter(titanic_cleaned, sex == 'female' & fare > 500))

titanic_cleaned %>% filter(sex == 'female', fare > 500)
ufo_green = uforeport_cleaned %>% filter(Colors_Reported == 'GREEN')

# Arrange values in data frame
#Sorting by values in columns
titanic_sortbyfare_asc = arrange(titanic_cleaned, fare)
titanic_sortbyfare_decs = arrange(titanic_cleaned, desc(fare))

# Exporting data frame to excel and csv
#install.packages("xlsx")
library(xlsx)
write.xlsx(ufo_green, "ufo_green.xlsx")

write.csv(titanic_sortbyfare_asc, "titanic_sortbyfare_asc.csv")
