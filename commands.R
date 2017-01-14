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
is.logical(1)
is.logical(F)

  #             character numeric integer complex logical
   # as.integer      X       Ｏ     Ｏ       Ｏ      Ｏ
   # is.integer      F       F      T         F       F
  
  
  # 常见运算
   # 加减乘除
1+2
1-2
1*2
1/2

  # 次方,平方根,商数与余数
2^3 # 2 的 3 次方
2**3 # 2 的 3 次方
sqrt(4) # 4 的平方根
27^(1/3) # 27 的立方根

11 %/% 5 #11 除以 5 的得的熵
12 %% 5 #11 除以 5 的余数

  # sign：判斷是正、負數或 0

sign(10)
sign(0)
sign(-10)

  # abs：取絕對值

abs(10)

abs(0)

abs(-10)

  # log

log(10) # log 以 e 为底
log1p(9) # log(x) = log1p(x-1)

log(10,2) # 指定log 以 2 为底
log2(10) # log2 代表以 2 為底
log10(10) # log10 代表以 10 為底

  # exp 高等数学里以自然常数e为底的指数函数

exp(10) 
expm1(10) # expm1(x) = exp(x) - 1

# 三,对象和属性

  # 1. 变量
  # 2. 向量
  # 3. 矩陣
  # 4. 因子
  # 5. 串列
  # 6. 資料框架
  # 7. 時間數列
  # 8. 指標

# 3.1 变量

x <- 1
y <- 2
x+y

x1 <- x2 <- 1
x1 + x2

  # exists 函數檢查 重复给变量赋值的问题

x = 1
x = 1.3
x = 1 + 2i
x = "test"
x = FALSE
x = 10
exists("x")

  # NA 與 NULL
   # NA 代表是個空物件，已經有物件但是裡面沒東西，NULL 則是根本沒有任何東西

# 3.2 向量(vector)
  # 利用 c(...) 建立向量，但切記向量元素必須是同個資料屬性。

x <- vector("character",length = 10)
x1 <- 1:4
x2 <- c(1,2,3,4)
x3 <- c(TRUE,10,"a")
x4 <- c("a","b","c")
as.numeric(x4)

c(1,2,3)
c(1,TRUE,"test")  # 全部都變成 character
c(1.1,TRUE,"test") # 全部都變成 character
c(1+2i, TRUE, "test") # 全部都變成 character
c(1,TRUE) # 全部自動轉成 integer
c(1.1,TRUE) # 全部自動轉成 numeric
c(1+2i, TRUE) # 全部自動轉成 complex
c(1, 1.1) # 全部自動轉成 numeric
c(1, 1.1, 1+2i) # 全部自動轉成 complex

  # 註：
    # 經由以上比較後，可以得到當放入的形態不同時，會被轉成同一形態，且可以
    # 每個形態的強弱不同，以下是強到弱排序。
    # character > complex > numeric > integer > logical
  
  # 取向量元素的两种方式
    # 1,指标
    # 2,元素名称
  
  # 另外可以搭配 [] 或 [[]]，這樣分別會回傳向量元素的所有資訊或向量元素的數值，
  
  # 總共可以分成以下四種狀況：
    # 1, x[i]：回傳向量元素所有資訊
    # 2, x[[i]]：只回傳向量元素的值
    # 3, x[元素名稱]：回傳向量元素所有資訊
    # 4, x[[元素名稱]}：只回傳向量元素的值

x <- c(joe=12, vicky=14, bob=17)

x[]
x[1]
x[[1]]
x["joe"]
x[["joe"]]

x[1:2] # 一次取多个向量元素

  # c(...) 类似的函数x:y, seq 与 rep
    #1,x:y : 回传 x 到 y 的整数向量,所以 x 与 y 都是整数
    #2,seq(s, e, by)：產生一個等差級數的向量。
        # s 是初始值
        # e 是結束值
        # by 是遞增值，預設是 1
    #3,rep(x, times, each)：產生一個重覆循環的向量。
        # x 是需重覆循環的數值
        # times 是重覆循環次數
        # each 是 x 內元素重覆的次數
