## an R function that is able to cache potentially time-consuming computations such as a very long vector. In cases like that it may take too long to compute statistics like the inverse of a Matrix, especially if it has to be computed repeatedly (e.g. in a loop). However, if the contents of the object are not changing, it may make sense to cache the value of the object so that when we need it again, it can be looked up in the cache rather than recomputed 

## creates an R object that stores an Matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {m <- NULL
set <- function(y) {
        x <<- y ## assign the input matrix y to the variable x in the parent environment
        m <<- NULL ## re-initialize m in the parent environment to null
}
get <- function() x ## return the matrix x
setinverse <- function(inverse) m <<- inverse ## set the cache m equal to the inverse of the matrix x
getinverse <- function() m ## return the cached inverse of x
list(set = set, get = get, setinverse = setinverse,getinverse = getinverse)

}

## Return a matrix that is the inverse of 'x'
## First, retrieves the inverse from the cached value that is stored in the makeCacheMatrix() object's environment by checking whether the inverse has already been caclulated and thus skipping computation.

cacheSolve <- function(x, ...) {

        m <- x$getinverse() 
                if(!is.null(m)) {
        message("getting cached data")
        return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setinverse(m)
m 
        
}
