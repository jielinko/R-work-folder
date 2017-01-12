# 一,get started

x <- 3
y <- 4
z <- sum(x + y)
help(sum)
?sum # these two inquery the function info
args(sum) # inquery the arguments of the function 
example(sum) # got the using sample of the function
# after input the name of one function,press tab to check the relative functions

# download Velocity from http://velocity.silverlakesoftware.com

# 安裝 package 有以下兩種方式：
  # 1,透過右下角 Packages -> Install Packages 安裝套件
  # 2,在 console 輸入指令安裝

install.packages("ggplot2") # 下載 ggplot2 套件

# 載入 package 有以下兩種方式：
  # 1,透過右下角 Package，將要載入的 package 打勾即可。
  # 2,在 console 輸入指令載入

library(ggplot2) # ggplot2 一個畫圖套件。
require(ggplot2) 

# library 與 require 都是載入 package，但是最大的差別在於，library 如果是載入的 package 不存在，是會發生 error 程式停止，
# 但是 require 卻不會。


# 二,基本运算

# R 的基本資料屬性包含以下五種，可用 class 函數判斷資料屬性
  # 1,character：文字字串，用 "" 包起來，ex："test"
  # 2,numeric：實數
  # 3,integer：整數
  # 4,complex：複數
  # 5,logical：True 或 False

class("test")

class(10.10)

class(10)

class(as.integer(3)) # 因為 R 計算上是都是以雙倍精確度來計算，所以必須指定為 integer，不然都會被當成 numeric 看待。

as.integer(3.1)
class(as.integer(3.1)) # as.integer 可以將不是整數的數值變成整數

as.integer(T)
class(as.integer(T)) # as.integer(T) = 1
as.integer(F)
class(as.integer(T)) # as.integer(F) = 0

class(2+2i)

class(TRUE) ## 注意都要大寫，不可寫 True，但可以簡化成 T
class(T)

# 註：
  # 1,as.integer 切記不可以傳 character 進去，因為會產生 NA，如果傳 complex 進去，則會將虛數的部份則會自動捨棄。
  # 2,可以用 is.integer(x) 判斷是否為整數。
  # 3,complex 也有跟 integer 類似的函數，as.complex 與 is.complex。
  # 4,logical 也有跟 integer 類似的函數，as.logical 與 is.logical

as.integer("test")
as.integer(2+2i)
is.integer(2)
is.integer(as.integer(2))

as.complex(2)
is.complex(2)
is.complex(as.complex(2))

as.logical(1)
as.logical(2)





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

# vectorized

x <- 1:5
y <- 6:10

x+y
x*y
x/y

x <- matrix(1:4,nrow=2,ncol=2)
y <- matrix(rep(2,4),nrow=2,ncol=2)
x*y
x/y


#lapply
str(lapply)

x <- list(a=1:10,b=c(11,21,31,41,51))
lapply(x,mean)

x <- 1:4
lapply(x,runif)
lapply(x,runif,min=0,max=100)

x <- list(a=matrix(1:6,2,3),b=matrix(4:7,2,2))
lapply(x,function(m) m[1,])

#sapply

x <- list(a=1:10,b=c(11,21,31,41,51))
lapply(x,mean)
sapply(x,mean)

class(sapply(x,mean))

#apply

x <- matrix(1:16,4,4)

apply(x,2,mean)
apply(x,2,sum)

apply(x,1,sum)
apply(x,1,mean)

rowSums(x)
rowMeans(x)
colSums(x)
colMeans(x)

x <- matrix(rnorm(100),10,10)
apply(x,1,quantile,probs=c(0.25,0.75))

x <- array(rnorm(2*3*4),c(2,3,4))
apply(x,c(1,2),mean)
apply(x,c(1,3),mean)
apply(x,c(2,3),mean)

# mapply

list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))

mapply(rep,1:4,4:1)

s <- function(n,mean,std){
  rnorm(n,mean,std)
}

s(4,0,1)

mapply(s,1:5,5:1,2)
list(s(1,5,2),s(2,4,2),s(3,3,2),s(4,2,2),s(5,1,2))



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
