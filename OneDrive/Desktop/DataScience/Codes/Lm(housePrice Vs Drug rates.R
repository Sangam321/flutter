# Load necessary libraries
library(tidyverse)

# Read the CSV files
house_prices <- read.csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/house_prices.csv")
crime_data <- read.csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/crime_data.csv")

# Inspect data
str(house_prices)
str(crime_data)

# Aggregate drug crime data
drug_crime_data <- crime_data %>%
  filter(Crime.type == "Drug Crime") %>%
  group_by(LSOA.code) %>%
  summarise(DrugCrimeRate = n())

# Merge datasets on the common column
# Adjust 'PostCode' and 'LSOA.code' if different
merged_data <- merge(house_prices, drug_crime_data, by.x = "PostCode", by.y = "LSOA.code", all.x = TRUE)

# Inspect the merged dataset
head(merged_data)
str(merged_data)

# Create the linear model
model <- lm(Price ~ DrugCrimeRate, data = merged_data)

# Display the model summary
summary(model)

# Plot the data and regression line
ggplot(merged_data, aes(x = DrugCrimeRate, y = Price)) +
  geom_point() +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "House Prices vs. Drug Crime Rates",
       x = "Drug Crime Rate",
       y = "House Price (£)") +
  theme_minimal()
