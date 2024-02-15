#### Preamble ####
# Purpose: Replicates graphs from targeted project
# Author: Yuanyi (Leo) Liu, Qi Er (Emma) Teng
# Date: 14 February 2024
# Contact: leoy.liu@mail.utoronto.ca, e.teng@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
# install.packages("ggprism")
# install.packages("ggthemes")

library(tidyverse)


#### Replications ####


## Figure 3 ##

# Read in the raw data
figure3 <- read.csv(here::here("outputs/data/figure_3a.csv"))

ggplot(figure3, aes(x = long, y = lat, group=group)) +
  geom_polygon(aes(fill = brate1544_thsnds_ch_pct)) +
  scale_fill_gradient(low = 'darkred', high = '#FFCCCB') +
  labs(title = 'Change in Birth Rate by State Over Time',
       fill = 'Change in Birth Rate') +
  theme_void()

ggsave(
  "replication/plots/figure3.png"
)