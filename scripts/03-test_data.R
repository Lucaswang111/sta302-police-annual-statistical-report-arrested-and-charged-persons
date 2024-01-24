library(tidymodels)
library(bruceR)
library(knitr)
library(janitor)
library(paletteer)

citation("bruceR")
citation("tidymodels")
print(citation("knitr"),bibtex=TRUE)
citation("janitor")
citation("ggplot2")
citation("opendatatoronto")
citation("paletteer")
citation()

data <- read.csv("Arrested_Charged_Person.csv") |>
  clean_names()
data[data == "Unknown"] <- NA
data <- data[complete.cases(data), ]
head(data)

Freq(data$sex)
Freq(data$age_group)
Freq(data$age_cohort)
Freq(data$category)
Freq(data$division)

eda1 <- data |>
  group_by(arrest_year) |>
  summarize(crime = n())
ggplot(eda1, aes(x = arrest_year, y = crime)) +
  geom_line(color="blue",linewidth = 2) + 
  geom_text(aes(label = crime), vjust = 0.5, hjust = -0.2, size = 4) +
  theme_bw() +
  labs(title = "Crime Count Over Years", x = "Year", y = "Count")

eda2 <- data |>
  group_by(category) |>
  summarize(crime = n())
ggplot(eda2, aes(x = category, y = crime, fill = category)) +
  geom_bar(stat = "identity", color = "black") + 
  geom_text(aes(label = crime), vjust = -0.5, hjust = 0.5, size = 3, color = "black") +
  scale_fill_brewer(palette = "Set1") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Crime Count by Category", x = "Category", y = "Count")

eda3 <- data %>%
  group_by(sex, age_group) %>%
  summarize(crime = n(), .groups = "drop")
ggplot(eda3, aes(x = age_group, y = crime, fill = sex)) + 
  geom_bar(stat = "identity", position = "dodge", color = "black") + 
  geom_text(aes(label = crime), position = position_dodge(width = 0.9), vjust = -0.5, size = 3, color = "black") +
  scale_fill_brewer(palette = "Set1") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Crime Count by Sex and Age_group",
       x = "Age_group", y = "Count")

eda4 <- data %>%
  group_by(sex, arrest_year) %>%
  summarize(crime = n(), .groups = "drop")
ggplot(eda4, aes(x = arrest_year, y = crime, color = sex)) + 
  geom_line(aes(linetype = sex), linewidth = 2) + 
  geom_text(aes(label = crime), position = position_dodge(width = 0.9), vjust = -0.5, size = 3, color = "black") +
  scale_color_brewer(palette = "Set1") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Crime Count by SEX and ARREST_YEAR",
       x = "Arrest_year", y = "Count", color = "Sex") +
  guides(linetype = guide_legend(title = "Sex"))

eda5 <- data %>%
  group_by(sex, category) %>%
  summarize(crime = n(), .groups = "drop")
ggplot(eda5, aes(x = category, y = crime, fill = sex)) + 
  geom_bar(stat = "identity", position = "dodge", color = "black") + 
  geom_text(aes(label = crime), position = position_dodge(width = 0.9), vjust = -0.5, size = 3, color = "black") +
  scale_color_brewer(palette = "Set1") +  
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Crime Count by Sex and Category",
       x = "Category", y = "Count")


eda6 <- data %>%
  group_by(division, category) %>%
  summarize(crime = n(), .groups = "drop")
ggplot(eda6, aes(x = division, y = crime, fill = category)) + 
  geom_bar(stat = "identity", position = "stack", color = "black") + 
  scale_fill_paletteer_d("RColorBrewer::Paired") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Crime Count by Division and Category",
       x = "Division", y = "Count")