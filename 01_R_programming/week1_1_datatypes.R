#coursera.org
#Computing for data analysis (Johns Hopkins)
#R programming 
#Week 1 lesson 1: datatypes
#Juliana Cavalcanti Correa = 01/13

x <- "JU"
print(x)
x
getwd() #you can also setwd("somewhere")
ls() #workspace stuff


##### VECTORS #####

#operations are applied in parallel to vector elements

#c is a function that creates vectors
v <- 35:42 #integer range
v * v
v <- c(0.5, 0.6) #numeric 
v + 1
v <- c(T, F) #boolean
v & v
v <- c("abc", "bcd", "cde") #string
v 
v <- c(1+7i, 3+5i) #complex
v + v

#other forms of creating vectors
v <- vector("numeric", length= 10) 
v <- rep("ju", 5) #repeat n times

#if using diff types, they are coerced
#logical < integer < double < complex < character < list

v <- c(TRUE, "a") #coercion to string
v <- c(1, "a") #coercion to string
v = c(TRUE, 1, FALSE, 0) #coercion to integer


#explicit coercion
as.numeric("1") 
as.numeric(FALSE)
as.character(1)
x <- as.complex(2)
x = as.character(x)

#Missing types: NaN != NA
x <- c(1, 2, NaN, NA, 4)
is.na(x)  #NaN is always a NA
is.nan(x) #NA is not always NaN


##### LISTS - hold different types of data #####

l <- list(123, "abc", TRUE, 1+2i, c("a", "b", "c"))
names(l) <- c("a", "b", "c", "d", "e") # names each item in the list

l #elements are represented by double brackets


##### MATRICES #####

m <- matrix(1:6, nrow = 2, ncol = 3)
dim(m)
attributes(m)

#constructed by columns
m <- matrix(1:6, nrow = 2, ncol = 3)

#constructed by breaking an existing vector in dimensions
m <- 1:10
dim(m) <- c(2, 5)

m <- matrix(1:10, 5, 2)

#constructed by binding vectors to rows or columns
x <- 1:3
y <- c("a", "b", "c")
m <- cbind(x, y)  # creates columens from the vectors
m <- rbind(x, y)  # creates rows from the vectors

#naming the dimensions
dimnames(m) <- list(c("rx", "ry"), c("c1", "c2", "c3"))

#vectors have to be the same length
w = 1:5
m <- rbind(x, w) #restarts x vector to match w and warns

#operations
m * m #element-wise, as in vectors 
m / m 
m %*% m2 #true matrix multiplication uses %*%


##### FACTORS - categorical data #####

f <- factor(c("ju", "ju", "manu", "manu", "ju")) 

#levels are labels that describe and categorize the data
table(f) 

#underlying, integer vectors with "levels" attribute
unclass(f) 

#order the levels (manu comes before ju)
f <- factor(c("manu", "ju", "manu", "manu", "ju"), levels = c("manu", "ju"))


##### DATA FRAMES - tabular data #####

# like lists, hold different types of data
df <- data.frame(foo = 1:4, bar = c(T, T, F, F), baz = c("a", "b", "c", "d")) 

# but like matrices, data is in cols 
nrow(df)
ncol(df)

#that have to be the same length
df <- data.frame(foo = 1:4, bar = c(T, T, F)) #ERROR

names(df) <- c("numbers", "bools", "chars") #column names
row.names(df)


