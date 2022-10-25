# Part 1
#To import database from computer
q1_dataset <- read.csv("C:/Users/USER/OneDrive/Documents/Undergraduate/Year 2/SEM 2/Introduction to Data Science/Assignment/q1_dataset.csv")

#To summarize all the data from database
summary(q1_dataset)
# To show the number of row 
row = nrow(q1_dataset)

library(dplyr)
# To get the minimum value
min(q1_dataset$Var1)
min(q1_dataset$Var2)
min(q1_dataset$Var3)
min(q1_dataset$Var4)
min(q1_dataset$Var5)
min(q1_dataset$Var6)
min(q1_dataset$Var7)
min(q1_dataset$Var8)
min(q1_dataset$Var9)
min(q1_dataset$Var10)

# To get the maximum value
max(q1_dataset$Var1)
max(q1_dataset$Var2)
max(q1_dataset$Var3)
max(q1_dataset$Var4)
max(q1_dataset$Var5)
max(q1_dataset$Var6)
max(q1_dataset$Var7)
max(q1_dataset$Var8)
max(q1_dataset$Var9)
max(q1_dataset$Var10)

# To summarize all the number of empty cell
q1_dataset %>% summarise_if(is.numeric, ~sum(is.na(.)), na.rm = TRUE)

# To conclude all the data for data frame
Row = c(600, 600, 600, 600, 600, 600, 600, 600, 600, 600)
Min = c(1, 60, 3e-05, "NA", 0.000753, "OFF", "NA", 1.02, -99, "NA")
Max = c(10, 499, 101.3, "NA", 0.428, "ON", "NA", 1.08, -99, "NA")
NAN = c(1, 0, 0, 0, 9, 0, 5, 0, 0, 11)

# To create a data frame
dfSummaryOriginal <- data.frame(Row, Min, Max, NAN)
# To change the row names
row.names(dfSummaryOriginal) <- c("Var1", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7", "Var8", "Var9", "Var10")

# Part 2
#To create a new data frame named dfCleaned from dfSummaryOriginal
dfCleaned = dfSummaryOriginal
#Access the element in the 6th row and 2nd column
dfCleaned[6,2]
#Change the value of the element from "OFF" to 0
dfCleaned[6,2] <- 0


#Access the element in the 6th row and 3rd column
dfCleaned[6,3]
#Change the value of the element from "ON" to 1
dfCleaned[6,3] <- 1

#Calculate the average value for the empty cells (NAN)
mean(q1_dataset$Var1)
mean(q1_dataset$Var2)
mean(q1_dataset$Var3)
mean(q1_dataset$Var4)
mean(q1_dataset$Var5)
mean(q1_dataset$Var6)
mean(q1_dataset$Var7)
mean(q1_dataset$Var8)
mean(q1_dataset$Var9)
mean(q1_dataset$Var10)

#Replace the NAN values with the average values
dfCleaned[1,4] <- 5.403333
dfCleaned[2,4] <- 81.67833
dfCleaned[3,4] <- 4.624634
dfCleaned[4,4] <- NA
dfCleaned[5,4] <- 0.2159361
dfCleaned[6,4] <- NA
dfCleaned[7,4] <- NA
dfCleaned[8,4] <- 1.0523
dfCleaned[9,4] <- -99
dfCleaned[10,4]<- NA

#Check for missing values (NA)
is.na(dfCleaned)

# Part 3
#Create new dataframe from dfCleaned and name it dfSummaryCleaned 
dfSummaryCleaned = dfCleaned
#Remove the missing (NA) values
na.omit(dfSummaryCleaned)
dfSummaryCleaned = dfSummaryCleaned[-c(4,6,7,10),]

# Part 4
#for pie chart 
lbl = q1_dataset$Var1
val2 = q1_dataset$Var8[1:30]
pie(val2, lbl, cex = 1)

#Scatter Plot
x <- q1_dataset$Var1
y <- q1_dataset$Var9
plot(x, y, xlab = 'Var1', ylab = 'Var9', col = 'Black')

#bar graph
val3 = c(mean(q1_dataset$Var2), mean(q1_dataset$Var3), mean(q1_dataset$Var5), mean(q1_dataset$Var8), mean(q1_dataset$Var9))

barplot(val3, ylab = "Mean for each var",  main = "Var1", cex.names = 2, las = 2, col ="orange")

