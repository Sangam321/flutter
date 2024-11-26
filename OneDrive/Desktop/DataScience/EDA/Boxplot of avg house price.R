# Install and load necessary libraries
install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
library(dplyr)

# Load the dataset
house_prices = read.csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/Cleaned_HousePricing(2020-2023).csv")

# Calculate the average house price by grouping
avg_house_prices = house_prices %>%
  group_by(Town) %>%  # Change 'Town' to any column you want to group by
  summarise(avg_price = mean(Price, na.rm = TRUE))

# Create the boxplot
ggplot(avg_house_prices, aes(x = Town, y = avg_price)) +
  geom_boxplot() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Boxplot of Average House Prices by Town",
       x = "Town",
       y = "Average House Price")
