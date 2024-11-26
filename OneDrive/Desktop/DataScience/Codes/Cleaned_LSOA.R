# Importing required libraries
install.packages("data.table")
library(data.table)
library(tidyverse)
library(dplyr)


# Setting the working directory
setwd("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam")

# Reading the cleaned town population data
cleaned_population = read.csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/Cleaned_Population.csv")

# Reading the postcode to LSOA mapping data
lsoa = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/Postcode to LSOA.csv/Postcode to LSOA.csv")

# Cleaning the LSOA data
pattern = ' .*$'
lsoa_cleaned = lsoa %>%
  select(lsoa11cd, pcds) %>% 
  mutate(short_postcode = gsub(pattern, "", pcds)) %>% 
  right_join(cleaned_population, by = "short_postcode") %>% 
  group_by(lsoa11cd) %>% 
  select(lsoa11cd, short_postcode, Town, District, Country)

# Renaming the first column to "LSOA code"
colnames(lsoa_cleaned)[1] = "LSOA code"

# Viewing the cleaned LSOA data
view(lsoa_cleaned)

# Writing the cleaned LSOA data to a CSV file
write.csv(lsoa_cleaned, "C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/Cleaned_LSOA.csv", row.names = FALSE, col.names = FALSE)
