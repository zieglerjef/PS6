#' Create an object of class 'Candidate'
#'
#' Function creates an object of class `Candidate' and determines the number of
#' delegates the candidate needs to win their party's presidential nomination.
#'
#' @param name Name of the presidential candidate (character string). 
#' @param delegatesWon Number of delegates won by given candidate (numeric).
#' @param party Party of given candidate, 'Republican' or 'Democratic' (character string).
#'
#' @return An object of class `Candidate' containing
#' \itemize{
#'  \item{name} The name of a presidential candidate.
#'  \item{delegatesWon} The number of delegates the presidential candidate has won. 
#'  \item{party} The party of the presidential candidate, either `Democratic' or `Republican'.
#'  \item{delegatesNeeded} The number of delegates the presidential candidate needs to secure to win 
#'  his party's nomination. This is automatically determined through the initialize method called when
#'  a new instance of the class `Candidate' is created.
#'  }
#' @author Jeff Ziegler
#' @examples
#' 
#' newCandidate <-createCandidate("Martin O'Malley", 0, "Democratic") 
#' newCandidate <- createCandidate("Ben Carson", 8, "Republican") 
#' 
#' @seealso \code{\link{Candidate}}
#' @rdname createCandidate
#' @aliases createCandidate,ANY-method
#' @export
# create generic for method of createCandidate
setGeneric(name = "createCandidate",
           def=function(name, delegatesWon, party)
           {standardGeneric("createCandidate")}
)

# create method to generate object of class Candidate
setMethod(f="createCandidate",
          definition=function(name, delegatesWon, party){
            # return object of class Candidate
            return(new("Candidate", name = name, delegatesWon = delegatesWon, party = party))
          }
)