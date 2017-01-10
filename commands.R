#vector

x <- vector("character",length = 10)

x1 <- 1:4

x2 <- c(1,2,3,4)

x3 <- c(TRUE,10,"a")

x4 <- c("a","b","c")

as.numeric(x4)

#matrix & array

x <- matrix(1:6, nrow =3 ,ncol = 2)

attributes(x)

y2 <- matrix(1:6,nrow=2,ncol=3)

#list

l <- list("a",2,10L,3+4i,TRUE)

l2 <- list(a=1,b=2,c=3)

l3 <- list(c(1,2,3),c(4,5,6,7))

#factor

x <- factor(c("female","female","male","male","male","female"))

x <- factor(c("female","female","male","male","male","female"),levels = c("male","female"))

# data frame

df <- data.frame(id=c(1,2,3,4),name=c("a","b","c","d"),gender=c(TRUE,TRUE,FALSE,FALSE))

df2 <- data.frame(id=c(1,2,3,4),score=c(80,86,90,100))

#date and time

x <- date()

x2 <- Sys.Date()

x3 <- as.Date("2015-01-01")

weekdays(x3)

months(x3)

quarters(x3)

julian(x3)

x4 <- as.Date("2016-01-01")
x4-x3
as.numeric(x4-x3)

#time

x <- Sys.time()
p <- as.POSIXlt(x)

names(unclass(p))

p$sec

as.POSIXct(p)

as.Date("2015-01-01")

x1 <- "一月 1,2015 01:01"
strptime(x1,"%B %d, %Y %H:%M")

#Subsetting List

x <- list(id=1:4,height=170,gender="male")

x[1]
x["id"]

x[[1]]
x[["id"]]
x$id

x[c(1,3)]

y <-"id"
x[["id"]]
x[[y]]

x$id
x$y

#subsetting nested element of a list

x<- list(a = list(1,2,3,4),b=c("Monday","Tuesday"))

x[[1]][[2]]
x[[1]][2]

x[[c(1,3)]]
x[[c(2,2)]]

#partial matching

l <- list(asdfghj=1:10)
l$asdfghj
l$a

l[["a"]]
l[["a",exact=FALSE]]

x <- list(asdfghj=1:10,b=1:2,aaa=3:5)
x$a
x[["a",exact=FALSE]]
x$as

#missing value

x <- c(1,NA,2,NA,3)
is.na(x)
x[!is.na(x)]

x <- c(1,NA,2,NA,3)
y <- c("a","b",NA,"c",NA)
z <- complete.cases(x,y)

x[z]
y[z]

library(datasets)
head(airquality)
g <- complete.cases(airquality)
airquality[g,][1:10,]

#function

fun1 <- function (a,b){ return(a+b) } 

summary.myClass = function(x){ print("Hello World!")}
view(summary.myClass)
summary(q)

# ax+b = 0
equation <- function (a,b){
  
  tem = 0-b;
  
  return (tem/a)
} 

#a*x^2 + b*x + c = 0

equation2 <- function(a,b,c){
  
  if(b^2-4*a*c>0){
    
    root1 = (0-b+sqrt(b*b-4*a*c))/2*a;
    root2 = (0-b-sqrt(b*b-4*a*c))/2*a;
    
    return (root1)
  }
  
  else
    
    if(b^2-4*a*c=0) {
      
     root = 0-b/2*a;
     
     return (root)
     
    } 
  
  else {
    
    root1 = 0-b/2*a + sqrt(complex ((b*b-4*a*c)/2*a));
    root2 = 0-b/2*a + sqrt(complex ((b*b-4*a*c)/2*a));
  
    return (root1)
    
  }
  
}



df <- read.table(file="Argentina.txt",header="True")
