#### Preamble ####
# Purpose: Downloads and saves the data from https://open.toronto.ca/dataset/police-annual-statistical-report-arrested-and-charged-persons/
# Author: wangh563
# Date: 24 January 2024 

library(opendatatoronto)
library(tidyverse)
library(janitor)

# https://open.toronto.ca/dataset/police-annual-statistical-report-arrested-and-charged-persons/
data <- list_package_resources("https://open.toronto.ca/dataset/police-annual-statistical-report-arrested-and-charged-persons/")|>
  filter(row_number()==2) |>
  get_resource()

write_csv(
  x = data,
  file = "inputs/data/Arrested_Charged_Person.csv"
)

head(data)
unique(data$SUBTYPE)
