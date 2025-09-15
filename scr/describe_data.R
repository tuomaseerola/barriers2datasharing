# -------------------------------------
# Script: describe_data.R
# Author: T. Eerola
# Purpose:
# Notes:
#
# -------------------------------------
# Number of respondents
print(paste("N =", nrow(Data)))

# Age and gender

print(paste("Age (M) =", round(mean(Data$age), 2)))
print(paste("Age (SD) =", round(sd(Data$age), 2)))
print(paste0(
  "Gender: ",
  100 * (sum(Data$sex == "Female") / nrow(Data)),
  "% females"
))

library(tidyverse)
S <- dplyr::summarise(dplyr::group_by(Data, careerstage), N = n())

g <- ggplot(S, aes(x = careerstage, y = N)) +
  geom_col(fill = "#D8B365", color = "black") +
  coord_flip() +
  xlab("Career stage") +
  ylab("Count") +
  scale_x_discrete(expand = c(0.01, 0.01)) +
  scale_y_continuous(expand = c(0.001, 0.001)) +
  theme_classic(base_size = 13)
print(g)

print(paste(
  "Years active (M) =",
  round(mean(Data$years_active), 2),
  "SD =",
  round(sd(Data$years_active), 2)
))
