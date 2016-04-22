# coursera.org - Data science specialization (Johns Hopkins)
# R programming - Week 3 lesson 1 - loop functions
# Juliana Cavalcanti Correa - 04/16

## lapply

# lapply inputs are coerced into lists (in this case, they were vectors coerced into lists)
# lapply output is always a list of the results of applying the function to each element in the input

l <- list (a = 1:5, b = 10:15, c = rnorm(50), d = rnorm(50))  
lapply (l, mean)  # returns a list with the means of each vecotr ([3, 12.5, 0.***, 0.***])

x <- 1:4 
lapply (x, runif, min = 0, max = 10) # generates a list of vectors containing 1, 2, 3 and 4 random variables

## anonymous functions

matrixlist <- list( a = matrix(1:25, 5, 5), b = matrix(26:40, 5, 3) )
lapply(matrixlist, function(elem) elem[,1]) # anonymous function retrieves the first column of each element

## sapply is the same as lapply but tries to "simplify" the results

sapply (l, mean)  # returns a vector instead of a list, because every result has only 1 element
sapply(matrixlist, function(elem) elem[,1]) # returns a matrix (5x2) because every result has the same length