# Activity 1
vector <- c(33, 24, 54, 94, 16, 89, 60, 6, 77, 61, 13, 44, 26, 24, 73, 73, 90, 39, 90, 54)
list_data <- list(c("90-100", "80-89", "70-79", "60-69", "50-59", "<=49"),
                    list(c("A", "B", "C", "D", "E", "F")))
names(list_data) <- c("Score", "Grade")
list_data[3] <- "Number of Students"
sort.result <- sort(vector)
print(sort.result)

# Activity 2
list_data <- list(c("Robert", "Hemsworth", "Scarlett", "Evans", "Pratt", "Larson", "Holland", "Paul", "Simu", "Renner"),
                  list(c(59, 71, 83, 68, 65, 57, 62, 92, 92, 59)))
names(list_data) <- c("Student_Name", "Exam_Score")

df <- data.frame(Student_Name = c("Robert", "Hemsworth", "Scarlett", "Evans", "Pratt", "Larson", "Holland", "Paul", "Simu", "Renner"),
                 Exam_Score = c(59, 71, 83, 68, 65, 57, 62, 92, 92, 59))
print(df)

print(paste("Highest score: ", max(df$Exam_Score)))
print(paste("Lowest score: ", min(df$Exam_Score)))
print(paste("Average score: ", mean(df$Exam_Score)))

# Activity 3
Student_Name <- c("Robert", "Hemsworth", "Scarlett", "Evans", "Pratt", "Larson", "Holland", "Paul", "Simu", "Renner")
Chemistry <- c(59, 71, 83, 68, 65, 57, 62, 92, 92, 59)
Physics <- c(89, 86, 65, 52, 60, 67, 40, 77, 90, 61)
df2 <- data.frame(Student_Name, Chemistry, Physics)

dfMerage = merge(x = df, y = df2, by = "Student_Name", all.x = TRUE)
library(dplyr)
best_score = dfMerage %>% filter(Chemistry <= 49 & Physics <= 49)
print(best_score)
print(paste("Chemistry Highest score: ", max(dfMerage$Chemistry)))
print(paste("Physics Highest score: ", max(dfMerage$Physics)))

