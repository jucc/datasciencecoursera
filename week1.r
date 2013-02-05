#coursera.org
#Introduction to data analysis (Johns Hopkins)
#Week 1 lessons: simulation basics
#Juliana Cavalcanti Correa = 01/13

### GENERATING RANDOM VARIABLES 

#normal distribution
heights <- rnorm(n=10, mean=170, sd=15)
heights

#binomial distribution
dice <- rbinom(n=20, size=1, prob=0.5)
dice

#seed for recreating conditions
set.seed(42)
rnorm(n=10, mean=170, sd=15)
set.seed(42) #has to be set everytime!
rnorm(n=10, mean=170, sd=15)

### PROBABILITY DENSITY FUNCTION

#normal density function
x <- seq(from=0, to=10, length=11) #generate a sequence of x values
pdf <- dnorm(x, mean=5, sd=1)
round(pdf,2)
pdf <- dnorm(x, mean=5, sd=4) #fiddle with standard deviation
round(pdf,2)

pdf <- dbinom(x, size=10,prob=0.5) #flip a coin 10 times. Probability of getting x heads.
round(pdf,2)

### SAMPLE FROM GENERATED FUNCTIONS

sample(heights, size=10, replace=FALSE)#removes elem from list after picking it (no repeat)
sample(heights, size=10, replace=TRUE) #does not remove elem from list after picking it (repeat)
probs <- c(0.5,0.5,0,0,0,0,0,0,0,0) #50% chance for each of the first two, never the others
sample(heights, size=10, replace=TRUE, probs)