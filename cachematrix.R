## This pair of functions create a wrapper matrix object that caches its inverse.
## Use matrixWrapper<-makeCacheMatrix(x) to create the matrix object
## Use cacheSolve(matrixWrapper) to get the inverse
## WARNING:
## There is no type checking or error handling, so get all your inputs in order!

##makeCacheMatrix creates a matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(y) {
        matr <<- y
        inverse <<- NULL
    }
    get <- function() x
    setinverse <- function(newInverse) inverse <<- newInverse
    getinverse <- function() inverse
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


##cacheSolve computes the inverse of the special matrix,
##  if already calculated then retrieve from cache

cacheSolve <- function(x, ...) {
    inverse <- x$getinverse()
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    data <- x$get()
    inverse <- solve(data) #Note: this is really all we had to change from the mean example
    x$setinverse(inverse)
    inverse
}
