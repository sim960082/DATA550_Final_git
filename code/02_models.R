here::i_am("code/02_models.R")

data <- readRDS(
  file = here::here("derived_data/data_clean.rds")
)

library(gtsummary)

bi_mod <- glm(
  genhlth_R ~ AVEDRNK2_R,
  data = data,
  family = binomial()
)

table_data <- as.data.frame(summary(bi_mod)$coefficients)%>%
  mutate(Estimate = round(Estimate, 2),
         `Std. Error` = round(`Std. Error`, 2),
         `z value` = round(`z value`, 2),
         `Pr(>|z|)` = ifelse(`Pr(>|z|)` < 0.005, "<0.01", round(`Pr(>|z|)`, 2)))

rownames(table_data) <- c("$\\beta_0$","average_drinking_per_day")



saveRDS(
  bi_mod,
  file = here::here("derived_data/model.rds")
)

saveRDS(
  table_data,
  file = here::here("tables/regression_table.rds")
)

