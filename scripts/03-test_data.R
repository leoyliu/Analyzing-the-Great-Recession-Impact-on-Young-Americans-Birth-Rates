#### Preamble ####
# Purpose: Tests
# Author: Yuanyi (Leo) Liu
# Date: 24 January 2024
# Contact: leoy.liu@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)


#### Test data ####
# Load dataset
cleaned_toronto_crime_rates <- read.csv("inputs/data/cleaned_toronto_crime_rates.csv", check.names = FALSE)
summary_table <- read.csv("inputs/data/summary_table.csv", check.names = FALSE)
two_types_crime <- read.csv("inputs/data/two_types_crime.csv", check.names = FALSE)

# Test 1: Check for missing values for cleaned_toronto_crime_rates
test1_result <- !any(is.na(cleaned_toronto_crime_rates))
print(paste("Test 1 Passed:", test1_result))

# Test 2: Check for duplicated rows for cleaned_toronto_crime_rates
test2_result <- !any(duplicated(cleaned_toronto_crime_rates))
print(paste("Test 2 Passed:", test2_result))

# Test 3: Check the number of columns for summary_table
expected_num_cols <- 11
test3_result <- ncol(summary_table) == expected_num_cols
print(paste("Test 3 Passed:", test3_result))

# Test 4: Check the number of rows for summary_table
expected_num_rows <- 9
test4_result <- nrow(summary_table) == expected_num_rows
print(paste("Test 4 Passed:", test4_result))

# Test 5: Check for missing values for summary_table
test5_result <- !any(is.na(summary_table))
print(paste("Test 5 Passed:", test5_result))

# Test 6: Check for duplicated rows for summary_table
test6_result <- !any(duplicated(summary_table))
print(paste("Test 6 Passed:", test6_result))

# Test 7: Check for positive values in year columns
year_columns <- c('2014', '2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023')
test7_result <- all(sapply(summary_table[year_columns], function(x) all(x >= 0)))
print(paste("Test 7 Passed:", test7_result))

# Test 8: Check column types for summary_table
test8_result <- is.character(summary_table$Crime_Type)
print(paste("Test 8 Passed:", test8_result))

# Test 9: Check the number of columns for two_types_crime
expected_num_cols <- 11
test9_result <- ncol(two_types_crime) == expected_num_cols
print(paste("Test 9 Passed:", test9_result))

# Test 10: Check the number of rows for two_types_crime
expected_num_rows <- 2
test10_result <- nrow(two_types_crime) == expected_num_rows
print(paste("Test 10 Passed:", test10_result))

# Test 11: Check for missing values for two_types_crime
test11_result <- !any(is.na(two_types_crime))
print(paste("Test 11 Passed:", test11_result))

# Test 12: Check for duplicated rows for two_types_crime
test12_result <- !any(duplicated(summary_table))
print(paste("Test 12 Passed:", test12_result))