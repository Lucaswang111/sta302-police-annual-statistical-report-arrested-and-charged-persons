data <- read.csv("Arrested_Charged_Person.csv") |>
  clean_names()
data[data == "Unknown"] <- NA
data <- data[complete.cases(data), ]
head(data)

tab1 <- ftable(data$age_group,data$sex)
chisq.test(tab1)
tab2 <- ftable(data$category,data$sex)
chisq.test(tab2)
tab3 <- ftable(data$category,data$age_group)
chisq.test(tab3)