#### Preamble ####
# Purpose: Simulate the data 
# Author: wangh563
# Date: 24 January 2024 

library(tibble)
set.seed(563)

num_rows <- 100
sim_data <- tibble(
  ID = 1:num_rows,
  ARREST_YEAR = sample(2014:2022, num_rows, replace = TRUE),
  DIVISION = paste0("D", sample(1:100, num_rows, replace = TRUE)),
  HOOD_158 = sample(1:200, num_rows, replace = TRUE),
  NEIGHBOURHOOD_158 = rep(paste("Neigh", 1:50), length.out = num_rows),
  SEX = sample(c("Male", "Female"), num_rows, replace = TRUE),
  AGE_COHORT = sample(c("25 to 34","<18","18 to 24","35 to 44","45 to 54",
                     "55 to 64","65+","Unknown"), num_rows, replace = TRUE),
  AGE_GROUP = sample(c("Adult","Youth","Unknown"), num_rows, replace = TRUE),
  CATEGORY = sample(c("Other Criminal Code Violations",
                   "Crimes Against the Person",          
                   "Controlled Drugs and Substances Act",
                   "Crimes Against Property",           
                   "Criminal Code Traffic",              
                   "Other Federal Statute Violations",   
                   "Total Arrests" ), num_rows, replace = TRUE),
  SUBTYPE = sample(c("Other","Assaults","Theft Under $5000","Break and Enter",                              
                  "Other Criminal Violations - Offensive Weapons",
                  "Drive While Disqualified","Drive While Impaired / Over 80",
                  "Firearm-Related","Fraud","Robbery","Sexual Violations","Refuse Sample",                                
                  "Dangerous Driving" ,"Theft Over $5000","Fail to Remain","Attempted Murder",
                  "Total Arrests"), num_rows, replace = TRUE),
  ARREST_COUNT = sample(1:100, num_rows, replace = TRUE)
)

head(sim_data)
