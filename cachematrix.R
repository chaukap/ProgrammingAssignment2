## Put comments here that give an overall description of what your
## functions do

## Function that takes a matrix and its inverse and chaches them to prevent
## wasted computation.
## retireve the salues using the cacheSolve function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    m <<- NULL
    x <<- y
  }
  get <- function() {
    x
  }
  setinverse <- function(inverse) {
     m <<- inverse 
  }
  getinverse <- function() {
    m
  }
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Solves a matrix and caches the result. 
## intended for use with the makeCacheMatrix function.

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)){
    print("retrieving from cache")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m
}