# libraries.R
# TE 13/9/2025
#
# script to help to load the necessary R libraries

# EXAMPLE LIBRARIES (my top 6)
#library(gdata)      # for reading Excel
#library(ggplot2)    # for figures
#library(psych)      # for various summaries
#library(plyr)       # easier management of groups
#library(stringr)    # easier management of strings
#library(reshape2)   # convenient conversion between short and longformat in R dataframes

# library(reshape2)
# library(psych)
# library(polycor)
# library(ggplot2)
# library(dplyr)
# library(polycor)

required_lib = c(
  "foreign",
  "magrittr",
  "readr",
  "likert",
  "Hmisc",
  "car",
  "here"
) # insert here the required libraries

# install the necessary libraries if they have not been installed into this machine

install_required_libs <- function() {
  for (i in 1:length(required_lib)) {
    if (required_lib[i] %in% rownames(installed.packages()) == FALSE) {
      install.packages(required_lib[i])
    }
  }
}

install_required_libs()

# load all the necessary libraries
#
for (i in 1:length(required_lib)) {
  library(required_lib[i], character.only = TRUE)
}

#cat("The following libraries were loaded: ")
#cat(required_lib, "\n")

rm(required_lib, i, install_required_libs) # clean memory
