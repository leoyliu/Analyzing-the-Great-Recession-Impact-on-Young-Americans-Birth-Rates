library(dplyr)
library(tidyverse)
library(here)
library(ggplot2)

uncleaned_data <- read.csv(here::here("inputs/data/figs_2a_2b.csv"))

cleaned_data <- uncleaned_data |>
  select(brate_1519, brate_2024, brate_2529, brate_3034, brate_3539, brate_4044, year)

cleaned_data <- cleaned_data |>
  rename(
    "br_15 to 19" = brate_1519,
    "br_20 to 24" = brate_2024,
    "br_25 to 29" = brate_2529,
    "br_30 to 34" = brate_3034,
    "br_35 to 39" = brate_3539,
    "br_40 to 44" = brate_4044,
  )

cleaned_data <- cleaned_data |>
  pivot_longer(cols = starts_with("br_"),
               names_to = "age_group",
               names_prefix = "br_",
               values_to = "brate")

write_csv(
  x = cleaned_data,
  file = "outputs/data/figure_2.csv"
)