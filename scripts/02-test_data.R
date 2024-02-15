#### Preamble ####
# Purpose: Tests
# Author: Yuanyi (Leo) Liu, Qi Er (Emma) Teng
# Date: 13 February 2024
# Contact: leoy.liu@mail.utoronto.ca, e.teng@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)


#### Test data ####

# Load dataset
figure_1 <- read.csv("outputs/data/figure_1.csv", check.names = FALSE)
figure_2 <- read.csv("outputs/data/figure_2.csv", check.names = FALSE)
figure_3 <- read.csv("outputs/data/figure_3.csv", check.names = FALSE)
figure_4 <- read.csv("outputs/data/figure_4.csv", check.names = FALSE)
table_2 <- read.csv("outputs/data/table_2.csv", check.names = FALSE)

# Test 1: Check for missing values for figure_1
test1_result <- !any(is.na(figure_1))
print(paste("Test 1 Passed:", test1_result))

# Test 2: Check for missing values for figure_2
test2_result <- !any(is.na(figure_2))
print(paste("Test 2 Passed:", test2_result))

# Test 3: Check for missing values for figure_3
test3_result <- !any(is.na(figure_3))
print(paste("Test 3 Passed:", test3_result))

# Test 4: Check for missing values for figure_4
test4_result <- !any(is.na(figure_4))
print(paste("Test 4 Passed:", test4_result))

# Test 5: Check for missing values for table_2
test5_result <- !any(is.na(table_2))
print(paste("Test 5 Passed:", test5_result))

# Test 6: Check for duplicated rows for figure_1
test6_result <- !any(duplicated(figure_1))
print(paste("Test 6 Passed:", test6_result))

# Test 7: Check for duplicated rows for figure_2
test7_result <- !any(duplicated(figure_1))
print(paste("Test 7 Passed:", test7_result))

# Test 8: Check for duplicated rows for figure_3
test8_result <- !any(duplicated(figure_1))
print(paste("Test 8 Passed:", test8_result))

# Test 9: Check for duplicated rows for figure_4
test9_result <- !any(duplicated(figure_1))
print(paste("Test 9 Passed:", test9_result))

# Test 10: Check for duplicated rows for table_2
test10_result <- !any(duplicated(figure_1))
print(paste("Test 10 Passed:", test10_result))