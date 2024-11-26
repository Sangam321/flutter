#Load library
library(data.table)
library(tidyverse)
library(stringr)
library(lubridate)
#set working directory
setwd("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam")

#Importing Bristol
Crime_2021_05_Bristol = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2021-05/2021-05-avon-and-somerset-street.csv")
Crime_2021_06_Bristol = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2021-06/2021-06-avon-and-somerset-street.csv")
Crime_2021_07_Bristol = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2021-07/2021-07-avon-and-somerset-street.csv")
Crime_2021_08_Bristol = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2021-08/2021-08-avon-and-somerset-street.csv")
Crime_2021_09_Bristol = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2021-09/2021-09-avon-and-somerset-street.csv")
Crime_2021_10_Bristol = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2021-10/2021-10-avon-and-somerset-street.csv")
Crime_2021_11_Bristol = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2021-11/2021-11-avon-and-somerset-street.csv")
Crime_2021_12_Bristol = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2021-12/2021-12-avon-and-somerset-street.csv")


Crime_2022_01_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-01/2022-01-avon-and-somerset-street.csv")
Crime_2022_02_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-02/2022-02-avon-and-somerset-street.csv")
Crime_2022_03_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-03/2022-03-avon-and-somerset-street.csv")
Crime_2022_04_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-04/2022-04-avon-and-somerset-street.csv")
Crime_2022_05_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-05/2022-05-avon-and-somerset-street.csv")
Crime_2022_06_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-06/2022-06-avon-and-somerset-street.csv")
Crime_2022_07_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-07/2022-07-avon-and-somerset-street.csv")
Crime_2022_08_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-08/2022-08-avon-and-somerset-street.csv")
Crime_2022_09_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-09/2022-09-avon-and-somerset-street.csv")
Crime_2022_10_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-10/2022-10-avon-and-somerset-street.csv")
Crime_2022_11_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-11/2022-11-avon-and-somerset-street.csv")
Crime_2022_12_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-12/2022-12-avon-and-somerset-street.csv")

Crime_2023_01_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-01/2023-01-avon-and-somerset-street.csv")
Crime_2023_02_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-02/2023-02-avon-and-somerset-street.csv")
Crime_2023_03_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-03/2023-03-avon-and-somerset-street.csv")
Crime_2023_04_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-04/2023-04-avon-and-somerset-street.csv")
Crime_2023_05_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-05/2023-05-avon-and-somerset-street.csv")
Crime_2023_06_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-06/2023-06-avon-and-somerset-street.csv")
Crime_2023_07_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-07/2023-07-avon-and-somerset-street.csv")
Crime_2023_08_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-08/2023-08-avon-and-somerset-street.csv")
Crime_2023_09_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-09/2023-09-avon-and-somerset-street.csv")
Crime_2023_10_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-10/2023-10-avon-and-somerset-street.csv")
Crime_2023_11_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-11/2023-11-avon-and-somerset-street.csv")
Crime_2023_12_Bristol <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-12/2023-12-avon-and-somerset-street.csv")


#Importing cornwall
Crime_2021_05_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2021-05/2021-05-devon-and-cornwall-street.csv")
Crime_2021_06_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2021-06/2021-06-devon-and-cornwall-street.csv")
Crime_2021_07_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2021-07/2021-07-devon-and-cornwall-street.csv")
Crime_2021_08_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2021-08/2021-08-devon-and-cornwall-street.csv")
Crime_2021_09_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2021-09/2021-09-devon-and-cornwall-street.csv")
Crime_2021_10_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2021-10/2021-10-devon-and-cornwall-street.csv")
Crime_2021_11_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2021-11/2021-11-devon-and-cornwall-street.csv")
Crime_2021_12_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2021-12/2021-12-devon-and-cornwall-street.csv")

Crime_2022_01_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-01/2022-01-devon-and-cornwall-street.csv")
Crime_2022_02_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-02/2022-02-devon-and-cornwall-street.csv")
Crime_2022_03_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-03/2022-03-devon-and-cornwall-street.csv")
Crime_2022_04_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-04/2022-04-devon-and-cornwall-street.csv")
Crime_2022_05_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-05/2022-05-devon-and-cornwall-street.csv")
Crime_2022_06_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-06/2022-06-devon-and-cornwall-street.csv")
Crime_2022_07_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-07/2022-07-devon-and-cornwall-street.csv")
Crime_2022_08_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-08/2022-08-devon-and-cornwall-street.csv")
Crime_2022_09_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-09/2022-09-devon-and-cornwall-street.csv")
Crime_2022_10_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-10/2022-10-devon-and-cornwall-street.csv")
Crime_2022_11_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-11/2022-11-devon-and-cornwall-street.csv")
Crime_2022_12_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2022-12/2022-12-devon-and-cornwall-street.csv")

