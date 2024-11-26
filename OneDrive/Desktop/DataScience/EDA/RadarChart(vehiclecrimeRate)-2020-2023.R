# Load necessary libraries
library(tidyverse)
library(fmsb)

# Load the dataset
crime_data <- read.csv("path/to/your/crime.csv")

# Filter data for Vehicle Crime from 2020 to 2023
vehicle_crime_data <- crime_data %>%
  filter(`Crime type` == "Vehicle crime" & 
           between(as.Date(paste0(Month, "-01")), as.Date("2020-01-01"), as.Date("2023-12-31")))

# Aggregate data by year and calculate the count of vehicle crimes
vehicle_crime_summary <- vehicle_crime_data %>%
  mutate(Year = substr(Month, 1, 4)) %>%
  group_by(Year) %>%
  summarise(VehicleCrimeCount = n())

# Prepare data for radar chart
# Add a row for the max value (for the radar chart scaling)
max_value <- max(vehicle_crime_summary$VehicleCrimeCount)
radar_data <- as.data.frame(t(vehicle_crime_summary$VehicleCrimeCount))
radar_data <- rbind(rep(max_value, ncol(radar_data)), radar_data)

# Correcting row names
row_names <- c("Max", as.character(vehicle_crime_summary$Year))
rownames(radar_data) <- row_names

# Create radar chart
radarchart(radar_data, axistype = 1,
           title = "Vehicle Crime Rate from 2020 to 2023",
           pcol = "blue", pfcol = alpha("blue", 0.5), plwd = 2,
           cglcol = "grey", cglty = 1, axislabcol = "grey", caxislabels = seq(0, max_value, length.out = 5),
           vlcex = 0.8)
