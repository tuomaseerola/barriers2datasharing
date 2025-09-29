# ~/.config/rstudio/templates on Mac/Linux
# -------------------------------------
# Script:
# Author: T. Eerola
# Purpose: Rename columns
# Notes:
#
# -------------------------------------

names(Data)[names(Data) == "Q2.1"] <- "age"
names(Data)[names(Data) == "Q2.2"] <- "sex" # (1=male, 2=female)
names(Data)[names(Data) == "Q2.3"] <- "university"
names(Data)[names(Data) == "Q2.4"] <- "careerstage"
names(Data)[names(Data) == "Q2.5"] <- "years_active" #
names(Data)[names(Data) == "Q2.6"] <- "shared_data_in_past" #
names(Data)[names(Data) == "Q2.7"] <- "likeness_current_system" # likert
#names(Data)[names(Data)=="Q2.9"]<-"allowed_to_share"
names(Data)[names(Data) == "Q3.1_1"] <- "legal_constraints" # likert
names(Data)[names(Data) == "Q3.2"] <- "why_not_share" # multiple options
names(Data)[names(Data) == "Q41"] <- "likelyshare" # multiple options

names(Data)[names(Data) == "Q5.1_1"] <- "barriers_1" # likert
names(Data)[names(Data) == "Q5.1_2"] <- "barriers_2" # likert
names(Data)[names(Data) == "Q5.1_3"] <- "barriers_3" # likert
names(Data)[names(Data) == "Q5.1_4"] <- "barriers_4" # likert
names(Data)[names(Data) == "Q5.1_5"] <- "barriers_5" # likert
names(Data)[names(Data) == "Q5.1_6"] <- "barriers_6" # likert
names(Data)[names(Data) == "Q5.1_7"] <- "barriers_7" # likert
names(Data)[names(Data) == "Q5.1_8"] <- "barriers_8" # likert
names(Data)[names(Data) == "Q5.1_9"] <- "barriers_9" # likert
names(Data)[names(Data) == "Q5.1_10"] <- "barriers_10" # likert
names(Data)[names(Data) == "Q5.1_11"] <- "barriers_11" # likert
names(Data)[names(Data) == "Q5.1_12"] <- "barriers_12" # likert
names(Data)[names(Data) == "Q5.1_13"] <- "barriers_13" # likert
names(Data)[names(Data) == "Q5.1_14"] <- "barriers_14" # likert
names(Data)[names(Data) == "Q5.1_15"] <- "barriers_15" # likert

names(Data)[names(Data) == "Q5.2"] <- "name_repos"

names(Data)[names(Data) == "Q6.1_1"] <- "fears_1" # likert
names(Data)[names(Data) == "Q6.1_2"] <- "fears_2" # likert
names(Data)[names(Data) == "Q6.1_3"] <- "fears_3" # likert
names(Data)[names(Data) == "Q6.1_4"] <- "fears_4" # likert
names(Data)[names(Data) == "Q6.1_5"] <- "fears_5" # likert
names(Data)[names(Data) == "Q6.1_6"] <- "fears_6" # likert

names(Data)[names(Data) == "Q7.1_1"] <- "fears2_1" # likert
names(Data)[names(Data) == "Q7.1_2"] <- "fears2_2" # likert
names(Data)[names(Data) == "Q7.1_3"] <- "fears2_3" # likert
names(Data)[names(Data) == "Q7.1_4"] <- "fears2_4" # likert
names(Data)[names(Data) == "Q7.1_5"] <- "fears2_5" # likert
names(Data)[names(Data) == "Q7.1_6"] <- "fears2_6" # likert

names(Data)[names(Data) == "Q8.1_1"] <- "sharelikely_1" # likert
names(Data)[names(Data) == "Q8.1_2"] <- "sharelikely_2" # likert
names(Data)[names(Data) == "Q8.1_3"] <- "sharelikely_3" # likert
names(Data)[names(Data) == "Q8.1_4"] <- "sharelikely_4" # likert
names(Data)[names(Data) == "Q8.1_5"] <- "sharelikely_5" # likert
names(Data)[names(Data) == "Q8.1_6"] <- "sharelikely_6" # likert
names(Data)[names(Data) == "Q8.1_7"] <- "sharelikely_7" # likert
names(Data)[names(Data) == "Q8.1_8"] <- "sharelikely_8" # likert
names(Data)[names(Data) == "Q8.1_9"] <- "sharelikely_9" # likert
names(Data)[names(Data) == "Q8.1_10"] <- "sharelikely_10" # likert
names(Data)[names(Data) == "Q8.1_11"] <- "sharelikely_11" # likert
names(Data)[names(Data) == "Q8.1_12"] <- "sharelikely_12" # likert

names(Data)[names(Data) == "Q9.1_1"] <- "sharelikely2_1" # likert
names(Data)[names(Data) == "Q9.1_2"] <- "sharelikely2_2" # likert
names(Data)[names(Data) == "Q9.1_3"] <- "sharelikely2_3" # likert
names(Data)[names(Data) == "Q9.1_4"] <- "sharelikely2_4" # likert
names(Data)[names(Data) == "Q9.1_5"] <- "sharelikely2_5" # likert
names(Data)[names(Data) == "Q9.1_6"] <- "sharelikely2_6" # likert
names(Data)[names(Data) == "Q9.1_7"] <- "sharelikely2_7" # likert
names(Data)[names(Data) == "Q9.1_8"] <- "sharelikely2_8" # likert
names(Data)[names(Data) == "Q9.1_9"] <- "sharelikely2_9" # likert
names(Data)[names(Data) == "Q9.1_10"] <- "sharelikely2_10" # likert

names(Data)[names(Data) == "Q10.1_1"] <- "desirable_1" # likert
names(Data)[names(Data) == "Q10.1_2"] <- "desirable_2" # likert

names(Data)[names(Data) == "Q10.2_1"] <- "benefits_1" # likert
names(Data)[names(Data) == "Q10.2_2"] <- "benefits_2" # likert

names(Data)[names(Data) == "Q10.3"] <- "greatestbenefit" # likert
names(Data)[names(Data) == "Q10.4"] <- "promote" # likert

#### change some integer variables to integers
Data$shared_data_in_past <- as.integer(Data$shared_data_in_past)
Data$age <- stringr::str_replace_all(Data$age, "> 18","40")
Data$age <- stringr::str_replace_all(Data$age, "[\\+\\|| ]","")
Data$age
Data$age <- invisible(as.numeric(Data$age))
Data$years_active <- as.numeric(Data$years_active)


Data$careerstage <- factor(
  Data$careerstage,
  levels = c(
    "PhD Student",
    "Post Doc",
    "Assistant Professor",
    "Associate Professor / Reader",
    "Professor",
    "Other"
  )
)

