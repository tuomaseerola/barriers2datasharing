# figure_barriers.R
#Figure 2: Barriers
bs <- 16 # base font size for figures

barriers <- Data[, 11:25]
barriers <- data.frame(barriers)
colnames(barriers) <- c(
  Bnoquestions_secondary_res = "I wish not to answer questions from secondary researchers",
  Bpreparing_time = "Preparing data is too time consuming",
  Bunfair_do_own_work = "Unfair for other researchers to profit from my work",
  Bdata_too_big = "Data set is too big",
  Bdata_too_complex = "Data set is too complex",
  Bdata_not_important = "Data set is not important enough",
  Bno_recognition_footnote = "No proper recognition for sharing (footnote)",
  Bno_recognition_citation = "No proper recognition for sharing (citation)",
  Bno_recognition_coauthor = "No proper recognition for sharing (co-authorship)",
  Bnever_learned = "Never learned to share data online",
  Bnever_thought_about_sharing = "Never thought about sharing data online",
  Bno_common_practice = "Sharing data is not a common practice in my field",
  Bcommercialize_data = "I plan to commercialize my data or technology",
  Bprefer_upon_request = "Prefer to share data upon request",
  Bno_suitable_place = "No suitable repository to share data"
)
choices = c(
  "Strongly disagree",
  "Disagree",
  "Somewhat disagree",
  "Neither agree nor disagree",
  "Somewhat agree",
  "Agree",
  "Strongly agree"
)
for (i in 1:ncol(barriers)) {
  #  barriers[,i] = factor(barriers[,i], levels=1:7, labels=choices, ordered=TRUE)
  barriers[, i] = factor(barriers[, i], levels = choices, ordered = TRUE)
}

main_barriers <- expression(atop(
  "'To what extent do you agree with the",
  paste("following statements about barriers related to data sharing?'")
))
#pdf("figure2.pdf", width=10)
g1 <- plot(likert(barriers), ordered = T) +
  ggtitle(main_barriers) +
  theme_classic(base_size = bs) +
  theme(plot.title = element_text(hjust = 0.5))
print(g1)
#dev.off()

rm(choices, i, main_barriers)


#----------------------------------------------------------------------------------------------
########Plots - Desirability and Profitability########

#Figure 1A: Desirability
desirability <- as.data.frame(Data[, 61:62])
colnames(desirability) <- c(
  desirable_community = "How desirable do you think data sharing is for your research field?",
  desirable_yourfield = "How desirable do you think data sharing is for your current research project?"
)
choices = c(
  "Very Undesirable",
  "Undesirable",
  "Neutral",
  "Desirable",
  "Very Desirable"
)

for (i in 1:ncol(desirability)) {
  desirability[, i] = factor(
    desirability[, i],
    levels = choices,
    ordered = TRUE
  )
}

title_desirability <- "Desirability of Data Sharing"
#pdf("figure1A.pdf", width = 10, height = 4)
library(RColorBrewer)
g2 <- plot(
  likert(desirability),
  centered = FALSE,
  #  center = 2.5,
  ordered = TRUE,
  plot.percent.neutral = FALSE
) +
  scale_fill_manual(
    name = "Response",
    values = brewer.pal(n = 5, "RdYlBu"),
    breaks = choices
  ) +
  ggtitle(title_desirability) +
  theme_classic(base_size = bs) +
  theme(plot.title = element_text(hjust = 0.5))
#print(g2)

#### Figure 1B: Profitability -------
profitability <- as.data.frame(Data[, 63:64])
colnames(profitability) <- c(
  researchfield_profit = "To what extent do you think your research field would profit from data sharing?",
  researchproject_profit = "To what extent do you think your current research project would profit from data sharing?"
)
choices = c(
  "None at all",
  "A little",
  "A moderate amount",
  "A lot",
  "A great deal"
)

for (i in 1:ncol(profitability)) {
  profitability[, i] = factor(
    profitability[, i],
    levels = choices,
    ordered = TRUE
  )
}

title_profitability <- "Profitability of Data Sharing"
#pdf("figure1B.pdf", width = 10, height = 4)
g3 <- plot(likert(profitability), ordered = TRUE) +
  ggtitle(title_profitability) +
  theme_classic(base_size = bs) +
  theme(plot.title = element_text(hjust = 0.5))
#dev.off()
#print(g3)

########Plots of barriers data########

# #Figure 2: Barriers
# barriers <- Data[, 11:25]
# colnames(barriers) <- c(
#   Bnoquestions_secondary_res = "I wish not to answer questions from secondary researchers",
#   Bpreparing_time = "Preparing data is too time consuming",
#   Bunfair_do_own_work = "Unfair for other researchers to profit from my work",
#   Bdata_too_big = "Data set is too big",
#   Bdata_too_complex = "Data set is too complex",
#   Bdata_not_important = "Data set is not important enough",
#   Bno_recognition_footnote = "No proper recognition for sharing (footnote)",
#   Bno_recognition_citation = "No proper recognition for sharing (citation)",
#   Bno_recognition_coauthor = "No proper recognition for sharing (co-authorship)",
#   Bnever_learned = "Never learned to share data online",
#   Bnever_thought_about_sharing = "Never thought about sharing data online",
#   Bno_common_practice = "Sharing data is not a common practice in my field",
#   Bcommercialize_data = "I plan to commercialize my data or technology",
#   Bprefer_upon_request = "Prefer to share data upon request",
#   Bno_suitable_place = "No suitable repository to share data"
# )
# choices = c(
#   "Strongly Disagree",
#   "Disagree",
#   "Somewhat Disagree",
#   "Neutral",
#   "Somewhat Agree",
#   "Agree",
#   "Strongly Agree"
# )
# for (i in 1:ncol(barriers)) {
#   barriers[, i] = factor(
#     barriers[, i],
#     levels = 1:7,
#     labels = choices,
#     ordered = TRUE
#   )
# }
#
# main_barriers <- expression(atop(
#   "'To what extent do you agree with the",
#   paste("following statements about barriers related to data sharing?'")
# ))
# pdf("figure2.pdf", width = 10)
# plot(likert(barriers), ordered = T) +
#   ggtitle(main_barriers) +
#   theme(plot.title = element_text(hjust = 0.5))
# dev.off()

