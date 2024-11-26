# Load necessary libraries
library(dplyr)
library(ggplot2)

# Load the dataset
house_prices = read.csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/Cleaned_HousePricing(2020-2023).csv")

# Filter data for the year 2023
house_prices_2023 = house_prices %>%
  filter(Year == 2023)

# Create a bar chart of house prices for the year 2023
ggplot(house_prices_2023, aes(x = reorder(Town, Price, FUN = median), y = Price)) +
  geom_bar(stat = "identity") +
  labs(title = "House Prices in 2023",
       x = "Town",
       y = "Price") +
  theme_minimal() +
  coord_flip()  # Flip coordinates to make town names more readable


