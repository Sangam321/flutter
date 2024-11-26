# Load necessary libraries
library(tidyverse)
library(dplyr)
library(stringi)
library(scales)

# Set the working directory
setwd("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam")

# Read CSV files
hp_2020 = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/Housing/pp-2020.csv", show_col_types = FALSE)
hp_2021 = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/Housing/pp-2021.csv", show_col_types = FALSE)
hp_2022 = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/Housing/pp-2022.csv", show_col_types = FALSE)
hp_2023 = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/Housing/pp-2023.csv", show_col_types = FALSE)

# Assign column names for all datasets
colnames(hp_2020) = colnames(hp_2021) = colnames(hp_2022) = colnames(hp_2023) = c("ID", "Price", "Year", "PostCode", "PAON", "SAON", "FL", "House_Num", "Flat", "Street_Name", "Locality", "Town", "District", "Country", "Type1", "Type2")

# Combine datasets, remove missing values and duplicates, and convert to tibble
HousePrices_combined = bind_rows(hp_2020, hp_2021, hp_2022, hp_2023) %>%
  na.omit() %>%      
  distinct() %>%     
  as_tibble()

# Write the cleaned data to a CSV file
write.csv(HousePrices_combined, "C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/HousePricing_from(2020-2023).csv", row.names = FALSE)

# Filter the dataset for specific counties (modify as needed for Bristol and Cornwall)
Filtered_HousePrices = filter(HousePrices_combined, Country == 'CITY OF BRISTOL' | Country == 'CORNWALL')

# Define a regex pattern to remove space and everything after it
pattern = ' .*$'

# Clean and refine the filtered data
Filtered_HousePrices_cleaned = Filtered_HousePrices %>%
  mutate(short_PostCode = gsub(pattern, "", PostCode)) %>%     
  mutate(Year = str_trim(substring(Year, 1, 4))) %>%            
  select(PostCode, short_PostCode, Year, District, Town, Price, Country) %>%  
  na.omit() %>%      # Remove rows with missing values
  distinct() %>%     # Keep only unique rows
  as_tibble()

# View the cleaned data
View(Filtered_HousePrices_cleaned)

# Export the cleaned  data to a CSV file
write.csv(Filtered_HousePrices_cleaned, "C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/Cleaned_HousePricing(2020-2023).csv", row.names = FALSE)
