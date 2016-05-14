# coursera.org - Data science specialization (Johns Hopkins)
# R programming - Week 4 lesson 2 - profiling
# Juliana Cavalcanti Correa - 04/16

# system.time elapsed > user (I/O bound)
system.time(readLines("http://www.jhsph.edu"))

# system.time elapsed < user (parallel lib)
x <- hilbert(1000)
system.time(svd(x))

#rprof

Rprof()
summaryRprof()
by.self