1:5
seq(1:5)
seq(1,5,0.3) # 就算沒有剛好加到跟結束值一樣也沒關係
rep(c(1,2,3),times=3,each=2)
rep(1:4,times=3,each=2)

  # 基本相關函數
    # 向量加減乘除
    # length：計算向量中的元素個數。
    # sum：將向量所有元素加總。
    # prod：將向量所有元素相乘。
    # cumsum：回傳元素累加向量。
    # cumprod：回傳元素累乘向量。
    # sort：將向量元素排列，產生排序過的向量。
    # rank：回傳各向量元素的排序值。

c(3,4,2) + c(3,4,2)
c(3,4,2) - c(3,4,2)
c(3,4,2) * c(3,4,2)
c(3,4,2) / c(3,4,2)

length(c(3,4,2))
sum(c(3,4,2))
prod(c(3,4,2))
cumsum(c(3,4,2))
cumprod(c(3,4,2))
sort(c(3,4,2))
rank(c(3,4,2))

  # 向量长度不同的加减乘除

    # 加和减 : 如果長度較長的向量長度是較短的倍數的話是可以相加或相減的。
c(1,2) + c(1,2,3)  
c(1,2) + c(1,2,3,4)  

    # 乘跟除 : 與加跟減狀況一致，只是當長度不是倍數時會有結果但也會警告。
c(1,2) * c(1,2,3)
c(1,2) * c(1,2,3,4)

# 3.3 阵列 & array
  # 3.3.1 利用 rbind、cbind 與 array 函數建立陣列

  # 陣列可視為多維度的向量變數，跟向量一樣，所有陣列元素的資料屬性必須一致。

x <- c(1,2,3)
y <- c(4,5,6)

rbind(x,y) # rbind 是通过 row(横) 合并
cbind(x,y) # cbind 是通过 column(列) 合并

array(x,c(1,3)) # c(1,3) 代表产生 1 * 3 列阵列
array(x,c(2,3)) # c(2,3) 代表产生 2 * 3 列阵列
array(x,c(3,3)) # c(3,3) 代表产生 3 * 3 列阵列

  # 透過指標提取資料
    # 陣列與向量相同，可以透過指標或名稱選取陣列的元素。
x <- c(1,2,3)
y <- c(4,5,6)
z <- rbind(x,y)
z[,1] # 选取第一列(column 直)
z[1,] # 选取第一行(row 横)
z[1,1:2] # 选取第一行第一到第二列

  # 基本相关函数
    # 陣列加減乘除
    # length：計算陣列中的所有元素個數。
    # dim：列出維度資訊
    # ncol、nrow：計算(column、直) 或 (row、橫) 個數。
    # aperm：將陣列轉置
x <- c(1,2,3)
y <- c(4,5,6)
z <- rbind(x,y)

z + z
z - 2 * z
z * z 
z / z

length(z)
dim(z) # 前者是 row，後者是 column
ncol(z)
nrow(z)
aperm(z) # 等同是從 rbind 轉成 cbind

  # 3.3.2 矩阵：利用 matrix 建立矩陣
    # 當陣列是 2 維的狀況就是所謂的矩陣，可以利用 matix 產生矩陣，也可以用之前產
    # 生陣列的方法實作。

x <- matrix(1:6, nrow =3 ,ncol = 2)
attributes(x) # 查看维度信息
matrix(c(1:6), nrow = 3, ncol = 2) # 預設是按照 column 填入資料
matrix(c(1:6), nrow = 3, ncol = 2, byrow = TRUE) # 可以更改成按照 row 填入資料

  # 透過指標提取資料
    # 矩陣跟陣列一樣，還是可以透過指標選取矩陣的部份元素。
x <- c(1,2,3)
y <- c(4,5,6)
z <- rbind(x,y)

z[,1]
z[1,]
z[1,1:2]

  # 基本相关函数
    # t(x)：將矩陣轉置。
    # %*%：矩陣相乘。
    # diag：產生一個對角矩陣，或回傳矩陣的對角線向量
    # det：計算矩陣行列式值，一定是要對稱矩陣。
    # solve：傳回矩陣的反矩陣，非常適合解線性方程式。
    # eigen：計算矩陣的特徵向量與特徵值。
    # rownames：修改或查詢 row 名稱。
    # colnames：修改或查詢 column 名稱。

