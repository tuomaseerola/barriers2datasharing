#Figure S2 in online appendix: CDF of variable "shared in online repository"
#pdf("figureA2.pdf", width = 8, height = 4)
xlabel <- expression(atop(
  "'How many times have you shared data in an online repository, approximately?",
  paste("State in terms of percentages of total number of articles published.'")
))
par(mar = c(6.5, 8, 3, 6), mgp = c(3, 0.5, 0))
main_ecdf <- expression(atop(
  "Cumulative Density Function for the Frequencies of",
  paste("Percentages of Projects in which Data was Shared")
))
plot(
  ecdf(Data$shared_data_in_past),
  main = main_ecdf,
  xlab = xlabel,
  las = 1,
  cex.axis = "0.9",
  cex.lab = "0.9"
)
#dev.off()

#Figure S3 in online appendix: Histogram of variable "Share data in future"

Data$likelyshare <- dplyr::recode(
  Data$likelyshare,
  "Extremely unlikely" = 1,
  "Somewhat unlikely" = 2,
  "Neither likely nor unlikely" = 3,
  "Somewhat likely" = 4,
  "Extremely likely" = 5
)

#pdf("figureA3.pdf", width=8, height=4)
xlabel <- expression(atop(
  "'How likely are you to share the research data for",
  paste(" your next paper in an online repository?'")
))
main_shared_future <- expression(atop(
  " ",
  paste("Likeliness of Sharing Data in the Future")
))
text_label1 <- expression(atop("Extremely", paste("Unlikely")))
text_label2 <- expression(atop("Extremely", paste("Likely")))

par(mar = c(6.5, 8, 3, 6), mgp = c(3, 0.5, 0))
hist(
  Data$likelyshare,
  breaks = 0.5:5.5,
  xlab = xlabel,
  main = main_shared_future,
  las = 1,
  cex.axis = "0.9",
  cex.lab = "0.9"
)
text(1, 50, labels = text_label1, cex = 0.8)
text(5, 50, labels = text_label2, cex = 0.8)
#dev.off()

#Figure S4 in online appendix: Histogram of variable "share in current system"
# Data$likeliness_current_system <- recode(
#   Data$likeliness_current_system,
#   "4=1; 5=2; 6=3; 7=4; 8=5"
# )

Data$likeness_current_system <- dplyr::recode(
  Data$likeness_current_system,
  "Extremely unlikely" = 1,
  "Somewhat unlikely" = 2,
  "Neither likely nor unlikely" = 3,
  "Somewhat likely" = 4,
  "Extremely likely" = 5
)


#pdf("figureA4.pdf", width = 8, height = 4)
xlabel <- expression(atop(
  "'How likely are you to share research data if ",
  paste("the current academic system remains the same?'")
))
mainlab <- expression(atop(
  "Likeliness of Sharing Data in the Current",
  paste("Academic System")
))
text_label1 <- expression(atop("Extremely", paste("Unlikely")))
text_label2 <- expression(atop("Extremely", paste("Likely")))

par(mar = c(6.5, 8, 3, 6), mgp = c(3, 0.5, 0))
hist(
  Data$likeness_current_system,
  breaks = 0.5:5.5,
  xlab = xlabel,
  main = mainlab,
  las = 1,
  cex.axis = "0.9",
  cex.lab = "0.9"
)
text(1, 50, labels = text_label1, cex = 0.8)
text(5, 50, labels = text_label2, cex = 0.8)
#dev.off()

#Figure S5 in online appendix: Histogram of variable "Legal constraints"
#pdf("figureA5.pdf", width = 8, height = 4)

Data$legal_constraints <- dplyr::recode(
  Data$legal_constraints,
  "Strongly disagree" = 1,
  "Somewhat disagree" = 2,
  "Neither agree nor disagree" = 3,
  "Somewhat agree" = 4,
  "Strongly agree" = 5
)


xlabel <- expression(atop(
  "'I am not allowed to share ",
  paste("my research data.'")
))
main_legal <- expression(atop(" ", paste("Presence of Legal Constraints")))
text_label1 <- expression(atop("Strongly", paste("Disagree")))
text_label2 <- expression(atop("Strongly", paste("Agree")))

par(mar = c(6.5, 8, 3, 6), mgp = c(3, 0.5, 0))
hist(
  Data$legal_constraints,
  breaks = 0.5:5.5,
  xlab = xlabel,
  main = main_legal,
  las = 1,
  cex.axis = "0.9",
  cex.lab = "0.9"
)
text(1, 150, labels = text_label1, cex = 0.8)
text(5, 150, labels = text_label2, cex = 0.8)
#dev.off()
#----------------------------------------------------------------------------------------------
