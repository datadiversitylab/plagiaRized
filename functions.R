###################
# functions.R
# 
# Need some functions for your ui logic or server?? Define em' here.
###################

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