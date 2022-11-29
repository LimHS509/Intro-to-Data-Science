# Create the data frame
emp.data <- data.frame(
  emp_id = c (1:5),
  emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
  salary = c(623.3,515.2,611.0,729.0,843.25)
)

# Creating a data frame from matrix and renaming the column
my_matrix <- matrix(c(1, 2, 3, 4, 5, 6), nrow=2)
print(my_matrix)
df_from_matrix <- data.frame(my_matrix)
print(df_from_matrix)
names(df_from_matrix) <- c('col_1', 'col_2', 'col_3')
print(df_from_matrix)

# Creating a data frame from list of vectors
my_list <- list(rating=1:4,
                animal=c('koala', 'hedgehog', 'sloth', 'panda'),
                country=c('Australia', 'Italy', 'Peru', 'China'),
                avg_sleep_hours=c(21, 18, 17, 10))
print(my_list)
super_sleepers <- data.frame(my_list)
print(super_sleepers)

# Display the values from the data frame
print(emp.data)

# Display the structures of the data frame 
str(emp.data)

# Display the number of rows and columns
print(summary(emp.data))

# Display the summary of the data frame
print(dim(emp.data))
print(ncol(emp.data))
print(nrow(emp.data))

# Accessing the data frame
# Extract specific column from a data frame using column name or indexing
print(emp.data$salary)
print(emp.data[["salary"]])
print(emp.data[3])

# Extract the first two rows and then all columns
result <- emp.data[1:2,]
print(result)

# Modifying the data frame rows and columns
# Adding new column
# Add the "dept" column.
emp.data$dept <- c("IT","Operations","IT","HR","Finance")
v <- emp.data
print(v)

# Create new data frame and add the "start_date" column.
emp.newdata<- cbind(emp.data, start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11","2015-03-27")))

# Adding new row
# Create the second data frame
emp.newdata <- data.frame(
  emp_id = c (6:8),
  emp_name = c("Rasmi","Pranab","Tusar"),
  salary = c(578.0,722.5,632.8),
  dept = c("IT","Operations","Finance")
)

# Bind the two data frames.
emp.finaldata <- rbind(emp.data,emp.newdata)
print(emp.finaldata)

# Remove Rows and Columns
# Remove the second row and first column
result <- emp.data [-c(2), -c(1)]
print(result)
