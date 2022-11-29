# Creating dataframe
gender = c("Female", "Male", "Male")
height = c(160, 175, 173)
weight = c(49, 89, 77)
age = c(35, 36, 41)
names =c("Carrol","Mike","John")

df = data.frame(names, gender, height, weight, age)
View(df)

###################################################################
# display specific data
#display 1 col
df[1]
#display 1 row
df[1,]

#display 1 & 2 col
df[1:2]
#display 1 & 2 row
df[1:2,]

#display 1 & 3 col
df[c(1,3)]
#display 1 & 3 row
df[c(1,3),]

#display gender col
df['gender']
#display gender col content
df$gender

###################################################################
# Accessing Data with condition
df[df$names== "Mike",]
df[df$age > 35,]
df[df$height > 170 & df$weight > 70,]

df$names[df$gender == "Male"]
df$names[df$height > 170 & df$age < 40]

###################################################################
# Adding new data [using rbind() function]
print("Before Adding:\n") #title
print(df) #display the dataframe

#create new dataframe by adding new data [rbind()]
newDf = rbind(df, data.frame(names = c("Suuria","Malik"),
                             gender = c("Female","Male"),
                             height = c(156,169),
                             weight = c(56,81),
                             age = c(23, 28)))

print("After Added rows:\n") #title
print(newDf) #display new dataframe 

###################################################################
# Merging dataframes [using merge() function]
gender = c("Female", "Male", "Male","Female","Male")
height = c(160, 175, 173,156,169)
weight = c(49, 89, 77,56,81)
age = c(35, 36, 41,23, 28)
names =c("Carrol","Mike","John","Suuria","Malik")

#newDf
df1 = data.frame(names,gender,height,weight,age)

states = c("Selangor","Perak","Melaka")
names = c("Carrol","John","Malik")

df2 = data.frame(names, states) #new dataframe with different data

#merge both dataframe [merge()]
# by="names" <- merge both database using dataset names
dfMerge = merge(x = df1, y = df2, by = "names", all.x = TRUE)
View(dfMerge)

###################################################################
# To remove rows
newDf2 = newDf[-2,] #remove 2nd row
View(newDf2)

# Modify dataframe
newDf3 = newDf #Create new dataframes with same data as newDf

newDf3[1, "age"] <- 30 #modify age in row 1 
newDf3[4, "height"] <- 152 #modify height in row 4
View(newDf3)

###################################################################
# Importing Dataframe [using read.csv() function for csv file]
getwd() #to gather information about current working pathname

data_cv <- read.csv("C:/Users/USER/OneDrive/Documents/Undergraduate/Year 2/SEM 2/Introduction to Data Science/Database/Week 4_cv19_world.csv") 

# To display the first n of the dataset [using head() function]
head(data_cv, 5)

# To display the summary of each column in the dataset [using summary() function]
summary(data_cv)

###################################################################
# Exporting dataset [using write.csv() function]
write.csv(newDf, "C:/Users/USER/OneDrive/Documents/Undergraduate/Year 2/SEM 2/Introduction to Data Science/Database/Week 4_cv19_world.csv")

###################################################################
# Dataframe Manipulations [using library(dplyr)]
#install.packages("dplyr")
library(dplyr)

# Filter data [filter() function used]
tot_cases = data_cv %>% filter(TotalCases >= 36896) 

# Search data [select() function used]
mydata = data_cv %>% select(Country, Population, TotalDeaths)

glimpse(mydata) #a transposed output of the print() function

# Mutate data to create new variables [mutate() function used]
mydata1 = data_cv %>% mutate(deaths_ratio = TotalDeaths / Population * 100)

# Arrange data [filter() & arrange() function used]
#arrange rows based upon the specified condition
countrylist = data_cv %>% filter(TotalCases >= 36896) %>% arrange(TotalCases) 
  
#arrange data in descending order
countrylist1 = data_cv %>% filter(TotalCases >= 36896) %>% arrange(desc(TotalCases)) #or arrange(-TotalCase)

#arrange data in ascending order
countrylist2 = data_cv %>% filter(TotalCases >= 36896) %>% arrange(TotalCases)

###################################################################
# Handling missing values
#creating a vector of integers having NAs
a <- c(1:5, rep(NA, 3), 6:10)
print(a)

#performig sum on the vector
sum(a)

#selecting only integer valuse
b <- a[!is.na(a)]
print(b)

#performing sum on the new vector
sum(b)

###################################################################
# Replace NA with 0
a <- c(seq(1, 10, 3), rep(NA, 4), seq(10, 2, -2))
print(a)

a[is.na(a)] <- 0 #assigning 0 to NA
print(a)

###################################################################
# Importing Dataframe [using read_excel() function for excel file]
library(readxl) #used for inporting external dataset

df <- read_excel("C:/Users/USER/OneDrive/Documents/Undergraduate/Year 2/SEM 2/Introduction to Data Science/Database/Week 4_ids_1.xlsx")

#checking for NA
is.na(df) #whole dataframe
is.na(df["VarA"]) #column

#performing mathematical operations upon NA
mean(df$VarA)
mean(na.omit(df$VarA))

# Other alternatives to replace missing values
install.packages("zoo")
library(zoo)

df$VarB[is.na(df$VarB)] <- mean(df$VarB, na.rm = TRUE) #na.rm <- to remove the NA values
df$VarC[is.na(df$VarC)] <- median(df$VarC, na.rm = TRUE)
df <- df %>% mutate(VarA_new = na.approx(VarA)) #na.approx <- to replace NA by interpolation