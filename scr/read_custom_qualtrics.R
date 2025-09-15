read_custom_qualtrics <- function(filename = NULL, format = "labels") {
  #  print(filename)
  #require(readr)
  col_names <- names(readr::read_csv(
    filename,
    n_max = 0,
    show_col_types = FALSE
  ))

  #  print(col_names)

  if (format == "labels") {
    column_types <- list(
      StartDate = col_datetime(format = "%Y-%m-%d %H:%M:%S"),
      EndDate = col_datetime(format = "%Y-%m-%d %H:%M:%S"),
      Status = col_character(),
      Progress = col_double(),
      `Duration (in seconds)` = col_double(),
      Finished = col_logical(),
      RecordedDate = col_datetime(format = "%Y-%m-%d %H:%M:%S"),
      ResponseId = col_character(),
      DistributionChannel = col_character(),
      UserLanguage = col_character(),
      Q_RecaptchaScore = col_character(),
      Q1.0 = col_character(),
      Q2.1 = col_character(),
      Q2.2 = col_character(),
      Q2.3 = col_character(),
      Q2.4 = col_character(),
      Q2.5 = col_character(),
      Q2.6 = col_character(),
      Q2.7 = col_character(),
      Q41 = col_character(),
      Q3.1_1 = col_character(),
      Q3.2 = col_character(),
      Q5.1_1 = col_character(),
      Q5.1_2 = col_character(),
      Q5.1_3 = col_character(),
      Q5.1_4 = col_character(),
      Q5.1_5 = col_character(),
      Q5.1_6 = col_character(),
      Q5.1_7 = col_character(),
      Q5.1_8 = col_character(),
      Q5.1_9 = col_character(),
      Q5.1_10 = col_character(),
      Q5.1_11 = col_character(),
      Q5.1_12 = col_character(),
      Q5.1_13 = col_character(),
      Q5.1_14 = col_character(),
      Q5.1_15 = col_character(),
      Q5.2 = col_character(),
      Q6.1_1 = col_character(),
      Q6.1_2 = col_character(),
      Q6.1_3 = col_character(),
      Q6.1_4 = col_character(),
      Q6.1_5 = col_character(),
      Q6.1_6 = col_character(),
      Q7.1_1 = col_character(),
      Q7.1_2 = col_character(),
      Q7.1_3 = col_character(),
      Q7.1_4 = col_character(),
      Q7.1_5 = col_character(),
      Q7.1_6 = col_character(),
      Q8.1_1 = col_character(),
      Q8.1_2 = col_character(),
      Q8.1_3 = col_character(),
      Q8.1_4 = col_character(),
      Q8.1_5 = col_character(),
      Q8.1_6 = col_character(),
      Q8.1_7 = col_character(),
      Q8.1_8 = col_character(),
      Q8.1_9 = col_character(),
      Q8.1_10 = col_character(),
      Q8.1_11 = col_character(),
      Q8.1_12 = col_character(),
      Q9.1_1 = col_character(),
      Q9.1_2 = col_character(),
      Q9.1_3 = col_character(),
      Q9.1_4 = col_character(),
      Q9.1_5 = col_character(),
      Q9.1_6 = col_character(),
      Q9.1_7 = col_character(),
      Q9.1_8 = col_character(),
      Q9.1_9 = col_character(),
      Q9.1_10 = col_character(),
      Q10.1_1 = col_character(),
      Q10.1_2 = col_character(),
      Q10.2_1 = col_character(),
      Q10.2_2 = col_character(),
      Q10.3 = col_character(),
      Q10.4 = col_character()
    )
  }

  if (format == "values") {
    column_types <- list(
      StartDate = col_datetime(format = "%Y-%m-%d %H:%M:%S"),
      EndDate = col_datetime(format = "%Y-%m-%d %H:%M:%S"),
      Status = col_double(),
      Progress = col_double(),
      `Duration (in seconds)` = col_double(),
      Finished = col_double(),
      RecordedDate = col_datetime(format = "%Y-%m-%d %H:%M:%S"),
      ResponseId = col_character(),
      DistributionChannel = col_character(),
      UserLanguage = col_character(),
      Q_RecaptchaScore = col_character(),
      Q1.0 = col_double(),
      Q2.1 = col_double(),
      Q2.2 = col_double(),
      Q2.3 = col_character(),
      Q2.4 = col_double(),
      Q2.5 = col_double(),
      Q2.6 = col_double(),
      Q2.7 = col_double(),
      Q41 = col_double(),
      Q3.1_1 = col_double(),
      Q3.2 = col_double(),
      Q5.1_1 = col_double(),
      Q5.1_2 = col_double(),
      Q5.1_3 = col_double(),
      Q5.1_4 = col_double(),
      Q5.1_5 = col_double(),
      Q5.1_6 = col_double(),
      Q5.1_7 = col_double(),
      Q5.1_8 = col_double(),
      Q5.1_9 = col_double(),
      Q5.1_10 = col_double(),
      Q5.1_11 = col_double(),
      Q5.1_12 = col_double(),
      Q5.1_13 = col_double(),
      Q5.1_14 = col_double(),
      Q5.1_15 = col_double(),
      Q5.2 = col_character(),
      Q6.1_1 = col_double(),
      Q6.1_2 = col_double(),
      Q6.1_3 = col_double(),
      Q6.1_4 = col_double(),
      Q6.1_5 = col_double(),
      Q6.1_6 = col_double(),
      Q7.1_1 = col_double(),
      Q7.1_2 = col_double(),
      Q7.1_3 = col_double(),
      Q7.1_4 = col_double(),
      Q7.1_5 = col_double(),
      Q7.1_6 = col_double(),
      Q8.1_1 = col_double(),
      Q8.1_2 = col_double(),
      Q8.1_3 = col_double(),
      Q8.1_4 = col_double(),
      Q8.1_5 = col_double(),
      Q8.1_6 = col_double(),
      Q8.1_7 = col_double(),
      Q8.1_8 = col_double(),
      Q8.1_9 = col_double(),
      Q8.1_10 = col_double(),
      Q8.1_11 = col_double(),
      Q8.1_12 = col_double(),
      Q9.1_1 = col_double(),
      Q9.1_2 = col_double(),
      Q9.1_3 = col_double(),
      Q9.1_4 = col_double(),
      Q9.1_5 = col_double(),
      Q9.1_6 = col_double(),
      Q9.1_7 = col_double(),
      Q9.1_8 = col_double(),
      Q9.1_9 = col_double(),
      Q9.1_10 = col_double(),
      Q10.1_1 = col_double(),
      Q10.1_2 = col_double(),
      Q10.2_1 = col_double(),
      Q10.2_2 = col_double(),
      Q10.3 = col_double(),
      Q10.4 = col_character()
    )
  }

  tmp <- readr::read_csv(
    filename,
    skip = 3,
    col_names = col_names,
    col_types = column_types,
    na = c("", "NA"),
    show_col_types = FALSE
  )

  #  p <- problems(tmp)

  #tmp <- read.csv(filename, header = TRUE, na.strings = "")
  #names(tmp) <- gsub("\\.", "", names(tmp)) # remove full stops from the column names
  #tmp <- tmp[3:nrow(tmp), ]     # delete two first rows (metadata)

  #  tmp <- tmp %>% mutate(across(starts_with("Gen_"), as.numeric)) # items into numeric

  #Ensure only consenting participants to remove NA
  #tmp <- filter(tmp, Consent == 2)

  names(tmp)[names(tmp) == "Duration (in seconds)"] <- "Duration"

  print(paste("Number of participants in the data:", nrow(tmp)))
  #  print(paste("Number of unique IDs:", length(unique(tmp$Prolific_ID))))
  ## Filtering
  #print(names(tmp))
  #print("Filter....")
  tmp2 <- dplyr::filter(tmp, Progress == 100)
  tmp2 <- dplyr::filter(tmp2, DistributionChannel != "preview")
  print(paste(
    "Number of participants after filtering incomplete/previews:",
    nrow(tmp2)
  ))
  # Eliminate unnecessary columns
  d <- dplyr::select(
    tmp2,
    -any_of(c(
      'StartDate',
      'EndDate',
      'Status',
      'Progress',
      'Duration',
      'Finished',
      'RecordedDate',
      'DistributionChannel',
      'UserLanguage',
      'ResponseId',
      'Q_RecaptchaScore',
      'Q1.0',
      'Consent'
    ))
  )
  #  d <- dplyr::select(d, -any_of(c("IPAddress", "RecipientFirstName","RecipientLastName","RecipientEmail","LocationLatitude","LocationLongitude","ExternalReference","ID")))

  # d$Gender <- case_when(
  #   d$Gender == 1 ~ "Male",
  #   d$Gender == 2 ~ "Female",
  #   d$Gender == 3 ~ "Non-binary",
  #   d$Gender == 4 ~ "Other",
  #   d$Gender == 5 ~ "Prefer not to say"
  #)
  # d$OMSI <- case_when(
  #   d$OMSI == 1 ~ "Nonmusician",
  #   d$OMSI == 2 ~ "Music-loving Nonmusician",
  #   d$OMSI == 3 ~ "Amateur musician",
  #   d$OMSI == 4 ~ "Serious amateur musician",
  #   d$OMSI == 5 ~ "Semiprofessional musician",
  #   d$OMSI == 6 ~ "Professional musician"
  # )
  # d$Gender <- factor(d$Gender)
  # d$OMSI <- factor(
  #   d$OMSI,
  #   levels = c(
  #     "Nonmusician",
  #     "Music-loving Nonmusician",
  #     "Amateur musician",
  #     "Serious amateur musician",
  #     "Semiprofessional musician",
  #     "Professional musician"
  #   ),
  #   ordered = TRUE
  # )
  # Add check whether c_id exists ----

  return(d)
}
