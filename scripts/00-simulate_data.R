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
# The simulated data is derived from a normal distribution instead of a poisson distribution since birth rate can be more than just integers.
# It is ensured with the abs() that old positive birth rate is recorded.

set.seed(853)

# Initialize a tibble
simulated_data <- tibble(
  year = c(1980:2020),
    young = abs(rnorm(n = 41,mean = 80.5, sd=10.5)),
  old = abs(rnorm(n = 41,mean = 25.5, sd=5.5))
)

# View the simulated data
print(simulated_data)