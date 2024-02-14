#### Preamble ####
# Purpose: Cleans the raw plane data
# Author: Yuanyi (Leo) Liu, Qi Er (Emma) Teng
# Date: 13 February 2024
# Contact: leoy.liu@mail.utoronto.ca, e.teng@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(here)
library(mapdata)


#### Cleaned data ####

##Figure 1##
figure1 <- read.csv(here::here("inputs/data/fig_1.csv"))

#Write to CSV
write_csv(
  x = figure1,
  file = "outputs/data/figure_1.csv"
)

##Figure 2##
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

#Write to CSV
write_csv(
  x = cleaned_data,
  file = "outputs/data/figure_2.csv"
)

##Figure 3a##

uncleaned_data <- read.csv(here::here("inputs/data/fig_3.csv"))

state <- map_data("state")

#data <- read_dta(here::here('data/nchs/nchs_births_pop_1990_2019.dta'))

cleaned_data <- uncleaned_data [-c(1, 12), ]

state_full <- tibble(
  stname=cleaned_data$stname,
  full=c("alabama", "arkansas", "arizona", "california", "colorado", "connecticut", "district of columbia", "delaware",
         "florida", "georgia", "iowa", "idaho", "illinois", "indiana", "kansas", "kentucky", "louisiana", "massachusetts", "maryland", "maine", "michigan",
         "minnesota", "missouri", "mississippi", "montana", "north carolina", "north dakota", "nebraska", "new hampshire", "new jersey", "new mexico",
         "nevada", "new york", "ohio", "oklahoma", "oregon", "pennsylvania", "rhode island", "south carolina", "south dakota",
         "tennessee", "texas", "utah", "virginia", "vermont", "washington", "wisconsin","west virginia", "wyoming"
  )
)

cleaned_data <- cleaned_data |>
  left_join(state_full, by = "stname") |>
  select(-stname) |>
  rename(stname = full)

merged_data <- merge(state, cleaned_data, by.x = "region", by.y = "stname", all.x = TRUE)

#Write to CSV
write_csv(
  x = merged_data,
  file = "outputs/data/figure_3a.csv"
)

##Figure 4##
rawdata <- read.csv(here::here("inputs/data/figs_2a_2b.csv"))

figure4 <- rawdata |>
  select(
    year,brate_1519,brate_2024,brate_2529,brate_3034,brate_3539,brate_4044
  )

figure4$young <- figure4 |>
  select(
    brate_1519,brate_2024,brate_2529
  ) |>
  rowMeans()

figure4$old <- figure4 |>
  select(
    brate_3034,brate_3539,brate_4044
  ) |>
  rowMeans()

#Write to CSV
write_csv(
  x = figure4,
  file = "outputs/data/table_2.csv"
)

figure4 <- figure4 |>
  pivot_longer(cols = c("young", "old"),
               names_to = "age_group",
               values_to = "brate")

#Write to CSV
write_csv(
  x = figure4,
  file = "outputs/data/figure_4.csv"
)