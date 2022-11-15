# Activity 1
year <- as.integer(readline(prompt = "Input year: "))
if((year %% 4) == 0){
  if((year %% 100) == 0){
    if((year %% 400) == 0){
      print(paste("Output:", year, "is a leap year."))
    } else {
      print(paste("Output:", year, "is not a leap year."))
    }
  } else {
    print(paste("Output:", year, "is a leap year."))
  }
} else {
  print(paste("Output:", year, "is not a leap year."))
}

# Activity 2
num = as.integer(readline(prompt="Input an integer: "))
for(x in 1:num){
  print(paste("Number is:", x, "and the number of", x, " is: ", x ** 3))
}

# Activity 3
cat("Check whether an n digits number is Armstrong or not.", "\n")
cat("--------------------------------------------------------", "\n")
n = as.integer(readline(prompt="Input an integer: "))
sum = 0
temp = n
while(temp > 0) {
  digit = temp %% 10
  sum = sum + (digit ^ 4)
  temp = floor(temp/10)
}
if(n == sum) {
  print(paste(n,"is an Armstrong number."))
} else {
  print(paste(n,"is not an Armstrong number."))
}

