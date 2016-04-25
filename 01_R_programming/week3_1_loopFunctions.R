# coursera.org - Data science specialization (Johns Hopkins)
# R programming - Week 3 lesson 1 - loop functions
# Juliana Cavalcanti Correa - 04/16


## lapply

# lapply inputs are coerced into lists (in this case, they were vectors coerced into lists)
# lapply output is always a list of the results of applying the function to each element in the input

l <- list (a = 1:5, b = 10:15, c = rnorm(50), d = rnorm(50))  
lapply (l, mean)  # returns a list with the means of each vector ([3, 12.5, 0.***, 0.***])

x <- 1:4 
lapply (x, runif, min = 0, max = 10) # generates a list of vectors containing 1, 2, 3 and 4 random variables

## anonymous functions

matrixlist <- list( a = matrix(1:25, 5, 5), b = matrix(26:40, 5, 3) )
lapply(matrixlist, function(elem) elem[,1]) # anonymous function retrieves the first column of each element


## sapply is the same as lapply but tries to "simplify" the results

sapply(l, mean)  # returns a vector instead of a list, because every result has only 1 element
sapply(matrixlist, function(elem) elem[,1]) # returns a matrix (5x2) because every result has the same length


## apply - evaluates a function over the margins of an array (usually rows or columns of a matrix)

# "keeps" the specified dimension while collapsing other dimensions 
m <- matrix (rnorm(200), 20, 10) # random matrix 20x10
apply(m, 2, mean) # dim 2 =  keeps columns and collapses rows -> returns array of 10 elements
apply(m, 1, mean) # dim 2 =  keeps rows and collapses columns -> returns array of 20 elements

# specifying more than one dimension to keep as a vector
d3 <- array(rnorm(2*2*10), c(2, 2, 10)) # can be visualized as an array of 10 2x2 matrices
apply(d3, c(1,2), mean)  # returns a 2x2 matrix with the result of the mean acrossthe 10 matrices for each element 

# shortcuts
colSums(m) # equivalent to using apply(m, 2, sum). Same goes for rowMeans, colSums and colMeans


## mapply - applies functions to multiple objects

# mapply can be used to vectorize functions that don't accept vector args

list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))

# does the same as above calling rep for every element of the first list and the second list as arguments
# arguments are passed with "..." and used as aguments of the function (coerced into lists)
mapply (rep, 1:4, 4:1) 


## tapply applies functions to subsets 

vec <- c(rnorm(100), runif(100), rnorm(100, 1)) # a vector with three "groups" - normals, uniforms, normals with mean 1
levels <- gl(3, 100)                            # factor variable with the categories - 3 levels with 100 elements each
tapply(vec, levels, mean, simplify=TRUE)   # returns the mean for each group
tapply(vec, levels, range, simplify=FALSE) # returns a list where each element is the range of one of the groups


## split

split(vec, levels)                # returns 3 separate lists
lapply (split(vec, levels), mean) # same as tapply above, splits into groups an lapply to all of them

months <- split(airquality, airquality$Month) # returns a separate df for each month. 
# Even though airquality$month is not a factor variable, it can be coerced into it because it's categorical

sapply(months,               # returns the means of all columns for each month
       function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))

# splitting on more than one level

x <- rnorm(10)
factor1 <- gl(2, 5)  # 2 levels with 5 elements each
factor2 <- gl(5, 2)  # 5 levels with 2 elements each

allfactors <- interaction(factor1, factor2) # combines levels to create a new factor with 10 different levels

split(x, allfactors)            # returns all 10 lists, one for each combination of factors
split(x, allfactors, drop=TRUE) # returns only the lists that contain observations