#### Preamble ####
# Purpose: Cleans the raw plane data
# Author: Yuanyi (Leo) Liu
# Date: 21 January 2024
# Contact: leoy.liu@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)


#### Cleaned data ####
raw_data <- read_csv("inputs/data/toronto_crime_rates.csv")

# Removing unwanted columns
cleaned_data <- raw_data %>% select(-c(X_id, HOOD_ID, POPULATION_2023, geometry))

# Removing rows with NA values
cleaned_data <- na.omit(cleaned_data)

# Save data #
write_csv(
  x = cleaned_data,
  file = "cleaned_toronto_crime_rates.csv"
)

# Descriptive Summaries #
str(cleaned_data)
summary(cleaned_data)



#### Summary Table Dataset ####

# Read the data
crime_data <- read.csv(here("inputs/data/cleaned_toronto_crime_rates.csv"))

# Remove unnecessary columns
crime_data <- crime_data %>%
  select(-grep("RATE", names(crime_data)))

# Gather the data to a long format
crime_data_long <- crime_data %>%
  gather(key = "Crime_Year", value = "Count", -AREA_NAME)

# Extract year and crime type from the 'Crime_Year' column
crime_data_long <- crime_data_long %>%
  separate(Crime_Year, into = c("Crime_Type", "Year"), sep = "_") %>%
  mutate(Year = as.numeric(Year))

# Aggregate the data by year and crime type
crime_data_summary <- crime_data_long %>%
  group_by(Crime_Type, Year) %>%
  summarise(Total = sum(Count, na.rm = TRUE), .groups = "drop")

# Creating the summary table
summary_table <- crime_data_summary %>%
  group_by(Crime_Type, Year) %>%
  summarise(Total_Cases = sum(Total, na.rm = TRUE), .groups = "drop") %>%
  spread(key = Year, value = Total_Cases)

# Define a mapping for crime types
readable_crime_types <- c('ASSAULT' = 'Assault',
                          'AUTOTHEFT' = 'Auto Theft',
                          'BIKETHEFT' = 'Bike Theft',
                          'BREAKENTER' = 'Break and Enter',
                          'HOMICIDE' = 'Homicide',
                          'ROBBERY' = 'Robbery',
                          'SHOOTING' = 'Shooting Incidents',
                          'THEFTFROMMV' = 'Theft from Motor Vehicles',
                          'THEFTOVER' = 'Major Theft')

# Update the Crime_Type column
summary_table$Crime_Type <- readable_crime_types[summary_table$Crime_Type]

# Save data #
write_csv(
  x = summary_table,
  file = "summary_table.csv"
)



#### Two Types Crime Dataset ####
summary_table$Category <- ifelse(summary_table$Crime_Type %in% c("Assault", "Break and Enter", "Homicide", "Robbery", "Shooting Incidents"), "Violent", "Non-Violent")

# Group data by the new Category and sum the cases for each year
two_types_crime <- summary_table %>%
  group_by(Category) %>%
  summarise(across(`2014`:`2023`, ~sum(.x, na.rm = TRUE)))

# Save data #
write_csv(
  x = two_types_crime,
  file = "two_types_crime.csv"
)

