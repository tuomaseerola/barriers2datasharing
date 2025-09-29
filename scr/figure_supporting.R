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


#### greatest benefit -----------

benefit <- data.frame(options = Data$greatestbenefit, careerstage_binary = Data$careerstage_binary)
benefit$options <- factor(
  benefit$options,
  levels = c(
    "Advance the state of research and innovation",
    "Enable other researchers to ask new questions of extant data",
    "Make results of publicly funded research available to the public",
    "The ability to reproduce or verify research"
  ),
  labels = c(
    "Advance the state of research\n and innovation",
    "Enable other researchers to ask\n new questions of extant data",
    "Make results of publicly funded\n research available to the public",
    "The ability to reproduce or \nverify research"
  )
)
B <- dplyr::summarise(dplyr::group_by(benefit, options, careerstage_binary), benefit = n(),.groups="drop")


gg5 <- ggplot(B, aes(y=benefit, x=reorder(options,benefit),fill=careerstage_binary))+
  geom_col(position = "dodge",color="black")+
  ggtitle("Greatest benefit") +
  ylab("Count") +
  xlab("") +
  coord_flip() +
  scale_fill_brewer(palette = "Set3", name = "Career stage") +
  scale_y_continuous(expand = c(0.01, 0.01),breaks = seq(0,20,by=3)) +
  theme_classic(base_size = 14) +
  theme(plot.title = element_text(hjust = 0.5))
print(gg5)
