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

sample(heights, size=10, replace=TRUE) #does not remove elem from list after picking it (repeat)
sample(heights, size=10, replace=FALSE)#removes elem from list after picking it (no repeat)
probs <- c(0.5,0.5,0,0,0,0,0,0,0,0) #50% chance for each of the first two, never the others
sample(heights, size=10, replace=TRUE, probs)

pop <- 1:10

#convenience sample
probs <- c(5,5,5,5,5,1,1,1,1,1)/30
sample(pop, size=4, replace=FALSE,prob=probs)

#randomized trial
treat1 <- sample(1:5, size=3, replace=FALSE)
treat2 <- sample(6:10, size=3, replace=FALSE)
c(treat1, treat2)


### QUIZ ###

#Question 3
set.seed(31);
heightsCM = rnorm(30,mean=188, sd=5);
weightsK = rnorm(30,mean=84,sd=3); 
hasDaughter = sample(c(TRUE,FALSE),size=30,replace=T); 
dataFrame = data.frame(heightsCM,weightsK,hasDaughter); 
dataFrameSubset <- dataFrame[heightsCM > 188, c(1:3)]
mean(dataFrameSubset$weightsK)

#Question 4
set.seed(41)
cauchyValues <- rcauchy(100)
set.seed(415)
sample(cauchyValues, size=10, replace=TRUE)
