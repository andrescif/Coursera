library(swirl)
ls()
rm(list = ls())
swirl()
Andrés

1
1
10
head(flags)
dim(flags)
viewinfo(flags)
class(flags)
cls_list <- lapply(flags,class)
cls_list
class(cls_list)
as.character(cls_list)
cls_vect <- sapply(flags,class)
class(cls_vect)
sum(flags$orange)
flag_colors <- flags[,11:17]
head(flag_colors)
lapply(flag_colors,sum)
sapply(flag_colors,sum)
sapply(flag_colors,mean)
flag_shapes <- flags[,19:23]
lapply(flag_shapes,range)
shape_mat <- sapply(flag_shapes,range)
shape_mat
class(shape_mat)
unique(c(3, 4, 5, 5, 5, 6, 6))
unique_vals <- lapply(flags,unique)
unique_vals
sapply(unique_vals,length)
sapply(flags,unique)
lapply(unique_vals,function(elem) elem[2])
2
andrescif@gmail.com
#1coKCiWZR6N9oud9

1
11
sapply(flags,unique)
vapply(flags,unique,numeric(1))
ok()
sapply(flags,class)
vapply(flags,class,character(1))
?tapply
table(flags$landmass)
table(flags$animate)
tapply(flags$animate,flags$landmass,mean)
tapply(flags$population,flags$red,summary)
1
tapply(flags$population,flags$landmass,summary)
3
1
andrescif@gmail.com
#OqxAldGzFOiD4PGJ
0
#Quiz
library(datasets)
data(iris)
?iris
iris$Sepal.Length
tapply(iris$Sepal.Length,iris$Species,mean)
apply(iris[,1:4],2,mean)
library(datasets)
data(mtcars)
with(mtcars,tapply(mpg,cyl,mean))
tapply(mtcars$cyl,mtcars$mpg,mean)
sapply(split(mtcars$mpg,mtcars$cyl),mean)
mean(mtcars$mpg,mtcars$cyl)
lapply(mtcars,mean)
tapply(mtcars$mpg,mtcars$cyl,mean)
apply(mtcars,2,mean)
sapply(mtcars,cyl,mean)

tapply(mtcars$hp,mtcars$cyl,mean)
82.63636- 122.28571
debug(ls)
ls()
2
1
4
2
3
4
5

