#' A Race object 
#' 
#' Obects of class \code{Race} help summarize the standing of the current presidential races. These
#' objects have their own \code{plot} method.
#'
#' 
#' An object of the class `Race' has the following slots:
#' \itemize{
#' \item \code{candidates} A list of objects of class `Candidate'. These candidates should all 
#' be from the same political party.
#' \item \code{party} The party of the presidential candidates listed in candidates, either 
#' `Democratic' or `Republican'.
#' \item \code{delegatesNeeded} The number of delegates the presidential candidate needs to 
#' secure to win his party's nomination.
#' \item \code{delegatesRemaining} The number of delegates that have yet to be allocated to a 
#' candidate. 
#' }
#' 
#' @examples
#' cruz <- new("Candidate", name="Cruz", delegatesWon=372, party="Republican")
#' trump <- new("Candidate", name="Trump", delegatesWon=464, party="Republican")
#' kasich <- new("Candidate", name="Kasich", delegatesWon=63, party="Republican")
#' rubio <- new("Candidate", name="Rubio", delegatesWon=166, party="Republican")
#' republican.candidates <- list(cruz, trump, kasich, rubio)
#' republican.race <- new("Race", candidates=republican.candidates, party="Republican")
#' plot(x=republican.race)
#' 
#' @seealso \code{\link{createCandidate}}, \code{\link{Candidate}}
#'
#' @author Andy Stone: \email{arstone@@wustl.edu}
#' @aliases Race-class initialize,Race-method plot,Race-method 
#' @rdname Race
#' @export
Race <- setClass(Class="Race", 
                 slots = c(
                   candidates = "list",
                   party = "character", 
                   delegatesNeeded = "numeric",
                   delegatesRemaining = "numeric"
                 ),
                 prototype = prototype(
                   candidates = list(),
                   party = "",
                   delegatesNeeded = numeric(),
                   delegatesRemaining = numeric()
                 )
)


#' @export
setMethod("initialize", "Race", 
          function(.Object, candidates, party){
            .Object@candidates <- candidates
            .Object@party <- party
            if(party=="Republican"){
              alloted <- sum(sapply(1:length(candidates), FUN=function(i) candidates[[i]]@delegatesWon))
              .Object@delegatesRemaining <- 2472 - alloted
              .Object@delegatesNeeded <- 1237
            }
            if(party=="Democratic"){
              alloted <- sum(sapply(1:length(candidates), FUN=function(i) candidates[[i]]@delegatesWon))
              .Object@delegatesRemaining <- 4765 - alloted
              .Object@delegatesNeeded <- 2383
            }
            if(party!="Democratic" & party!="Republican"){
              stop("Please specify the party properly with either the string 'Democratic' or 'Republican'")
            }
            value=callNextMethod()
            return(value)
          }
) 

#' @export
setMethod(f="plot",
          # Class the method is used for
          signature="Race",
          # The method itself
          definition=function(x=NULL, y=x, ...){
            plot(x=NULL,
                 y=NULL,
                 xaxt="n",
                 xlim=c(0, length(x@candidates)),
                 ylim=c(0, max((x@delegatesRemaining + 100), (x@delegatesNeeded + 100))), 
                 xlab="Candidates",
                 ylab="Delegates Won", 
                 main=paste("Delegate Count:", x@party, "Party", sep=" "), 
                 cex.main=1)
            if(x@party == "Democratic"){
              colors <- c("deepskyblue","deepskyblue4")
            } 
            if(x@party == "Republican"){
              colors <- c("red1","red2","red3","red4")
            }
            points(1:length(x@candidates) - 0.5, sapply(1:length(x@candidates), 
                                                        FUN=function(i) x@candidates[[i]]@delegatesWon), pch=c(16:19), col=colors)
            names <- sapply(1:length(x@candidates), 
                            FUN=function(i) x@candidates[[i]]@name)
            axis(side=1, labels=names, at=1:length(x@candidates) - 0.5)
            abline(h=x@delegatesNeeded, lty=2)
            abline(h=x@delegatesRemaining, lty=2)
            
            text(length(x@candidates) - 0.5, x@delegatesNeeded - (x@delegatesNeeded / 9), 
                 labels="Delegates Needed \n for Nomination", cex=0.7)
            arrows(x0=length(x@candidates) - 0.5, y0=x@delegatesNeeded - 135, 
                   x1 = length(x@candidates) - 0.8, y1 = x@delegatesNeeded-10,
                   length=0.1)
            arrows(x0= 0.5, y0=x@delegatesRemaining - 135, 
                   x1 = 0.8, y1 = x@delegatesRemaining-10,
                   length=0.1)
            text(0.5, x@delegatesRemaining - (x@delegatesRemaining / 9), 
                 labels="Delegates Yet \n to Be Allocated", cex=0.7)
          }   
)
