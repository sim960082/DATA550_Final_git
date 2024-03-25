here::i_am("code/01_make_scatter.R")

data <- readRDS(
  file = here::here("derived_data/data_clean.rds")
)

library(gtsummary)
library(ggplot2)

scatter <- ggplot(data, aes(x = AVEDRNK2_R, y = genhlth_RR)) +
  geom_point() +
  theme_bw()

ggsave(
  here::here("figures/scatterplot.png"),
  plot = scatter,
  device = "png"
)