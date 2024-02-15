#### Preamble ####
# Purpose: Simulates data
# Author: Yuanyi (Leo) Liu, Qi Er (Emma) Teng
# Email: leoy.liu@mail.utoronto.ca, e.teng@mail.utoronto.ca
# Date: 21 January 2024
# License: MIT


#### Workspace setup ####
# install.packages("tidyverse")
library(tidyverse)
library(dplyr)

#### Simulate ####

# In this simulation, we only want two sets of birth rate data for two different age groups, young and old.
# The simulation start with birth rate of 6 age groups.
# The data is derived from a normal distribution instead of a poisson distribution since birth rate can be more than just integers.
# It is ensured with the abs() that old positive birth rate is recorded.

set.seed(853)

# Initialize a tibble
simulated_data <- tibble(
  year = c(1980:2020),
  br_1519 = abs(rnorm(n = 41,mean = 50.5, sd=10.5)),
  br_2024 = abs(rnorm(n = 41,mean = 55.5, sd=10.5)),
  br_2529 = abs(rnorm(n = 41,mean = 80.5, sd=5.5)),
  br_3034 = abs(rnorm(n = 41,mean = 55.5, sd=5.5)),
  br_3539 = abs(rnorm(n = 41,mean = 35.5, sd=5.5)),
  br_4044 = abs(rnorm(n = 41,mean = 25.5, sd=5.5)),
)

simulated_data$young <- simulated_data |>
  select(
    br_1519,br_2024,br_2529
  ) |>
  rowMeans()

simulated_data$old <- simulated_data |>
  select(
    br_3034,br_3539,br_4044
  ) |>
  rowMeans()

# View the simulated data
print(simulated_data)