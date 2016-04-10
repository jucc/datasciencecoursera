#coursera.org
#Computing for data analysis (Johns Hopkins)
#R programming 
#Week 1 lesson 2: reading and writing data
#Juliana Cavalcanti Correa - 01/13 - review 04/16


#read.table and read.csv differ by default separator: comma or space
#do not use them if dataset is so large that does not fit RAM
#set comment.char="" if there are no comments (helps performance)

df <- read.table("/home/ju/workspace/pdf_table/rank2012", skip=8, sep=":", comment.char='')

#figures out the classes with a few lines
classes <- sapply(df, FUN=class)


#textual formats store metadata, but lose readability
#better for versioning and generating reusable output

#dput and dget store and read into a single new object

w <- data.frame(a=1:5, b=c("a","b","c","d","e"))
dput(w) #structure stores all metadata about df, etc
dput(w, file="dput.R") 
r <- dget("write.R") 

#dump can be used to store and reconstruct multiple R objects

x <- "foo"
dump (c("x","w"), file="dump.R") #saves the objects
rm(x, w) #delete them from workspace
ls()
source("dump.R")
w

# connections can be used to navigate files

con <- file("/home/ju/workspace/pdf_table/rank2012")
df <- readLines(con, 15)
close(con)

con <- url("http://www.jhsph.edu", "r")
w <- readLines(con)
head(w)


# str function

str(ls)
str(f)
summary(f)

library(datasets)
head(airquality)
str(airquality)

m <- matrix(rnorm(100), 10, 10)
str(m) #shows dimensions and first elems in first column

w <- split(airquality, airquality$Month)
str(w)
