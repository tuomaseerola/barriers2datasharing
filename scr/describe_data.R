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

print("\n\n")

S <- dplyr::summarise(dplyr::group_by(Data, careerstage), N = n())

g <- ggplot(S, aes(x = careerstage, y = N)) +
  geom_col(fill = "#D8B365", color = "black") +
  coord_flip() +
  xlab("Career stage") +
  ylab("Count") +
  scale_x_discrete(expand = c(0.01, 0.01)) +
  scale_y_continuous(expand = c(0.001, 0.001)) +
  theme_classic(base_size = 14)
print(g)


#### Years active ------
print("\n\n")
print(paste(
  "Years active (M) =",
  round(mean(Data$years_active), 2),
  "SD =",
  round(sd(Data$years_active), 2)
))

print("\n\n")

S <- dplyr::summarise(
  dplyr::group_by(Data, careerstage),
  M = mean(years_active),
  SD = sd(years_active)
)
print(knitr::kable(S, digits = 2))

Data$careerstage_binary <- cut(
  Data$years_active,
  breaks = c(-1, 11, 50),
  labels = c("Early", "Senior")
)

#### "How often shared in online repository" -----

gg1 <- ggplot(Data, aes(x = shared_data_in_past)) +
  geom_histogram(binwidth = 10, fill = "grey70", color = "black") +
  scale_x_continuous(breaks = seq(0, 100, by = 10)) +
  xlab(expression(atop(
    "'How many times have you shared data in an online repository, approximately?",
    paste(
      "State in terms of percentages of total number of articles published.'"
    )
  ))) +
  theme_classic(base_size = 14)
print(gg1)
