#' Calculate the proportion of delegates a given candidate needs to win nomination
#' 
#' Function determines the proportion of remaining delegates a presidential candidate needs 
#' to secure in order to win his party's nomination.
#'
#' @param object An object of the class 'Candidate'.
#' @param remainingDelegates Number of delegates not yet allocated in a given candidate's party primary (numeric).
#' #'
#' @return A numeric object denoting the proportion of the delegates yet to be allocated that a 
#' presidential candidate must secure in order to win his party's nomination.
#' 
#' @author Jeff Ziegler
#' @examples
#' 
#' newCandidate <- createCandidate("John Kasich", 143, "Republican")
#' propNeeded(newCandidate)
#' propNeeded(newCandidate, 1396) 
#' 
#' @seealso \code{\link{createCandidate}}, \code{\link{Candidate}}
#' @rdname propNeeded
#' @aliases propNeeded,ANY-method
#' @export
# create generic function that executes method 
setGeneric(name = "propNeeded",
           # set default remaining delegates as of March, 17 (1396)
           def = function(object, remainingDelegates=1396){
             # check validity
             validObject(object)
             # make sure remaining is entered correctly
             if(!is.numeric(remainingDelegates)){
               stop("remainingDelegates must be numeric!")
             }
             standardGeneric("propNeeded")
           }
)

# create new method propNeeded
setMethod(f="propNeeded", 
          # create function
          definition = function(object, remainingDelegates) {
            # calculate proportion of remaining delegates needed to win
            delegateProp <- (object@delegatesNeeded - object@delegatesWon) / remainingDelegates
            # make sure candidate is not essentially eliminated already
            if(delegateProp > 1){
              stop("The number of delegates needed exceeds the number available.")
            }
            else{
              print(delegateProp)
            }
          }
)