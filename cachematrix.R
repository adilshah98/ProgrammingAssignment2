## Put comments here that give an overall description of what your
## functions do

##Cached Matrix Inversion function
##R programming assignment 2
##Lexical Scoping

## Write a short comment describing this function
#Creating setters and getter so that 
#inverse matrix forms cache instead of recalculations

makeCacheMatrix <- function(x = matrix()) {
  # initialize the inverse to NULL
  inv <- NULL
  
  # setting a set for matrix
  set <- function(mtrx) {
    mat <<- mtrx
    inv <<- NULL
  }
  
  # a getter for matrix
  get <- function() mat
  
  # setter for the inverse
  set.inverse <- function(setinv) inv <<- setinv
  
  # getter for the inverse
  get.inverse <- function() inv
  
  # this returns a setter and getter function
  list(set = set, get = get,
       set.inverse = set.inverse,
       get.inverse = get.inverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  # get the stored inverse
  inv <- cached.mat$get.inverse()
  # if it exists return it
  if(!is.null(inv)) {
    message("getting cached inverse")
    return(inv)
  }
  # else calculate, store and return it
  raw.mat <- cached.mat$get()
  inv <- solve(raw.mat, ...)
  cached.mat$set.inverse(inv)
  
  # returns the inverse
  inv
}
