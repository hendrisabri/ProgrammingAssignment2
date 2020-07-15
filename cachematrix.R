## Put comments here that give an overall description of what your
## functions do
## cachematrix.R consists of two functions that are dependent on
## one another. The first function creates sub-functions of setters
## and getters, which are to either set a new matrix, or get an
## already created one, that is store in the cache. The second
## function executes the sub-functions in the first one if there
## is no cached matrix, or retrieve one if already cached.

## Write a short comment describing this function
## This function first initializes two objects (x and in) which
## are going to store the matrix and its inverse. set is used
## if there is already a cached matrix, but it is to be overwritten
## with a new matrix and a new inverse is to be created (in setinv).
## get, as the name implies, acquire the matrix, when needed.
## Likewise, getinv is to acquire the inverse.

makeCacheMatrix <- function(x = matrix()) {
        in <- NULL
        set <- function(y) {
                x <<- y
                in <<- NULL
        }
        get <- function() x
        setinv <- function(inv) in <<- inv
        getinv <- function() in
        list(set = set, get = get,
              setinv = setinv,
              getinv = getinv)
}


## Write a short comment describing this function
## The if function in cacheSolve is to check if there is already a cached
## matrix inversed. If one is present, the cacheSolve simply returns it.
## Otherwise, the function executes functions defined in makeCacheMatrix
## to create an inverse of the matrix presented as the function argument.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        in <- x$getinv()
if(!is.null(in)) {
        message("getting cached data")
        return(inv)
}
data <- x$get()
in <- solve(data, ...)
x$setinv(in)
in
}
