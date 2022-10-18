# Activity 1
age = c(55, 57, 56, 52, 51, 59, 58, 53, 59, 55, 60, 60, 60, 60, 52, 55, 56, 51, 60, 52, 54, 56, 58, 53, 53, 50, 55, 51, 57, 60, 57, 55, 51, 50, 57, 58)
#Apply the factor function
factor_age <- factor(age) 
print(factor_age)
#Creating table
data_StaffAge <- data.frame(Staff_Age = levels(factor_age),
                       Total_number_of_staff = c(2,4,4,3,2,5,4,5,3,2,6))
data_AgeRange <- data.frame(Age_Range = c("50-52", "52-54", "54-56", "56-58", "58-60"),
                            Total_number_of_staff = c(10, 9, 11, 12, 11))

# Activity 2
V1 = c(2, 3, 1, 5, 4, 6, 8, 7, 9)
#Rename column and row
rownames <- c("row1", "row2", "row3")
colnames <- c("col1", "col2", "col3")
#Create 3x3 matrix
Matrix1 <- matrix(V1, nrow = 3, ncol = 3, byrow = TRUE, dimnames = list(rownames, colnames))
#Transpose of matrix
Matrix2 <- t(Matrix1)
#Add, Subtract, Multiply, Divide the matrix
add <- Matrix1 + Matrix2
cat("Result of addition", "\n")
print(add)
subtract <- Matrix1 - Matrix2
cat("Result of subtraction", "\n")
print(subtract)
multiply <- Matrix1 * Matrix2
cat("Result of multiplication", "\n")
print(multiply)
divide <- Matrix1 / Matrix2
cat("Result of division", "\n")
print(divide)

# Activity 3
#Create array 1
Vector1 <- c(1, 2, 3, 4, 5, 6, 7, 8)
Vector2 <- c(9, 10, 11, 12, 13, 14, 15, 16)
Vector3 <- c(17, 18, 19, 20, 21, 22, 23, 24)
array1 <- array(c(Vector1, Vector2, Vector3), dim = c(2, 4, 3)) #dim arrange in order row, col, table
cat("Array 1", "\n")
print(array1)
#Create array 2
Vector4 <- c(25, 26, 27, 28, 29, 30)
Vector5 <- c(31, 32, 33, 34, 35, 36)
Vector6 <- c(37, 38, 39, 40, 41, 42)
Vector7 <- c(43, 44, 45, 46, 47, 48)
Vector8 <- c(49, 50, 51, 52, 53, 54)
array2 <- array(c(Vector4, Vector5, Vector6, Vector7, Vector8), dim = c(3, 2, 5))
cat("Array 2", "\n")
print(array2)
#Print 2nd row of 2nd matrix of the 1st array
cat("The second row of the second matrix of the array:", "\n")
print(array1[2,,2])
#Print 3rd row of and 3rd column of the 1st matrix of the 2nd array
cat("The element in the 3rd row and 3rd column of the 1st matrix:", "\n")
print(array2[3,2,1])