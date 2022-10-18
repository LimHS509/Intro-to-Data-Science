# Question 2
data <- iris
str(data)

mean(data$Sepal.Length) 
median(data$Sepal.Length)
#Method 1
mode = function(){
  return(sort(-table(data$Sepal.Length))[1])
}
mode()

#Method 2
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
result <- getmode(data$Sepal.Length)
print(result)


# Question 3
my <- read.csv("C:/Users/USER/OneDrive/Documents/Undergraduate/Year 2/SEM 2/Introduction to Data Science/Database/covid_my.csv")
#Installing package 
install.packages("plotrix") 
#Package contains tools for the plotting of data
library(plotrix)
va12 = my[my$Confirmed > 300000,]
tb11 = va12[c("Confirmed", "Population")]
legendval = c("Confirmed", "Population")
colors  = c("green", "orange")
row.names(tb11) = va12$State
tb12 = t(tb11)
#options = allow the user to set and examine a variety of global options which affect the way in which R computes and displays its result
#scipen = the number of orders of ten smaller required to switch to scientific notation
options(scipen = 999)
barplot(as.matrix(tb12), col=colors, cex.name=0.8, las=2, cex.axis=0.8)
#An area of the graph plot describing each of the parts of the plot
legend("topright", legendval, cex=0.8, fill=colors)


# Question 4
install.packages("rworldmap")
install.packages("tidyverse")
install.packages("tidygeocoder")
#To get a Malaysia map
library(rworldmap) 
#Helps to transform and better present data
library(tidyverse) 
#Returns latitude and longitude coordinates in tibble format
library(tidygeocoder) 
mydat <- read.csv("C:/Users/USER/OneDrive/Documents/Undergraduate/Year 2/SEM 2/Introduction to Data Science/Database/covid_my.csv")
#Get map
global <- map_data("world") 
#To produce the plots when using the package
ggplot() +
  #a relatively simple type of geometry that is defined by small number of properties
  #aes = set of aesthetic mapping
  geom_polygon(data = global %>% filter(region == "Malaysia"), aes(x=long, y=lat, group=group),
               fill = "lightskyblue1") +
  coord_fixed(1.3) +
  #Adds a layer of points to plot which creares a scatterplot
  geom_point(data = mydat, aes(x = Long, y = Lat), color = "red") +
  #Adds text directly to the plot
  geom_text(
    data = mydat,label=paste(mydat$State, mydat$Confirmed, sep=","), aes(x=Long, y=Lat),
    #Let offset labels from their corresponding points
    nudge_x = 0.25, nudge_y = 0.25,
    color = "black", size = 1.5
    ) +
  #A completely empty theme
  theme_void()

