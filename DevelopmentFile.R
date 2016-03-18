## Load libraries and set working directory
library(devtools)
library(roxygen2)
setwd("~/Google Drive/Washu/Spring2016/appliedStats/problemSets/PS6/primaryRacePack-package")

# create package skelton so it can find the package root
package.skeleton(code_files = c("primaryRacePack-package.R", "Candidate.R", "createCandidate.R", "propNeeded.R"),
                 name="primaryRacePack")

# Run to create package
current.code <- as.package("primaryRacePack")
load_all(current.code)
document(current.code)

# Look through the R directory to find these files

# primaryRacePackk-package.r
# Candidate.R
# createcCandidate.R
# propNeeded.R

# Check the NAMESPACE as well