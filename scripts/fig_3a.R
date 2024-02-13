library(tidyverse)
library(dplyr)
library(sf)
library(here)
library(ggplot2)
library(mapdata)
library(haven)

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

write_csv(
  x = merged_data,
  file = "outputs/data/figure_3a.csv"
)