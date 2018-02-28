## Week 3 Programming Assignment
## Caching the inverse of a matrix, assuming that the matrix supplied is always invertible.


## Creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix())
{
 i <- NULL

 set <- function(y)
 {
        x <<- y
        i <<- NULL
 }

 get <- function() x
 setinverse <- function(inverse) i <<- inverse
 getinverse <- function() i
 list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}



## Computes the inverse of the special "matrix" returned by makeCacheMatrix. If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...)
{
 i <- x$getinverse()

 if(!is.null(i))
 {
  print("Retrieving cached data")
  return(i)
 }

 cacheddata <- x$get()
 i <- solve(cacheddata)
 x$setinverse(i)
 return(i)
}


## Use this code to test the functions 
t <- matrix(c(1:4), 2 ,2)
u <- makeCacheMatrix(t)
cacheSolve(u)