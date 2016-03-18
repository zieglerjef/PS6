#' A Candidate object 
#' 
#' Objects of class \code{Candidate} are created by the \code{addCandidate} function. Objects of
#' this class include \code{show} and \code{print} methods.
#'
#' 
#' An object of the class `Candidate' has the following slots:
#' \itemize{
#' \item \code{name} Name of the presidential candidate (character string).
#' \item \code{delegatesWon} Number of delegates won by given candidate (numeric).
#' \item \code{party} Party of given candidate, 'Republican' or 'Democratic' (character string).
#' \item \code{delegatesNeeded} Number of delegates needed by given candidate (numeric).
#' }
#'
#' @author Jeff Ziegler
#'
#' @aliases Candidate-class initialize,Candidate-method show,Candidate-method 
#' @rdname Candidate
#' @export
# construct class Candidate object
setClass(Class="Candidate",
         # specify that all inputs should be numeric
         slots = c(name = "character",
                   delegatesWon = "numeric",
                   party = "character",
                   delegatesNeeded = "numeric"
         ),
         # set default values for slots
         prototype = prototype(
           name = NULL,
           delegatesWon = numeric(),
           party = NULL,
           delegatesNeeded = numeric()
         ),
         # create validity check
         validity = function(object){
           # make sure candidate name is specified
           if(is.null(object@name)){
             stop("Please include the name of the candidate!")
           }
           # make sure candidate party is specified
           if(is.null(object@name)){
             stop("Indicate the party of the candidate: 'Republican' or 'Democrat'!")
           }
         }
)
#' @export
# create method to create object of class Candidate
setMethod("initialize", "Candidate", 
          # requires input for name, delegatesWon, and party
          function(.Object, name, delegatesWon, party){
            # assign .Object attributes to variables
            .Object@name <- name
            .Object@party <- party
            .Object@delegatesWon <- delegatesWon
            # specify delegatesNeeded by party of candidate
            if(party=="Republican"){
              # number of delegates needed for a Democratic candidate to win the primary
              .Object@delegatesNeeded <- 1237
            }
            if(party=="Democrat"){
              # number of delegates needed for a Democratic candidate to win the primary
              .Object@delegatesNeeded <- 2383
            }
            value=callNextMethod()
            return(value)
          }
) 
#' @export
# create method to show object of class Candidate
# print function should already incorporate objects of class Candidate
setMethod(f="show",
          # method for use with object of class Candidate
          signature="Candidate",
          # create function
          definition=function(object){
            # check validity
            validObject(object)
            # create matrix of values to be shown
            showCandidate <- cbind(object@name, object@delegatesWon, object@party, object@delegatesNeeded)
            # rename matrix columns
            colnames(showCandidate) <- c("Name", "Delegates Won", "Party", "Delegates Needed")
            print(showCandidate)
          }  
)