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
# The simulated data is derived from a normal distribution instead of a poisson distribution since birth rate can be more than just integers.
# By applying the abs() function, we guarantee the recording of only positive birth rates for the older age group.

set.seed(853)

# Initialize a tibble
# TODO:是不是写反了
simulated_data <- tibble(
  year = c(1980:2020),
    Elder = abs(rnorm(n = 41,mean = 80.5, sd=10.5)),
  Younger = abs(rnorm(n = 41,mean = 25.5, sd=5.5))
)

# View the simulated data
print(simulated_data)