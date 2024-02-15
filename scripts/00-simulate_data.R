#### Preamble ####
# Purpose: Simulates data
# Author: Yuanyi (Leo) Liu, Qi Er (Emma) Teng
# Email: leoy.liu@mail.utoronto.ca, e.teng@mail.utoronto.ca
# Date: 8 February 2024
# License: MIT


#### Workspace setup ####
# install.packages("tidyverse")
# install.packages("dplyr")

library(tidyverse)
library(dplyr)


#### Simulate ####


# In this simulation, we focus on two different age categories for birth rate data: younger and older groups.
# The simulation starts with birth rate of 6 age groups.
# The simulated data is derived from a normal distribution instead of a poisson distribution since birth rate can be more than just integers.
# By applying the abs() function, we guarantee the recording of only positive birth rates for the older age group.

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

simulated_data$Younger <- simulated_data |>
  select(
    br_1519,br_2024,br_2529
  ) |>
  rowMeans()

simulated_data$Older <- simulated_data |>
  select(
    br_3034,br_3539,br_4044
  ) |>
  rowMeans()

# View the simulated data
print(simulated_data)