x <- c(1,2,3)
y <- c(4,5,6)
z <- rbind(x,y)

t(z)
z %*% z # 矩陣相乘要符合前者 column 維度 = 後者 row 維度，如果沒有會發生錯誤！
v <- z %*% t(z)
w <- diag(c(1,2,3)) # 傳入向量回傳一個對角矩陣
diag(w) # 傳入矩陣回傳矩陣對角線向量
det(v) # 一定要對稱矩陣才可以計算
solve(v) 

b = c(1,1)  # 解 Ax = b，求出 x ; 向量 A:變數 v,b:變數 b
solve(v,b) 

u = matrix(1:9, nrow = 3, ncol = 3)
eigen(u) # 特征值

rownames(z)
rownames(z) <- c("第一行","第二行")
rownames(z)

colnames(z)
colnames(z) <- c("第一列","第二列","第三列")
colnames(z)

 # 3.4 因子(factor)

    # 利用 factor 建立因子
    # 因子有點像經過分級之後的向量，因子大多可以用在統計上的迴歸分析與實際設計等。

x <- c(1,2,4,3,1,2,3,4,1)
factor(x)

factor(x, labels = c("一", "二", "三", "四")) # 可自訂 Level 的名稱。
factor(x, ordered = TRUE) # ordered 代表可做排序
factor(c(1, 2, 1, NA, 2), exclude = NA) # 可利用 exclude 排除特定資料。
factor(c(1, 2, 1, NA, 2), exclude = 2)
factor(c(1, 2, 1, NA, 2), exclude = NULL) # 不排除任何資料。
factor(c(1, 2, 1, NA, 2)) #默认排除NA

    # 透過指標提取資料

x[1] # [] 與 [[]] 結果一致，因為因子只有值沒有其他相關資料。
x[[1]]
x[1:2] # 指标可以使用向量
x[c(1,3,5)] # X 的第一,三,五位分别为1,4,1

    # 基本相关函数
      # is.factor：判斷是否為因子。
      # as.factor：將變數轉為因子。
      # is.ordered：判斷是否為排序過的因子。
      # as.ordered：將因子排序。
      # which：找出符合條件的指標。

x <- c(1,2,4,3,1,2,3,4,1)

as.factor(x)
is.factor(x)
is.factor(as.factor(x))
is.ordered(factor(x,ordered = TRUE))
is.ordered(factor(x,ordered = FALSE))
as.ordered(factor(x))
which(x == 1)

  # 3.5 列表(list)
    # 利用 list 建立列表
    # 列表跟向量很相似，但最大的不同在於列表可以包含不同資料屬性的資料。

x <- list(a = 1, b = TRUE, c = "test", d = c(1,2,3))
l <- list("a",2,10L,3+4i,TRUE)
l2 <- list(a=1,b=2,c=3)
l3 <- list(c(1,2,3),c(4,5,6,7))
    # 透過指標與名稱提取資料
x <- list(a = 1, b = TRUE, c = "test", d = c(1,2,3))
x[1]
x[[1]]
x$b # 利用 $ 加上名称提取资料
x[[4]][2] # x[[4]] 取出第四個值，因為第四個值是向量，所以可以在取一次指標，取出向量的元素值。
  
    # 基本相關函數
      # 1,as.list:建立列表
      # 2,is.list:判断是否为列表
      # 3,attributes:查看所有元素的名称,names也有相同功能.
x <- list(a = 1, b = TRUE, c = "test", d = c(1,2,3))
as.list(c(1,2,3))
is.list(x)
attributes(x)
names(x)

  # 3.6 资料框架(data.frame)
      # 利用 data.frame 建立資料框架
      # 資料框架類似資料表，常當作大量資料集，例如：匯入外部檔或讀取資料庫資料等。
