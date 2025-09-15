# contents.R
# Barriers to data sharing in music psychology
# T. Eerola, 14/9/2025

#### Libraries and functions --------
source('scr/libraries.R')
source('scr/read_custom_qualtrics.R')
options(scipen = 999)

#### Read data --------
fn1 <- "data/Barriers+for+data+sharing+in+music+psychology_September+13,+2025_00.51_LABELS.csv"
Data <- read_custom_qualtrics(filename = fn1, format = "labels")
source('scr/rename_variables.R')

#### Descriptive Statistics -------
source('scr/describe_data.R')

##### Figures ----------------------------
source('scr/figure_main.R')
source('scr/figure_supporting.R')
