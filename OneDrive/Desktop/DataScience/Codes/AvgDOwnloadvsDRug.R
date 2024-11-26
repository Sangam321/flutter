# Load necessary libraries
library(tidyverse)

# Read the CSV files
broadband_speeds <- read.csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/broadband_speeds.csv")
crime_data <- read.csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/crime_data.csv")

# Inspect data
str(broadband_speeds)
str(crime_data)

# Aggregate drug crime data
drug_crime_data <- crime_data %>%
  filter(Crime.type == "Drug Crime") %>%
  group_by(LSOA.code) %>%
  summarise(DrugCrimeCount = n())

# Calculate drug offence rate per 10,000 people
drug_crime_data <- drug_crime_data %>%
  mutate(DrugCrimeRatePer10000 = (DrugCrimeCount / Population) * 10000)

# Merge datasets on the common column
merged_data <- merge(broadband_speeds, drug_crime_data, by.x = "PostCode", by.y = "LSOA.code", all.x = TRUE)

# Inspect the merged dataset
head(merged_data)
str(merged_data)

# Create the linear model
model <- lm(AvgDownloadSpeed ~ DrugCrimeRatePer10000, data = merged_data)

# Display the model summary
summary(model)

# Plot the data and regression line
ggplot(merged_data, aes(x = DrugCrimeRatePer10000, y = AvgDownloadSpeed)) +
  geom_point() +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "Average Download Speed vs. Drug Offence Rate per 10,000 People",
       x = "Drug Offence Rate per 10,000 People",
       y = "Average Download Speed (Mbps)") +
  theme_minimal()
