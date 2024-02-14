library(tidyverse)
library(dplyr)
library(here)
library(mapdata)
library(ggplot2)
library(haven)

#figure1
figure1 <- read.csv(here::here("outputs/data/figure_1.csv"))

ggplot(figure1,
       aes(x = year, y = brate_all)) + 
  geom_line(color="red") +
  geom_vline(xintercept = 2007, color = "black", linetype = "dashed") +
  annotate("text", x = 2007, y = 60, label = "Global Financial Crisis of 2007-2008", 
           color = "black", angle = 90, vjust = -0.5) +
  labs(title = "Birth Rate in America overtime",
       x = "Years",
       y = "Birth rate") +
  theme(panel.background = element_rect(fill = "white"),
        panel.grid.major = element_line(colour = "grey"),
        plot.title = element_text(color = "black", size = 14, face = "bold"),
        axis.title = element_text(color = "black"))

# Save plot
ggsave(
  "replication/graphs/figure1.png"
)


#figure2
figure2 <- read.csv(here::here("outputs/data/figure_2.csv"))

ggplot(figure2, aes(x = year, y = brate, color = age_group)) +
  geom_line(linewidth=1) +
  geom_vline(xintercept = 2007, color = "black", linetype = "dashed") + 
  annotate("text", x = 2007, y = 60, label = "2007", 
           color = "black", angle = 90, vjust = -0.5) +
  labs(title = "Birth Rate by Age Group Over Time",
       x = "Year",
       y = "Birth Rate") +
  theme(panel.background = element_rect(fill = "white"),
        panel.grid.major = element_line(colour = "grey"),
        plot.title = element_text(color = "black", size = 14, face = "bold"),
        axis.title = element_text(color = "black"))

# Save plot
ggsave(
  "replication/graphs/figure2.png"
)


#Figure3
figure3a <- read.csv(here::here("outputs/data/figure_3a.csv"))

ggplot(figure3a, aes(x = long, y = lat, group=group)) +
  geom_polygon(aes(fill = brate1544_thsnds_ch_pct)) +
  scale_fill_gradient(low = 'darkred', high = '#FFCCCB') +
  labs(title = 'Change in Birth Rate by State Over Time',
       fill = 'Change in Birth Rate') +
  theme_void()

ggsave(
  "replication/graphs/figure3a.png"
)