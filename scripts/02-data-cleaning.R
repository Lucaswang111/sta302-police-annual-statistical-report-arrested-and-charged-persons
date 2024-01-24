library(janitor)
data <- read.csv("inputs/data/Arrested_Charged_Person.csv") |>
  clean_names()
data[data == "Unknown"] <- NA
data <- data[complete.cases(data), ]
head(data)
write_csv(
  x = data,
  file = "inputs/data/Arrested_Charged_Person.csv"
)