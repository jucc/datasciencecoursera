#coursera.org
#Computing for data analysis (Johns Hopkins)
#R programming
#Week 1 lesson 3: subsetting
#Juliana Cavalcanti Correa - 01/13 - review 04/16


# containers used in the examples below #
a <- 1:4
b <- 6:9
x <- c("a", "b", "c", "d", "e", "f");
l <- list(c(1:4), list("abc", TRUE, 1+2i), c("a", "b", "c"))
l2 <- list (foo = 1:4, bar = 0.6)
m  <- matrix(1:25, nrow = 5, ncol = 5)
m2 <- matrix(26:50), nrow = 5, ncol = 5)


##### Operations are vectorized by default #####

a > 2 # [F, F, T, T]
a + b # [7, 9, 11, 13]

m + m2   # returns element-wise sum (5x5 matrix)
m * m2   # returns element-wise multiplication (5x5 matrix)
m %*% m2 # true matrix multiplication (5x5 matrix)



##### SUBSETS #####

## Numerical index ( indices START AT ONE! )

### Using [[]] notation, only one object is returned

x[[1]] # "a" (element is a char)
l[[3]] # ["a", "b", "c"] (element is a vector)

### Using [] notation, a container of the same type of the original will be returned with the selected elements

x[3]   # returns a character vector with one element ("c")
l[2:3] # returns a list with 2 elements (a list and a vector)

# matrices are the exception
m[2, ]               # returns a vector with 5 elements (row 2)
m[, 2]               # returns a vector with 5 elements (col 2)
m[1:2,1:3]           # returns a 2x3 matrix
m[2, , drop = FALSE] # returns a 1x5 matrix (the only row is row 2) - drop preserves the geometry


## Logical index

x[x > "b"] # returns the vector ["c", "d, "e", "f"]

# same thing in two steps:

#1. create a boolean vector with results of matching elements to criteria
u <- x > "b"  # F F T T T T
#2. create a subset filtered by this boolean vector
x[u]


## Named index

l2$bar        # 0.6
l2[["bar"]]   # same as above
l2[[2]]       # still, 0.6

### partial match
l2$b                     # matches b to bar and returns 0.6
l2[["bar", exact=FALSE]] # by default, [[]] doesn't partial match


## Computed index with [[]] (the "" is implicit in the var)
index <- "bar"
l2[[index]]    # again, 0.6


## Vector index to retrieve multiple elements, how cool is that?
x[c(1, 3, 5)]     # ["a", "c", "e"]
m[c(1,3), 1:3]    # 2 rows (1 AND 3) x 3 cols (1 TO 3)
m[c(1,4), c(1,3)] # 2 rows (1 and 4) x 2 cols (1 and 3)

### Nested elements

l[[1]][3]   # 3 = third element of the first element (which is a list)
l[[c(1,3)]] # same as above

w <- list(l1 = l, l2, x)
w[[1]][[3]][[3]]  # returns "c"
w[[c(1,3,3)]]     # same as above
w$l1[[3]][[3]]    # again, mixing named index with numeric ones


##### Removing NA values #####

x <- c(1, 2, NA, 4, NA, 6, 7)
bad <- is.na(x) # returns  F F T F T F F
x[!bad]         # filters using "bad" to return [1, 2, 4, 6, 7]

# with two lists, returns positions where both vectors have values
y <- c("a", "b", "c", "d", NA, NA, NA)
good <- complete.cases(x, y) # T T F T F F F
x[good]   # [1, 2, 4]
y[good]   # [a, b, d]

#also works in DF and matrices
m[1,2] <- NA
m[2,3] <- NA
complete_lines <- complete.cases(m) # F F T T T
m[complete_lines,]   # returns a 3x5 matrix with rows 3, 4 and 5
