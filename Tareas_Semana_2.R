library(tdyvers)
#Cargar datos
hw1_data <- read.csv("~/R Projects/Coursera/Data/hw1_data.csv")

variable.names(hw1_data)
is.na(hw1_data$Ozone)
table(is.na(hw1_data$Ozone))
mean(hw1_data$Ozone,
     na.rm = TRUE)
table(hw1_data$Ozone>31)
table(hw1_data$Temp>90)

Numero18 <- subset.data.frame(hw1_data,
                  (hw1_data$Ozone>31 &
                     hw1_data$Temp>90))

mean(Numero18$Solar.R)
mean(hw1_data$Temp[hw1_data$Month==6])
table(hw1_data$Ozone[hw1_data$Month==5])
summary(hw1_data$Ozone[hw1_data$Month==5])

x <- 4L
class(x)

x <- c(4,TRUE)
class(x)

x <- 1:4 
y <- 2:3
class(x+y)

x <- c(17, 14, 4, 5, 13, 12, 10)
x[x>10]==4


