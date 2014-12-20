## Provides cacheSolve method to perform matrix inverse computation
## with caching. 
##
## The helper function makeCacheMatrix allows to transform a
## standard matrix into a matrix supporting caching. Note that 
## the object returned by makeCacheMatrix will use twice as
## much storage once the inverse has been set.
##
## See test_cachematrix.R for a basic usage example
##
## WARNING : behavior not defined if the matrix is not invertible

## makeCacheMatrix creates a special matrix with 
## set/get for the matrix as well as set/get for
## the matrix inverse
makeCacheMatrix <- function(x = matrix()) {
  minv <- NULL ## variable to store the inverse
  set <- function(y){ ## setter for matrix
    x <<- y
    minv <<- NULL    ## the matrix setter must reset the inverse
  }
  get <- function() x ## getter for matrix
  setinv <- function(pinv) minv <<- pinv ## setter for inverse
  getinv <- function() minv ## getter for inverse
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## This function calls solve and caches the inverse
## on first call, or retrieves the cached inverse if
## it has alreay been defined
cacheSolve <- function(x, ...) {
  pinv <- x$getinv() ## try to retrieve cached inverse
  if(!is.null(pinv)){
    message("Getting cached pseudoinverse...")
    return(pinv)
  }
  mat <- x$get()
  pinv <- solve(mat, ...)
  x$setinv(pinv)
  pinv
}