Crime_2023_01_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-01/2023-01-devon-and-cornwall-street.csv")
Crime_2023_02_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-02/2023-02-devon-and-cornwall-street.csv")
Crime_2023_03_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-03/2023-03-devon-and-cornwall-street.csv")
Crime_2023_04_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-04/2023-04-devon-and-cornwall-street.csv")
Crime_2023_05_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-05/2023-05-devon-and-cornwall-street.csv")
Crime_2023_06_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-06/2023-06-devon-and-cornwall-street.csv")
Crime_2023_07_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-07/2023-07-devon-and-cornwall-street.csv")
Crime_2023_08_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-08/2023-08-devon-and-cornwall-street.csv")
Crime_2023_09_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-09/2023-09-devon-and-cornwall-street.csv")
Crime_2023_10_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-10/2023-10-devon-and-cornwall-street.csv")
Crime_2023_11_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-11/2023-11-devon-and-cornwall-street.csv")
Crime_2023_12_Cornwall <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/390a695b1f8ee982a01269b847ec51e1a0c07f5f/2023-12/2023-12-devon-and-cornwall-street.csv")

# Combine the datasets 
Crime_combined = rbind(
  Crime_2021_05_Bristol, Crime_2021_06_Bristol, Crime_2021_07_Bristol,
  Crime_2021_08_Bristol, Crime_2021_09_Bristol, Crime_2021_10_Bristol, Crime_2021_11_Bristol,
  Crime_2021_12_Bristol, Crime_2022_01_Bristol, Crime_2022_02_Bristol, Crime_2022_03_Bristol,
  Crime_2022_04_Bristol, Crime_2022_05_Bristol, Crime_2022_06_Bristol, Crime_2022_07_Bristol,
  Crime_2022_08_Bristol, Crime_2022_09_Bristol, Crime_2022_10_Bristol, Crime_2022_11_Bristol,
  Crime_2022_12_Bristol, Crime_2023_01_Bristol, Crime_2023_02_Bristol, Crime_2023_03_Bristol,
  Crime_2023_04_Bristol, Crime_2023_05_Bristol, Crime_2023_06_Bristol, Crime_2023_07_Bristol,
  Crime_2023_08_Bristol, Crime_2023_09_Bristol, Crime_2023_10_Bristol, Crime_2023_11_Bristol,
  
  Crime_2021_05_Cornwall, Crime_2021_06_Cornwall, Crime_2021_07_Cornwall, Crime_2021_08_Cornwall,
  Crime_2021_09_Cornwall, Crime_2021_10_Cornwall, Crime_2021_11_Cornwall, Crime_2021_12_Cornwall,
  Crime_2022_01_Cornwall, Crime_2022_02_Cornwall, Crime_2022_03_Cornwall, Crime_2022_04_Cornwall,
  Crime_2022_05_Cornwall, Crime_2022_06_Cornwall, Crime_2022_07_Cornwall, Crime_2022_08_Cornwall,
  Crime_2022_09_Cornwall, Crime_2022_10_Cornwall, Crime_2022_11_Cornwall, Crime_2022_12_Cornwall,
  Crime_2023_01_Cornwall, Crime_2023_02_Cornwall, Crime_2023_03_Cornwall, Crime_2023_04_Cornwall,
  Crime_2023_05_Cornwall, Crime_2023_06_Cornwall, Crime_2023_07_Cornwall, Crime_2023_08_Cornwall,
  Crime_2023_09_Cornwall, Crime_2023_10_Cornwall, Crime_2023_11_Cornwall
)

# Convert 'Crime_combined' to a tibble and save it as a CSV file
Crime_combined <- Crime_combined %>%
  as_tibble()

write.csv(Crime_combined, "C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/Combined_crime.csv", row.names = FALSE)

# View the combined dataset for verification
View(Crime_combined)

# Load the combined and cleaned crime dataset
crimedata <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/Combined_crime.csv") %>%
  select(Month, `LSOA code`, `Crime type`, `Falls within`)

# Rename columns for clarity
colnames(crimedata) <- c("Year", "LSOA.code", "CrimeType", "Falls Within")

# Load the LSOA to Postcode mapping dataset
LsoaToPostcode <- read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/Cleaned_LSOA.csv")
colnames(LsoaToPostcode) <- c("LSOA.code", "shortPostcode", "Town", "District", "County")

# Check for and handle duplicates in both datasets
if (any(duplicated(crimedata$LSOA.code))) {
  cat("Duplicates found in crime data\n")
}
if (any(duplicated(LsoaToPostcode$LSOA.code))) {
  cat("Duplicates found in LSOA to Postcode mapping\n")
}

# Remove duplicates from both datasets
crimedata <- unique(crimedata, by = "LSOA.code")
LsoaToPostcode <- unique(LsoaToPostcode, by = "LSOA.code")

# Clean and merge the datasets, then aggregate crime counts
Crime_DataCleaned <- crimedata %>%
  left_join(LsoaToPostcode, by = "LSOA.code") %>%
  mutate(Year = str_trim(substring(Year, 1, 4))) %>%
  group_by(shortPostcode, CrimeType, Year, `Falls Within`) %>%
  filter(!is.na(shortPostcode) & !is.na(CrimeType) & !is.na(Year) & !is.na(`Falls Within`)) %>%
  summarize(CrimeCount = n()) %>%
  ungroup()

# Save the cleaned dataset to a CSV file
write.csv(Crime_DataCleaned, "C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/Cleaned_crime.csv", row.names = FALSE)

# View the cleaned dataset for verification
View(Crime_DataCleaned)
