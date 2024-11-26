# Install and load necessary libraries
library(tidyverse)
library(dplyr)
library(stringi)
library(scales)

# Set working directory
setwd("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam")

# Load broadband data
BroadbandDataA = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtain_data/broadband speed/201809_fixed_pc_r03/201805_fixed_pc_performance_r03.csv", show_col_types = FALSE)
BroadbandDataB = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtain_data/broadband speed/201809_fixed_pc_r03/201809_fixed_pc_coverage_r01.csv", show_col_types = FALSE)

# Check column names to ensure correct columns are used
print(colnames(BroadbandDataA))
print(colnames(BroadbandDataB))

# Define the pattern for extracting the short postcode
postcode_pattern = ' .*$'

# Clean BroadbandDataA
CleanedDataA = BroadbandDataA %>%
  mutate(postcodeShort = gsub(postcode_pattern, "", `postcode area`)) %>%
  mutate(EntryID = row_number()) %>%
  select(EntryID, `postcode area`, postcodeShort, `Average download speed (Mbit/s)`,
         `Average upload speed (Mbit/s)`, `Minimum download speed (Mbit/s)`,
         `Minimum upload speed (Mbit/s)`) %>%
  na.omit()

colnames(CleanedDataA) = c("EntryID", "postcode_area", "postcodeShort", "AvgDownloadSpeed",
                            "AvgUploadSpeed", "MinDownloadSpeed", "MinUploadSpeed")

# Clean BroadbandDataB
CleanedDataB = BroadbandDataB %>%
  mutate(postcodeShort = gsub(postcode_pattern, "", pca)) %>%
  mutate(EntryID = row_number()) %>%
  select(EntryID, postcode, postcodeShort, `SFBB availability (% premises)`,
         `UFBB availability (% premises)`, `FTTP availability (% premises)`,
         `% of premises unable to receive 2Mbit/s`, `% of premises unable to receive 5Mbit/s`,
         `% of premises unable to receive 10Mbit/s`, `% of premises unable to receive 30Mbit/s`,
         `% of premises unable meet USO`, `% of premises able to receive decent broadband from FWA`,
         `% of premises able to receive SFBB from FWA`, `% of premises able to receive NGA`) %>%
  na.omit()

colnames(CleanedDataB) = c("EntryID", "postcode_area", "postcodeShort", "SFBB_PremisesAvailability",
                            "UFBB_PremisesAvailability", "FTTP_PremisesAvailability", "NoReceive_2Mbit",
                            "NoReceive_5Mbit", "NoReceive_10Mbit", "NoReceive_30Mbit",
                            "NoMeet_USO", "DecentBroadband_FWA", "SFBB_FWA", "NGA_Availability")

# Merge the two cleaned broadband datasets
CombinedBroadbandData = bind_rows(CleanedDataA, CleanedDataB)

# Write the combined broadband data to a CSV file
write_csv(CombinedBroadbandData, "C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/Cleaned_Broadband_speed.csv")

# View the combined data
View(CombinedBroadbandData)
