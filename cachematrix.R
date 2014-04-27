## The functions create a cache matrix, its inverse, and tests if the new
## matrix is identical as the one in cache, retrieves the inverse from cache
## otherwise calculates the new inverse and memorize it

## The function gets/sets the matrix value and its inverse

makeCacheMatrix <- function(x = matrix()) {
    mat <- matrix()
    set <- function(y){
        x <<- y
        mat <- matrix()
    }
    get <- function() x
    setinv <- function(solve) mat <<- solve
    getinv <- function() mat
    list(set = set, get = get,
            setinv = setinv,
            getinv = getinv)
}


## Calculates the inverse of matrix x, on ly if x has changed

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        ## Gets the inverse in cache
        mat <- x$getmat()
        ## Gets the data of matrix x
        data <- x$get()
        ## Calculates the inverse of matrix x
        mat2 <- solve(data)
        ## test if the invers "mat" from cache and "mat2" are identical
        if(identical(mat,mat2)) {
               message("getting cached data")
               return(mat)
        }
        ## if they are not identical, puts in cache the new inverse
        x$setmat(mat2)
        mat2       
}
