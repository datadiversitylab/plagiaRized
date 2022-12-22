library(diffr)
library(diffobj)
files <- list.files(recursive = T, pattern = "Conceptual.Rmd")
files <- list.files(recursive = T, pattern = "Applied.Rmd")

expand.grid.unique <- function(x, y, include.equals=FALSE){
  x <- unique(x)
  
  y <- unique(y)
  
  g <- function(i)
  {
    z <- setdiff(y, x[seq_len(i-include.equals)])
    
    if(length(z)) cbind(x[i], z, deparse.level=0)
  }
  
  do.call(rbind, lapply(seq_along(x), g))
}
comp <- expand.grid.unique(x= files, y =files)

differences <- sapply(1:nrow(comp), function(x){
length(ses(readLines(comp[x,1]), readLines(comp[x,2])))
})

comp <- cbind.data.frame(comp, differences)


x= 75
diffr(comp[x,1], comp[x,2])

