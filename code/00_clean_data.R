here::i_am("code/00_clean_data.R")
absolute_path_to_data <- here::here("raw_data/2010-BRFSS-SMART-subset.csv")
desired_cols <- c("genhlth", "physhlth", "menthlth","DRNKANY4", "AVEDRNK2")

data1 <- read.csv(absolute_path_to_data, header = TRUE)

library(labelled)
library(gtsummary)
library(dplyr)

data <- data1[, desired_cols]

var_label(data) <- list(
  genhlth = "general health",
  physhlth = "NUMBER OF DAYS PHYSICAL HEALTH NOT GOOD ",
  menthlth = "NUMBER OF DAYS MENTAL HEALTH NOT GOOD",
  DRNKANY4 = "DRINK ANY ALCOHOLIC BEVERAGES IN PAST 30",
  AVEDRNK2 = " AVG ALCOHOLIC DRINKS PER DAY IN PAST 30 "
)

data$genhlth_RR <- ifelse(data$genhlth==7 | data$genhlth==9 , NA, data$genhlth  )
data$genhlth_R <- ifelse(data$genhlth_RR <= 2, 0, 1 )
data$DRNKANY4_R <- ifelse(data$DRNKANY4==7 | data$DRNKANY4==9 , NA, data$DRNKANY4  )
data$AVEDRNK2_R <- ifelse(data$AVEDRNK2==77 | data$AVEDRNK2==99 , NA, data$AVEDRNK2  )

saveRDS(
  data, 
  file = here::here("derived_data/data_clean.rds")
)

