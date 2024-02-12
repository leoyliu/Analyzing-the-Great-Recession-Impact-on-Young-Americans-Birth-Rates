#### Preamble ####
# Purpose: Simulates data
# Author: Yuanyi (Leo) Liu
# Email: leoy.liu@mail.utoronto.ca
# Date: 21 January 2024
# License: MIT


#### Workspace setup ####
# install.packages("janitor")
# install.packages("tidyverse")
library(janitor)
library(tidyverse)


#### Simulate ####

# In this simulation, we only want the number of cases reported of each crime type from 2014 to 2023.
# First, A tibble is created with initial Crime_Type column.
# Second, A loop runs through each year from 2014 to 2023.
# In each iteration of the loop, a new column is added to simulated_data for the respective year. 
# The sample function generates random counts for the crimes for that year.
# Third, replace = TRUE in the sample function allows for the possibility of the same number being chosen more than once.

set.seed(853)

crime_types <- c("Assault", "Auto Theft", "Bike Theft", "Break and Enter", "Homicide", "Robbery", "Shooting Incidents", "Theft from Motor Vehicles", "Major Theft")

# Initialize a tibble
simulated_data <- tibble(Crime_Type = crime_types)

# Add columns for each year from 2014 to 2023 with simulated data
for(year in 2014:2023) {
  simulated_data[[as.character(year)]] <- sample(500:10000, length(crime_types), replace = TRUE)
}

# View the simulated data
print(simulated_data)