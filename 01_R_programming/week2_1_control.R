#coursera.org
#Data science specialization
#R programming (Johns Hopkins)
#Week 2 lesson 1: control structures
#Juliana Cavalcanti Correa - 04/16


x <- c("a", "b", "c", "d")

# y = x[[2]] > "a" ? 10 : 0 
y <- if (x[[2]] > "a") { 10 } else { 0 }

# foreach
for (letter in x) { print(letter) }

# creates an index sequence (1:4) for the elements in x 
for (i in seq_along(x)) { print(paste(i , ":" , x[[i]], sep="")) }

# while, repeat, break and continue are also available, same syntax as most languages