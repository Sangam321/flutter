# Load necessary libraries
library(dplyr)
library(ggplot2)

# Load the dataset
house_prices = read.csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/Cleaned_HousePricing(2020-2023).csv")

# Filter data for Bristol and Cornwall
filtered_data = house_prices %>%
  filter(District %in% c("CITY OF BRISTOL", "CORNWALL"))

# Calculate average house price by year for each district
avg_house_prices = filtered_data %>%
  group_by(Year, District) %>%
  summarise(AvgHousePrice = mean(Price, na.rm = TRUE)) %>%
  ungroup()

# View the average house prices
print(avg_house_prices)

# Create a line graph of average house prices for Bristol and Cornwall
ggplot(avg_house_prices, aes(x = Year, y = AvgHousePrice, color = District, group = District)) +
  geom_line(size = 1) +
  geom_point(size = 2) +
  labs(title = "Average House Prices in Bristol and Cornwall (2020-2023)",
       x = "Year",
       y = "Average House Price",
       color = "District") +
  theme_minimal()

# Save the line graph to a file
ggsave("avg_house_prices_bristol_cornwall.png", width = 10, height = 6)
