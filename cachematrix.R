## makeCacheMatrix retuns a list of functions.  The functions set and get matrix values.  There is another set of fucntions that get
## and set the inverse of the matrix.  cacheSolve uses the list from makeCacheMatrix and checks to see if a inverse of the matrix
## has already be calculated.  If not, the matrix inverse is calculated and set.

## This function establishes a set of functions that are returned as a list.  The list that is returned is intended to be the input
## for cacheSolve.

makeCacheMatrix <- function(x = matrix()){
m <- NULL
set <- function(y) {
x <<- y
m <<- NULL
}
get <- function() x
setSolve <- function(solve) m <<- solve
getSolve <- function() m
list(set = set, get = get, setSolve = setSolve, getSolve = getSolve)
}


## This functions takes in the list of functions from makeCacheMatrix.  It tests to see if an inverse value of the matrix exists
## already.  If it does it uses the cached value otherwise it calculates it.

cacheSolve <- function(x, ...) {
m <- x$getSolve ()
if(!is.null(m)) {
message("getting cached data")
return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setSolve(m)
return(m)
}
