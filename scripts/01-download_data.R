#### Preamble ####
# Purpose: Downloads, saves, and reads data from the OpenDataToronto portal
# Author: Yuanyi (Leo) Liu, Qi Er (Emma) Teng
# Date: 13 February 2024
# Contact: leoy.liu@mail.utoronto.ca, e.teng@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)


#### Download data ####
# Each package is associated with a unique id  found in the "For 
# Developers" tab of the relevant page from Open Data Toronto
# source: https://open.toronto.ca/dataset/neighbourhood-crime-rates/
toronto_crime_rates <-
  list_package_resources("neighbourhood-crime-rates") |>
  filter(name == "neighbourhood-crime-rates - 4326.csv") |>
  get_resource()


#### Save data ####
write_csv(
  x = toronto_crime_rates,
  file = "toronto_crime_rates.csv"
)

head(toronto_crime_rates)
