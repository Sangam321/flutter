# Load necessary libraries
library(tidyverse)

# Read the CSV files
house_prices <- read.csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/Cleaned_HousePricing(2020-2023).csv")
broadband_speeds <- read.csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/Cleaned_Broadband_speed.csv")

# Inspect the first few rows and structure of each dataset
head(house_prices)
str(house_prices)
head(broadband_speeds)
str(broadband_speeds)

# Merge the datasets on the common column (assuming 'PostCode' is the common column)
merged_data <- merge(house_prices, broadband_speeds, by = "PostCode")

# Inspect the merged dataset
head(merged_data)
str(merged_data)

# Create the linear model: Predict house prices based on average download speed
model <- lm(Price ~ AvgDownloadSpeed, data = merged_data)

# Display the model summary
summary(model)

# Optionally, plot the data and the regression line
ggplot(merged_data, aes(x = AvgDownloadSpeed, y = Price)) +
  geom_point() +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "House Prices vs. Average Download Speed",
       x = "Average Download Speed (Mbps)",
       y = "House Price (£)") +
  theme_minimal()
