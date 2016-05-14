# coursera.org - Data science specialization (Johns Hopkins)
# R programming - Week 4 lesson 1 - simulation
# Juliana Cavalcanti Correa - 04/16


set.seed(1) # allows the random sequences to be reproduced

## generating random variables

# generates 10 random values following a normal distribution with mean 0 and stdv 1
x <- rnorm(10) 
summary (x)       # confirm mean and stdv

# generates 10 random values following a normal distribution with mean 20 and stdv 2
x <- rnorm(10, 20, 2) 
summary (x)       # confirm mean and stdv

# generates 10 random values following a poisson distribution with rate 2
x <- rpois(10, 2) 
summary(x)        # mean ~ 2


# generates 10 random values following a bionmial distribution with n=1 and p=0.5 (p(xi=1) = 0.5 )
x <- rbinom(10, 1, 0.5)
summary(x)        # mean ~0.5


## cumulative distribution

ppois(2, 2) # P (x <= 2 with a variable of rate 2 = 0.677)
ppois(4, 2) # P (x <= 4 with a variable of rate 2 = 0.947)


## generating random numbers from linear models

x <- rnorm(100)
e <- rnorm(100, 0 , 2) 
y <- 0.5 + 2 * x + e
plot(x, y)

x <- rnorm(100)
log.mu <- 0.5 + 0.3*x
y <- rpois(100, exp(log.mu))
summary(y)

## random sampling

# sample randomly without replacement from a vector
sample(1:10, 4)  # returns 4 random numbers between 1 and 10

# sample randomly with replacement possible
sample(1:10, 7, replace = TRUE)  # returns 4 random numbers between 1 and 10

# without the second parameter, returns a permutation of the vector
sample(1:10)