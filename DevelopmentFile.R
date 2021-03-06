## Load libraries and set working directory
library(devtools)
library(roxygen2)
setwd("~/Documents/Git/Class/PS6")

# create package skelton so it can find the package root
# create package.skeleton only on first use
# package.skeleton(code_files = c("primaryRacePack-package.R", "Candidate.R", "createCandidate.R", "propNeeded.R",
#                  "createRace.R", "Race.R"), name="primaryRacePack")

# Run to create package
current.code <- as.package("primaryRacePack")
# load all functions
load_all(current.code)
# make help files
document(current.code)

# Look through the R directory to find these files

# primaryRacePackk-package.r
# Candidate.R
# createcCandidate.R
# propNeeded.R
# createRace.R
# Race.R

# Check the NAMESPACE as well

# now that everything looks okay:
# run R checks
check(current.code)
# install package
install(pkg=current.code, local=TRUE)
build(current.code, path=getwd()) 

# load package into environment
library(primaryRacePack)

### test functionality ###
# createCandidate (wrong input)
newCandidate <- createCandidate(name = "Bernie Sanders", delegatesWon = "856", party = "Democrat")
# throw error

# createCandidate (wrong input)
newCandidate <- createCandidate(name = 856, delegatesWon = 856, party = "Democrat")
# throw error

# createCandidate (wrong input)
newCandidate <- createCandidate(name = "Bernie Sanders", delegatesWon = 856, party = "Party")
# throw error

# createCandidate
newCandidate <- createCandidate(name = "Bernie Sanders", delegatesWon = 856, party = "Democrat")
# showCandidate
show(newCandidate)
print(newCandidate)

# propNeeded (missing remainingDelegates)
propNeeded(newCandidate)
# throw error

# propNeeded (too few delegates remaining)
propNeeded(newCandidate, 10)
# throw warning

# propNeeded (remainingDelegates as of 3/19/16 = 2295)
propNeeded(newCandidate, 2295)

# createRace
clinton <- createCandidate("H. Clinton", 1614, "Democrat")
sanders <- createCandidate("B. Sanders", 856, "Democrat")
demCandidates <- list(clinton, sanders)
demRace <- createRace(allCandidates = demCandidates, party = "Democrat")
plot(demRace)

trump <- createCandidate("D. Trump", 678, "Republican")
cruz <- createCandidate("T. Cruz", 423, "Republican")
rubio <- createCandidate("M. Rubio", 164, "Republican")
kasich <- createCandidate("J. Kasich", 143, "Republican")
repCandidates <- list(trump, cruz, rubio, kasich)
repRace <- createRace(allCandidates = repCandidates, party = "Republican")
plot(repRace)
