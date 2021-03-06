% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Race.R
\docType{class}
\name{Race-class}
\alias{Race-class}
\alias{initialize,Race-method}
\alias{plot,Race-method}
\title{A Race object}
\description{
Objects of class \code{Race} are created by the \code{addRace} function. Objects of
this class only contain objects of class \code{Candidate} and include a \code{plot} methods.
}
\details{
An object of the class `Race' has the following slots:
\itemize{
\item \code{allCandidates} Object(s) of class 'Candidate'. Candidates should all 
be from the same political party (list).
\item \code{party} Party of candidates, 'Republican' or 'Democratic' (character string).
\item \code{delegatesNeeded} Number of delegates needed by given candidate (numeric).
\item \code{delegatesRemaining} Number of delegates not yet allocated in a given party primary (numeric).
}
}
\examples{
clinton <- createCandidate("H. Clinton", 1614, "Democrat")
sanders <- createCandidate("B. Sanders", 856, "Democrat")
demCandidates <- list(clinton, sanders)
demRace <- createRace(allCandidates = demCandidates, party = "Republican")
plot(x = demRace)

}
\author{
Jeff Ziegler
}
\seealso{
\code{\link{createRace}}, \code{\link{createCandidate}}, \code{\link{Candidate}}
}

