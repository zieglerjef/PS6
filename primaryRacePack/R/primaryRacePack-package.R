#' primaryRacePack
#'
#' The primaryRacePack package calculates the number of delegates needed based on the number of delegates won and remaining.  
#' @name primaryRacePack
#' @docType package
#' @author  Jeff Ziegler: \email{jeffreyziegler@@wustl.edu} 
#' @examples 
#' 
#' newCandidate <- createCandidate("Ben Carson", 8, "Republican")
#' str(newCandidate)
#' propNeeded(newCandidate, 1396)
#' 
#' @seealso \code{\link{createCandidate}}, \code{\link{Candidate}}, \code{\link{propNeeded}}
#'
#' 
#' demo(createCandidate.R)
#' demo(propNeeded.R)
#' 
#'
NULL