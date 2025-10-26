# -------------------------------------
# Script: describe_data.R
# Author: T. Eerola
# Purpose:
# Notes:
#
# -------------------------------------
bs <- 16 # base font size for figures

# Number of respondents
cat(paste("N =", nrow(Data)))

# Age and gender
cat("\n\n")
cat(paste("Age (M) =", round(mean(Data$age,na.rm=T), 2)))
cat("\n\n")
cat(paste("Age (SD) =", round(sd(Data$age,na.rm=T), 2)))
cat("\n\n")
cat(paste0(
  "Gender: ",
  round(100 * (sum(Data$sex == "Female",na.rm=T) / nrow(Data)),2),
  "% females"
))

cat("\n\n")

S <- dplyr::summarise(dplyr::group_by(Data, careerstage), N = n())

fig_careerstage <- ggplot(S, aes(x = careerstage, y = N)) +
  geom_col(fill = "#D8B365", color = "black") +
  coord_flip() +
  xlab("Career stage") +
  ylab("Count") +
  scale_x_discrete(expand = c(0.01, 0.01)) +
  scale_y_continuous(expand = c(0.001, 0.001)) +
  theme_classic(base_size = bs)
#print(fig_careerstage)


#### Years active ------

cat(paste(
  "Years active (M) =",
  round(mean(Data$years_active,na.rm = T), 2),
  "SD =",
  round(sd(Data$years_active,na.rm = T), 2)
))

cat("\n\n")

S <- dplyr::summarise(
  dplyr::group_by(Data, careerstage),
  M = mean(years_active,na.rm=T),
  SD = sd(years_active,na.rm=T)
)
print(knitr::kable(S, digits = 2,caption = "Years active by career stage"))

Data$careerstage_binary <- cut(
  Data$years_active,
  breaks = c(-1, 11, 50),
  labels = c("Early", "Senior")
)

#### "How often shared in online repository" -----

fig_shared <- ggplot(Data, aes(x = shared_data_in_past,na.rm = TRUE)) +
  geom_histogram(bins = 5, color = "black",fill="lightblue",na.rm = TRUE) +
  scale_x_continuous(breaks = seq(0, 100, by = 20),labels=paste0(seq(0, 100, by = 20),"%")) +
  xlab(expression(atop(
    "'What proportion (0-100%) of your studies have you shared data in an online repository, approximately?",
    paste(
      "State in terms of percentages of total number of articles published.'"
    )
  ))) +
  theme_classic(base_size = bs-2)
#print(fig_shared)
