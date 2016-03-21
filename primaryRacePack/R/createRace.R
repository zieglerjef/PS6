#' Create an object of class 'Race'
#'
#' Function creates an object of class 'Race' and plots the (1) number of delegates won
#' and (2) the number of delegates need to win the party nomination for each candidate
#'
#' @param name Name of the presidential candidate (character string). 
#' @param party Party of given candidates, 'Republican' or 'Democrat' (character string).
#'
#' @return An object of class 'Race' containing
#' \itemize{
#' \item allCandidates Object(s) of class 'Candidate'. Candidates should all 
#' be from the same political party (list).
#' \item party Party of candidates, 'Republican' or 'Democrat' (character string).
#' \item delegatesNeeded Number of delegates needed by given candidate (numeric).
#' Automatically determined when method is initialized with creation of a new instance of the class 'Race'.
#' \item delegatesRemaining Number of delegates not yet allocated in a given party primary (numeric).
#' Automatically determined when method is initialized with creation of a new instance of the class 'Race'.
#' }
#' @author Jeff Ziegler
#' @examples
#' 
#' clinton <- createCandidate("H. Clinton", 1614, "Democrat")
#' sanders <- createCandidate("B. Sanders", 856, "Democrat")
#' demCandidates <- list(clinton, sanders)
#' demRace <- createRace(allCandidates = demCandidates, party = "Democrat")
#' plot(x = demRace)
#' 
#' @seealso \code{\link{Race}}
#' @rdname createRace
#' @aliases createRace,ANY-method
#' @export
# create generic for method of createRace
setGeneric(name = "createRace",
           def=function(allCandidates, party)
           {standardGeneric("createRace")}
)

# create method to generate object of class Race
setMethod(f="createRace",
          definition=function(allCandidates, party){
            # return object of class createRace
            return(new("Race", allCandidates = allCandidates, party = party))
          }
)