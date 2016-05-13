## This pair of functions caches the inverse of a matrix for
## reuse to avoid multiple costly calculations where possible.

## This function caches a matrix and its inverse for later use.
makeCacheMatrix <- function(x = matrix()) {
  cmx <<- x
  cix <<- solve(x)
}

## This function returns the inverse of a matrix. If a cached 
## version is available, that is passed. If not, or if the 
## matrix passed differs from the cached version, the inverse is 
## calculated. Messages are used to indicate which criteria were met.
cacheSolve <- function(x, ...) {
  if (!is.null(cix)){
    if(identical(x, cmx)){
      message("getting cached data")
      return(cix)
    }
    message("matrix has changed")
  }
  message("calculating inverse")
  ix <- solve(x)
  ix
}