name <- c("Joe","Bob","Vicky")
age <- c("28","26","34")
gender <- c("Male","Male","Female")
data <- data.frame(name,age,gender)
view(data) #自动点选data变数就会开启资料的画面
      
      # 透過指標與名稱提取資料
        # 資料框架的提取資料方法跟矩陣或陣列的都很類似。
data 
data[1,]
data[,1]
data[1,1]
data[,"name"]
data[1:2,"name"]
data$name[1:2]

    # 基本相關函數
      # head : 取得資料框架前六项資料(預設是 6)。
      # names : 修改或查詢 column 名稱。
      # colnames：設定 column 名稱。
      # row.names：修改或查詢 row 名稱。
      # rownames：設定 row 的名稱
      # summary：顯示資料基本資訊。 

data
head(data)
head(data,1L)
names(data)
names(data) <- c("n","a","g")
names(data)
colnames(data)
row.names(data)
row.names(data) <- c("r1","r2","r3")
data
row.names(data)
rownames(data)

summary(data)

#factor

x <- factor(c("female","female","male","male","male","female"))

x <- factor(c("female","female","male","male","male","female"),levels = c("male","female"))


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


# 四, 資料匯入與輸出
  # 1. 匯入資料
  # 2. 輸出資料
  # 3. 讀取資料庫的資料

  # 4.1 匯入資料
      # 透過 read.table 匯入資料。
      # read.table 可以讀取大多數的 ASCII 資料，以下先以 CSV 檔為代表，因為是目前
      # 最普遍見到的匯入資料格式。

data <- read.table("E:\\R-work-folder\\readtest.csv",header = TRUE,sep = ",")
data <- read.table("E:\\R-work-folder\\readtest.csv", header = TRUE, sep = ",", col.name = c("時間", "新聞標題")) # col.names 設定 column 欄位名稱/执行不成功

data <- read.table("E:\\R-work-folder\\readtest.csv", header = FALSE, sep = ",", skip = 2) 
# skip 是指跳過前 X 筆資料，這個部份要注意，要跳過資料，column 欄位就不可以出現在資料裡，因為它也被算在要 skip 部份。

data <- read.table("E:\\R-work-folder\\readtest.csv", header = TRUE, sep = ",", encoding = "UTF-8") # encoding 是指定檔案的文字編碼
data <- read.table("E:\\R-work-folder\\readtest.csv", header = TRUE, sep = ",", na.strings = NA) # na.strings 指定發生 NA 要用什麼符號代替。

    # 文字編碼問題
        # 匯入 CSV 檔的時候會碰到一種比較特別的問題，就是作業系統編碼不同的問題，
        # Windows 的中文編碼是 big5，而 Linux / Mac 都是 UTF-8，所以在 Linux / Mac 匯
        # 入來自於 Windows CSV 檔常常會發生亂碼，那該如何解決此問題，本人的做法是
        # 將資料讀進來轉成 UTF-8，在輸出一份 CSV 檔，以下先以一個 CSV 檔為主，加以
        # 調整修改就可以改成一次跑一個資料夾下的所有 CSV 檔。

data <- readLines("E:\\R-work-folder\\readtest.csv", encoding="big5")
# 讀取實價登入資料，是一行一行讀取進來。
data <- iconv(data, "big5", "utf8") # 將資料轉成 UTF-8。
column_count <- length(strsplit(data[1], ",")[[1]])
row_count <- length(data) # 計算 column 與 count 個數。
fix_data <- matrix(NA, nrow = row_count, ncol = column_count)
# 建立一個空的 NA 矩陣，維度來自於 row_count 與 column_count。

for(row in 1:row_count){
  for(col in 1:column_count){
    fix_data[row,col] <- strsplit(data[row],",")[[1]][col] # 执行 for loop 将资料塞入 fix_data.
  }
}

write.table(fix_data[2:row_count,],file = "E:\\R-work-folder\\write_output_test.csv",sep = ",", col.names = fix_data[1,])

# 將資料輸出，輸出注意一點，因為第一 row 是欄位名稱，所以記得指標要從 2 開始，指標 1 的部分要放到 col.names。



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
