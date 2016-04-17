# getting packages from CRAN
a <- available.packages()
head(rownames(a), 10)

# installing from CRAN is also available as gui at rstudio>tools
install.packages(c("ggplot2", "devtools", "slidify"))

# installing from bioconductor

source("http://bioconductor.org/biocLite.R") 
# get the basic installer and basic set of R packages
biocLite()
# install selected packages
biocLite(c("GenomicFeatures", "AnnotationDbi"))

# import the installed package
library(ggplot2)
# functions exported will be attached to the top of the list
search() 

