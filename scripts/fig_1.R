#Workspace set up

library(tidyverse)
library(dplyr)
library(here)
library(ggplot2)

figure <- read.csv(here::here("inputs/data/fig_1.csv"))

write_csv(
  x = figure,
  file = "outputs/data/figure_1.csv"
)