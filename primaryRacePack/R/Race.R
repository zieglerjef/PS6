#' A Race object 
#'
#'
#' Objects of class \code{Race} are created by the \code{addRace} function. Objects of
#' this class only contain objects of class \code{Candidate} and include a \code{plot}.
#' 
#' An object of the class `Race' has the following slots:
#' \itemize{
#' \item \code{allCandidates} Object(s) of class 'Candidate'. Candidates should all 
#' be from the same political party (list).
#' \item \code{party} Party of candidates, 'Republican' or 'Democrat' (character string).
#' \item \code{delegatesNeeded} Number of delegates needed by given candidate (numeric).
#' \item \code{delegatesRemaining} Number of delegates not yet allocated in a given party primary (numeric).
#' }
#' 
#' @examples
#' clinton <- createCandidate("H. Clinton", 1614, "Democrat")
#' sanders <- createCandidate("B. Sanders", 856, "Democrat")
#' demCandidates <- list(clinton, sanders)
#' demRace <- createRace(allCandidates = demCandidates, party = "Democrat")
#' plot(x = demRace)
#' 
#' @seealso  \code{\link{createRace}}, \code{\link{createCandidate}}, \code{\link{Candidate}}
#'
#' @author Jeff Ziegler
#' @aliases Race-class initialize,Race-method plot,Race-method 
#' @rdname Race
#' @export
# construct class Race object
setClass(Class="Race", 
                 # specify input classes
                 slots = c(
                   # input of objects of class Candidate
                   allCandidates = "list",
                   party = "character", 
                   delegatesNeeded = "numeric",
                   delegatesRemaining = "numeric"
                 ),
                 # specify default values
                 prototype = prototype(
                   allCandidates = NULL,
                   party = NULL,
                   delegatesNeeded = numeric(),
                   delegatesRemaining = numeric()
                 ),
                 # create validity check
                 validity = function(object){
                   # make sure candidate names are specified
                   if(is.null(object@allCandidates)){
                     stop("Please include the candidates!")
                   }
                   # make sure candidate party is specified
                   if(object@party != "Republican" & object@party != "Democrat"){
                     stop("Indicate the party of the candidates: 'Republican' or 'Democrat'!")
                   }
                 }
)
#' @export
# create method to create object of class Race
setMethod("initialize", "Race", 
          function(.Object, allCandidates, party){
            .Object@allCandidates <- allCandidates
            .Object@party <- party
            # the number of delegates won by all the candidates thus far
            totalWon <- sum(sapply(1:length(allCandidates), FUN=function(i) allCandidates[[i]]@delegatesWon))
            # calculate remaining delegates: Republican
            if(.Object@party=="Republican"){
              .Object@delegatesRemaining <- 2472 - totalWon
              .Object@delegatesNeeded <- 1237
            }
            # calculate remaining delegates: Democrat
            if(.Object@party=="Democrat"){
              .Object@delegatesRemaining <- 4765 - totalWon
              .Object@delegatesNeeded <- 2383
            }
            value=callNextMethod()
            return(value)
          }
) 
#' @export
# create plot method for object of class Race
setMethod(f="plot",
          # method for use with object of class Race
          signature="Race",
          # create function
          definition=function(x=NULL, y=x, ...){
            # check validity
            validObject(x)
            # create delegates won for each candidate
            delegatesWon <- sapply(1:length(x@allCandidates), FUN=function(i) x@allCandidates[[i]]@delegatesWon)
            # create delegates needed to win for each candidate
            delegatesNeeded <- sapply(1:length(x@allCandidates), FUN=function(i) x@allCandidates[[i]]@delegatesNeeded - x@allCandidates[[i]]@delegatesWon)
            # combine delegatesWon and delegatesNeeded
            plotData <- cbind(delegatesWon, delegatesNeeded)
            # create labels for each candidate
            candidateNames <- sapply(1:length(x@allCandidates), FUN=function(i) x@allCandidates[[i]]@name)
            rownames(plotData) <- candidateNames
            # create color scheme
            if(x@party == "Democrat"){
              colors <- c("blue","white")
            } 
            if(x@party == "Republican"){
              colors <- c("red","white")
            }
            # open bar plot
            barplot(t(plotData), beside=T,
                    main=paste(x@party, "Presidential Primary Delegate Count"), ylab="Number of Delegates", xlab = "Candidates",
                    ylim=c(0, max(x@allCandidates[[1]]@delegatesNeeded, x@allCandidates[[1]]@delegatesWon) + 200), col = colors)
            # add line showing how many delegates remaining in primary
            abline(h = x@delegatesRemaining, lty = 3)
            # add legend
            legend("topright", legend = c("Delegates Won","Delegates Needed"), fill = colors, bty="n", ncol=1)
          }
)
