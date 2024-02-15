# Echoes of Economic Downturn: Investigating the Persistent Impact of the Great Recession on Birth Rates Among Young Americans

## Overview

This repository contains a replicated paper from [Kearney, Levine and Pardue (2022) 's paper, "The Puzzle of Falling US Birth Rates since the Great Recession"](https://www.aeaweb.org/articles?id=10.1257/jep.36.1.151). The paper delves into the long-term effects of the Great Recession on the fertility decisions of the young adult population in the U.S. It utilizes an extensive dataset from the National Vital Statistics Reports, spanning from 1980 to 2020, to analyze trends over time and across various demographics. Through a rigorous quantitative analysis, the study reveals a notable decline in birth rates among young Americans during and following the recession. The paper aims to provide insights into the relationship between economic stability and reproductive choices, highlighting the need for policies that support young individuals during economic crises.

## Files structure

-   `inputs/` holds the `data/` directory with original dataset, `llm/` directory with llm usage, and `sketch` directory with the sketch for dataset and observation.
-   `outputs/` contains the `paper/` directory featuring the paper's PDF, the R Markdown script, and sourced references and `data/` directory with cleaned dataset.
-   `scripts/` contains the R script employed for data cleaning, simulation, and testing.
-   `replications/` holds the `plots/` folder with replicated plots, and `scripts/` directory that contains R script employed for replicating the plots.

## LLM Usage

The Chat-GPT4 model contributed to the creation of data validation tests.


---

*Note: Our script does not include a feature for data downloading. For those interested in acquiring the datasets, please consult the study by Kearney, Levine, and Pardue (2022), titled "The Puzzle of Falling US Birth Rates since the Great Recession," available through their [openICPSR project page](https://www.openicpsr.org/openicpsr/project/144981/version/V1/view?path=/openicpsr/144981/fcr:versions/V1/data&type=folder). The relevant files are named fig_1.csv, fig_2a_2b.csv, and fig_3.csv. After downloading, use the read function in R to load the data and execute our analysis R scripts.*

---
