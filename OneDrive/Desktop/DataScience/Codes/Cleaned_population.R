# Load necessary libraries
library(tidyverse)
library(dplyr)
library(stringi)
library(scales)

# Set the working directory to where the data files are located
setwd("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam")

# Read in the raw house prices and population data from CSV files
house_prices_raw = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/Combined_HousePricing(2020-2023).csv")
population_data = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/Population2011_1656567141570.csv", show_col_types = FALSE)

# Filter data to include only towns in Bristol and Cornwall
towns_filtered = filter(house_prices_raw, Country == 'CITY OF BRISTOL' | Country == 'CORNWALL')

# Define a regex pattern to extract the short postcode
postcode_pattern = ' .*$'

# Calculate population estimates for each year from 2011 to 2023
population_data = population_data %>%
  mutate(short_postcode = gsub(postcode_pattern, "", Postcode)) %>%
  group_by(short_postcode) %>%
  summarise_at(vars(Population), list(Pop2011 = sum)) %>%
  mutate(
    Pop2012 = 1.00695353132322269 * Pop2011,
    Pop2013 = 1.00669740535540783 * Pop2012,
    Pop2014 = 1.00736463978721671 * Pop2013,
    Pop2015 = 1.00792367505802859 * Pop2014,
    Pop2016 = 1.00757874492811929 * Pop2015,
    Pop2017 = 1.00679374473924223 * Pop2016,
    Pop2018 = 1.00605929132212552 * Pop2017,
    Pop2019 = 1.00561255390388033 * Pop2018,
    Pop2020 = 1.00561255390388033 * Pop2019,
    Pop2021 = 1.00561255390388033 * Pop2020,
    Pop2022 = 1.00561255390388033 * Pop2021,
    Pop2023 = 1.00561255390388033 * Pop2022
  ) %>%
  select(short_postcode, Pop2020, Pop2021, Pop2022, Pop2023)

# Clean and merge the house prices data with the population data
towns_filtered = towns_filtered %>%
  mutate(short_postcode = gsub(postcode_pattern, "", PostCode)) %>%
  mutate(Year = str_trim(substring(Year, 1, 4))) %>%
  left_join(population_data, by = "short_postcode") %>%
  select(PostCode, short_postcode, Year, Town, District, Country, Pop2020, Pop2021, Pop2022, Pop2023) %>%
  group_by(short_postcode) %>%
  arrange(Country) %>%
  as_tibble() %>%
  na.omit() %>%
  distinct()

# View the cleaned and merged data
View(towns_filtered)

# Save the cleaned data to a new CSV file
write.csv(towns_filtered, "C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/Cleaned_Population.csv", row.names = FALSE)
