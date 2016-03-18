\name{Candidate-class}
\Rdversion{1.1}
\docType{class}
\alias{Candidate-class}
\alias{initialize,Candidate-method}
\alias{show,Candidate-method}

\title{Class \code{"Candidate"}}
\description{
%%  ~~ A concise (1-5 lines) description of what the class is. ~~
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("Candidate", name, delegatesWon, party)}.
%%  ~~ describe objects here ~~ 
}
\section{Slots}{
  \describe{
    \item{\code{name}:}{Object of class \code{"character"} ~~ }
    \item{\code{delegatesWon}:}{Object of class \code{"numeric"} ~~ }
    \item{\code{party}:}{Object of class \code{"character"} ~~ }
    \item{\code{delegatesNeeded}:}{Object of class \code{"numeric"} ~~ }
  }
}
\section{Methods}{
  \describe{
    \item{initialize}{\code{signature(.Object = "Candidate")}: ... }
    \item{show}{\code{signature(object = "Candidate")}: ... }
	 }
}
\references{
%%  ~~put references to the literature/web site here~~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%%  ~~objects to See Also as \code{\link{~~fun~~}}, ~~~
%%  ~~or \code{\linkS4class{CLASSNAME}} for links to other classes ~~~
}
\examples{
showClass("Candidate")
}
\keyword{classes}
