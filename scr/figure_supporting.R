# figure_supporting.R

#### Share data in future" ------------
share <- data.frame(share = Data$likelyshare)
share$share <- factor(
  share$share,
  levels = c(
    "Extremely unlikely",
    "Somewhat unlikely",
    "Neither likely nor unlikely",
    "Somewhat likely",
    "Extremely likely"
  )
)
colnames(share) <- "Likeliness of sharing data in the future"

gg2 <- plot(likert(share), ordered = T) +
  #  ggtitle(main_others) +
  theme_classic(base_size = 14) +
  theme(plot.title = element_text(hjust = 0.5))
print(gg2)

#### "share in current system" --------
share_current_system <- data.frame(share = Data$likeness_current_system)

share_current_system$share <- factor(
  share_current_system$share,
  levels = c(
    "Extremely unlikely",
    "Somewhat unlikely",
    "Neither likely nor unlikely",
    "Somewhat likely",
    "Extremely likely"
  )
)
colnames(share) <- "Likeliness of Sharing Data in the Future"

xlabel <- expression(atop(
  "'How likely are you to share research data if ",
  paste("the current academic system remains the same?'")
))

gg3 <- plot(likert(share_current_system), ordered = T) +
  ggtitle(xlabel) +
  theme_classic(base_size = 14) +
  theme(plot.title = element_text(hjust = 0.5))
print(gg3)

#### Legal constraints ------
legal <- data.frame(legal = Data$legal_constraints)
legal$legal <- factor(
  legal$legal,
  levels = c(
    "Strongly disagree",
    "Somewhat disagree",
    "Neither agree nor disagree",
    "Somewhat agree",
    "Strongly agree"
  )
)
colnames(share) <- "Legal constraints"

xlabel <- expression(atop(
  "'I am not allowed to share ",
  paste("my research data.'")
))

gg4 <- plot(likert(legal), ordered = T) +
  ggtitle(xlabel) +
  theme_classic(base_size = 14) +
  theme(plot.title = element_text(hjust = 0.5))
print(gg4)


#### grea -----------

benefit <- data.frame(benefit = Data$greatestbenefit)
benefit$benefit <- factor(
  benefit$benefit,
  levels = c(
    "Advance the state of research and innovation",
    "Enable other researchers to ask new questions of extant data",
    "Make results of publicly funded research available to the public",
    "The ability to reproduce or verify research"
  )
)
colnames(benefit) <- "Greatest benefit"

xlabel <- expression(atop(
  "'Greatest benefit'"
))

gg5 <- plot(
  likert(benefit, grouping = Data$careerstage_binary),
  ordered = T,
  legend.position = "bottom"
) +
  ggtitle(xlabel) +
  xlab("") +
  theme_classic(base_size = 14) +
  theme(plot.title = element_text(hjust = 0.5))
print(gg5)
