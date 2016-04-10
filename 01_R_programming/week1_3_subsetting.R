#coursera.org
#Computing for data analysis (Johns Hopkins)
#R programming 
#Week 1 lesson 3: subsetting
#Juliana Cavalcanti Correa - 01/13 - review 04/16

#in numerical subsets, indices START AT ONE!

#object of the same type of the subsetted
y[1:2] #maybe more than one object

#matrices are exception
m[2, ]               #vector with row 2 elements
m[2, , drop = FALSE] #1x3 matrix with row 2

#logical subset
y[y >= "b"]

#in two steps:

#1. create a boolean vector with results of matching elements to criteria
u <- x < 3
#2. create a subset filtered by this boolean vector
x[u]

#in lists and data frames only one element is returned
df[[1]]
l[[5]]

#to retrieve multiple elements, use an index vectoras param
l[c(1, 4, 5)]
df[c(1,3), 1:3] #rows 1 AND 3 with cols 1 TO 3
df[c(1,4), c(1,3)] #rows 1 and 4 with cols 1 and 3, how cool is that?

#nested elements

df[[1]][3] #takes the first col as a vec, and takes it's 3rd elem

#more complex nesting
w <- list(l1 = list("a", "b", l13 = c(17, 35, 42)), l2 = c(3.14, 2.72))
w[[1]][[3]][[3]] 
w[[c(1,3,3)]] #it's equivalent to passing a vector!

#named indices
df$bools
l[["d"]]

#[[]] can read computed indices (the "" is implicit in the var)
index <- "bools"
df[[index]] 


##### Removing NA values #####

x <- c(1, 2, NA, 4, NA, 6, 7)
bad <- is.na(x) #boolean vector
x[!bad]

#with two lists, returns positions where both vectors have values
y <- c("a", "b", "c", "d", NA, "f", NA)
good <- complete.cases(x, y) #boolean vector
x[good]
y[good]

#also works in DF and matrices
df[[1]][2] <- NA #add NA to a col in 2nd row
df[[2]][3] <- NA #add NA to a col in 3rd row
complete_lines <- complete.cases(df) #boolean
df[complete_lines,] #only complete lines, all columns