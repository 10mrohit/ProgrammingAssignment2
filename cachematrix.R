makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  ## Setting matrix
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  ## Getting matrix
  get <- function() {
    x
    ## Returning matrix
  }
  setInverse <- function(inverse) {
    i <<- inverse
    ## Setting Inverse
  }
  getInverse <- function() {
    ## Getting inverse
    m
  }
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)

}

cacheSolve <- function(x, ...) {
        ## Inverse of x returned
        m <- x$getInverse()
        if( !is.null(m) ) {
          message("getting cached data")
          return(m)
        }
        data <- x$get()
        m <- solve(data) %*% data
        x$setInverse(m)
        m      
}
