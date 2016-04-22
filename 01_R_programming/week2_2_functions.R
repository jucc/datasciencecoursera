# coursera.org - Data science specialization (Johns Hopkins)
# R programming - Week 2 lesson 2 - functions
# Juliana Cavalcanti Correa - 04/16


columnMean <- function(m, removeNA = TRUE) { # arguments can have default values
    nc <- ncol(m)
    means <- numeric(nc)
    for (i in 1:nc) {
        means[i] <- mean(m[,i], na.rm = removeNA)
    }
    means # function returns the value of the last expression
}

# using default argument for removeNA
columnMean(airquality) 
# argument matching can be positional or by name. 
columnMean(airquality, FALSE) 
# partial matching on the argument name is allowed (useful for interactive work)
# non named arguments will be assigned to the first argument not yet specified
# priority: 1 = exact match, 2 = partial match, 3 = positional
columnMean(r = FALSE, airquality) 


# Because of lazy evaluation, only arguments that are actually used in the function are required
f <- function(a, b){
    a**2
}
f(3) # returns 9, and does not complain about lack of b  


# "..." represents other arguments that are accepted for inner functions
myplot <- function(x, y, type="l", ...) { 
    plot(x, y, type=type, ...)
}

# "..." is also used when an unknown number of arguments is accepted, such as in paste() function
args(paste) 

# free variables are searched for in the environment in which the function was called and its parent envs

# in this case, the function f and the free variable z are both defined in the global environment
z <- 3
f <- function(x, y) {
    x**2 + y/z
}
f(2, 3)

# in this case, the function pow and the free variable n are defined inside the function make.power
make.power <- function(n) {
    pow <- function(x) {
        x**n
    }
    pow
}
cube <- make.power(3)
square <- make.power(2)
cube(2)   # 8
square(4) # 16

#view objects and values inside environments
ls(environment(cube))       # "n", "pow"
get("n", environment(cube)) # 3
ls(environment(square))       # "n", "pow"
get("n", environment(square)) # 2

# in lexical scoping, free variables are looked up in the envirmnment where the function is DEFINED
# in dynamic scoping, free variables are looked up in the envirmnment where the function is CALLED
y <- 10              # with lexical scoping, this IS the value of y for g
g <- function(x) {   
    x*y               
}
f <- function(x) {
    y <- 2            # with dynamic scoping, this WOULD BE the value of y for g   
    y**2 + g(x)
}
f(3)                 # since scoping is lexical in R, y = 10 in g, and this returns 34

###  consequences of lexical scoping: ###
#    all objects must be stored in memory
#    all functions must carry a pointer to its environment


## DATES ##

# Dates use the DAte class
d <- as.Date("1983-10-01") 
unclass(d)   # number of days since 1970-01-01

# Times use the POSIXct and POIXlt classes
now = Sys.time()      
pnow = as.POSIXlt(now)
pnow$sec

# Strings can be coerced into dates and times
datestring <- c("Outubro 01, 1983 14:15", "Julho 23, 2010 18:00")
?strptime # shows the options
dates <- strptime(datestring, "%B %d, %Y %H:%M") # converts datestring to a date

# operations in time classes
manuDaysNow <- now - dates[2]  # Time difference of 9792.156 days
juDaysNow   <- now - dates[1] 
as.numeric(manuDaysNow) / as.numeric(juDaysNow)
