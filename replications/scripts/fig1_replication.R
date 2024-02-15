#### Preamble ####
# Purpose: Replicates graphs from targeted project
# Author: Yuanyi (Leo) Liu, Qi Er (Emma) Teng
# Date: 14 February 2024
# Contact: leoy.liu@mail.utoronto.ca, e.teng@mail.utoronto.ca
# License: MIT

# Portions of the code used to create visualizations were adapted from methodologies shared in the 
# original paper and previous example (GitHub link: https://github.com/KCtt457/us-birth-rates-decline).

#### Workspace setup ####
# install.packages("tidyverse")
# install.packages("ggprism")
# install.packages("ggthemes")

library(tidyverse)
library(ggprism)
library(ggthemes)


#### Replications ####


## Figure 2 ##

# Read in the raw data
fig1_data <- read_csv("inputs/data/fig_1.csv")

# Make plot
fig1_data %>%
  ggplot(aes(x = year,
             y = brate_all)) +
  geom_line(color = "#08519C") +
  geom_vline(xintercept = 2007,
             linetype = "dashed",
             color = "darkgrey") +
  scale_x_continuous(
    guide = "prism_minor",
    limits = c(1980, 2020),
    breaks = seq(1980, 2020, by = 5),
    minor_breaks = seq(1980, 2020, by = 1)
  ) +
  scale_y_continuous(limits = c(50, 80), breaks = seq(50, 80, by = 5)) +
  theme_classic() +
  theme(
    panel.grid.major.y = element_line(),
    axis.ticks.length.x = unit(7, "pt"),
    prism.ticks.length.x = unit(4, "pt")
  ) +
  geom_text(
    aes(x = 2007, y = 70),
    nudge_x = 2,
    nudge_y = 1,
    label = "2007"
  ) +
  labs(
    title = "Trend in US Birth Rates",
    x = "",
    y = "Births per 1,000 women age 15-44",
    caption = "Source: Birth Rates collected from CDC Vital Statistics Births Reports for 2015, 2019 and 2020."
  )

# Save plot
ggsave(
  "replication/plots/figure1.png",
  height = 100,
  width = 133.33,
  units = "mm",
  dpi = 900
)