#### Figure 3A: Researchers' own fears ---------
self <- as.data.frame(Data[, 33:38])

names(self) <- c(
  Bself_control_intellectualprop = "Fear of losing control over intellectual property",
  Bself_alternative_analyses = "Fear of alternative analyses which may expose invalid conclusions",
  Bself_errors_discovered = "Fear of the discovery of errors in the data",
  Bself_scooped = "Fear of being scooped",
  Bself_misinterpret = "Fear of misinterpretations of the data",
  Bself_unintended_purposes = "Fear of secondary use of data for unintended purposes"
)

choices = c(
  "Strongly disagree",
  "Disagree",
  "Somewhat disagree",
  "Neither agree nor disagree",
  "Somewhat agree",
  "Agree",
  "Strongly agree"
)
for (i in 1:ncol(self)) {
  self[, i] = factor(self[, i], levels = choices, ordered = TRUE)
}
main_self <- expression(atop(
  "'To what extent do you agree with the",
  paste(
    "following statements about fear-related barriers, evaluated for yourself?'"
  )
))
#pdf("figure3A.pdf", width = 10)
g4 <- plot(likert(self), ordered = T) +
  ggtitle(main_self) +
  theme_classic(base_size = bs) +
  theme(plot.title = element_text(hjust = 0.5))
#dev.off()
print(g4)

#### Figure 3B: Other researchers fears -----------
others <- as.data.frame(Data[, 27:32])

colnames(others) <- c(
  Bothers_control_intellectualprop = "Fear of losing control over intellectual property",
  Bothers_alternative_analyses = "Fear of alternative analyses which may expose invalid conclusions",
  Bothers_errors_discoverd = "Fear of the discovery of errors in the data",
  Bothers_scooped = "Fear of being scooped",
  Bothers_misinterpret = "Fear of misinterpretations of the data",
  Bothers_unintended_purposes = "Fear of secondary use of data for unintended purposes"
)

choices = c(
  "Strongly disagree",
  "Disagree",
  "Somewhat disagree",
  "Neither agree nor disagree",
  "Somewhat agree",
  "Agree",
  "Strongly agree"
)
for (i in 1:ncol(others)) {
  others[, i] = factor(
    others[, i],
    levels = choices,
    ordered = TRUE
  )
}

main_others <- expression(atop(
  "'To what extent do you agree with the",
  paste("following statements about other researchers' fear-related barriers?'")
))
#pdf("figure3B.pdf", width = 10)
g5 <- plot(likert(others), ordered = T) +
  ggtitle(main_others) +
  theme_classic(base_size = bs) +
  theme(plot.title = element_text(hjust = 0.5))
# dev.off()
print(g5)


#### Plots of preconditions data -------

#Figure 4: Preconditions
preconditions <- as.data.frame(Data[, 39:60])

colnames(preconditions) <- c(
  Cminimal_effort = "
                               ... minimal effort is required to share",
  Cminimal_time = "... minimal time is required to share",
  Ceasy_to_understand = "... the data will be easily understood by secondary users",
  Crecognition_footnote = "... you would get recognition (footnote)",
  Crecognition_citation = "... you would get recognition (citation)",
  Crecognition_coauthor = "... you would get recognition (co-authorship)",
  Csame_prestige = "... sharing data would be granted the same prestige as publishing an article",
  Csomeone_shows_me = "... someone would show you how to share your data",
  Csuitable_place = "... there was a suitable place to share",
  Cfirst_rights_publish = "... you had the first rights to publish the results from the data",
  Ctrust_requestor = "... you/your group trust the requestor",
  Cdetermine_conditions = "... for each request, you can determine the conditions of sharing",
  Cfunder_requires = "... your research funder requires you to share",
  Cfunder_encourages = "... your research funder encourages you to share",
  Cjournal_requires = "...the journal requires you to share",
  Cjournal_encourages = "... the journal encourages you to share",
  Cinstitution_requires = "... your institution requires you to share",
  Cinstitution_encourages = "... your institution encourages you to share",
  Ccommunity_expects = "... your community expects you to share",
  Cfinancial_reward = "... you were financially rewarded to share",
  Cgrants_increased_ifshared = "... your research grants would be increased if you shared",
  Cgrants_decreased_ifnotshared = "... your research grants would be decreased if you did not share"
)
choices = c(
  "Very unlikely",
  "Unlikely",
  "Somewhat unlikely",
  "Neither likely nor unlikely",
  "Somewhat likely",
  "Likely",
  "Very likely"
)
for (i in 1:ncol(preconditions)) {
  preconditions[, i] = factor(
    preconditions[, i],
    levels = choices,
    ordered = TRUE
  )
}

main_preconditions <- expression(atop(
  "'How likely you are you to share ",
  paste("your research data if ... ?'")
))
#pdf("figure4.pdf", paper = 'a4r', width = 24, height = 18)
#par(mar = c(6.5, 8, 1.5, 12))
g6 <- plot(likert(preconditions), ordered = T) +
  #  scale_fill_manual(values = brewer.pal(n = 7,"RdYlBu"), breaks = choices)+
  ggtitle(main_preconditions) +
  theme_classic(base_size = bs) +
  theme(plot.title = element_text(hjust = 0.5))
#dev.off()
print(g6)
