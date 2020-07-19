install.packages("swirl")
library(swirl)
ls()
swirl()

TRUE==TRUE
(FALSE==TRUE)==FALSE
6==7
6<7
10<=10
4
2
5!=7
!(5==7)
3
4
FALSE & FALSE
TRUE & c(TRUE,FALSE,FALSE)
TRUE && c(TRUE,FALSE,FALSE)
TRUE | c(TRUE,FALSE,FALSE)
TRUE || c(TRUE,FALSE,FALSE)
5>8 || 6 !=8 && 4>3.9
1
2
4
isTRUE(6>4)
1
identical('twins', 'twins')
1
xor(5==6,!FALSE)
2
ints <- sample(10)
ints
ints>5
which(ints>7)
2
any(ints<0)
all(ints>0)
4
1
andrescif@gmail.com
#8Oog31IjMNTyV3iN

1
9
Sys.Date()
mean(c(2,4,5))
boring_function <- function(x) {
  x
}
submit(boring_function <- function(x) {
  x
})
1
14
d1 <- Sys.Date()
class(d1)
unclass(d1)
d1
d2 <- as.Date("1969-01-01")
unclass(d2)
t1 <- Sys.time()
t1
class(t1)
unclass(t1)
t2 <- as.POSIXlt(Sys.time())
class(t2)
t2
unclass(t2)
str(unclass(t2))
t2$min
weekdays(d1)
months(t1)
quarters(t2)
t3 <- "October 17, 1986 08:24"
t4<- strptime(t3, "%B %d, %Y %H:%M")
t4
class(t4)
Sys.time()>t1
Sys.time()-t1
difftime(Sys.time(), t1, units = 'days')
1
andrescif@gmail.com
#OB0poaYyFAqqyXUe





pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  allFiles <- list.files(path = "Data/specdata", full.names = TRUE)
  selectedData <- data.frame()
  for (i in id) {
    selectedData <- rbind(selectedData, read.csv(allFiles[i]))
  }
  if (pollutant == 'sulfate') {
    mean(selectedData$sulfate, na.rm = TRUE)
  } else if (pollutant == 'nitrate') {
    mean(selectedData$nitrate, na.rm = TRUE)
  }
  
}






complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  allFiles <- list.files(path = "Data/specdata", full.names = TRUE)
  selectedData <- data.frame()
  completeCases <- data.frame()
  nobs <- data.frame();
  for (i in id) { 
    selectedData <- (read.csv(allFiles[i],header=TRUE))
    nobs <- sum(complete.cases(selectedData))
    completeCases <- rbind(completeCases, data.frame(i,nobs))
  }
  completeCases
}
complete("specdata",1)
complete("specdata",c(2,4,8,10,12))







corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  source("complete.R")
  completeCases <- complete(directory)
  casesAboveThreshold <- completeCases[completeCases$nobs > threshold,1]
  allFiles <- list.files(path = "Data/specdata", full.names = TRUE)
  correlations <- rep(NA,length(casesAboveThreshold))
  for (i in casesAboveThreshold) {
    fileData <- (read.csv(allFiles[i]))
    completeCases <- complete.cases(fileData)
    validSulfateData <- fileData[completeCases, 2]
    validNitrateData <- fileData[completeCases, 3]
    correlations[i] <- cor(x = validSulfateData, y = validNitrateData)
    #print(head(fileData[completeCases,]))
    #print(validSulfateData)
    #print(validNitrateData)
  }
  correlations <- correlations[complete.cases(correlations)]
}







pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)

RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])

cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)


