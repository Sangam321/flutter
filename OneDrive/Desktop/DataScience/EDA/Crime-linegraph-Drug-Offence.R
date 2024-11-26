# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load dataset
data = read.csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/Cleaned_crime.csv")

# Print the first few rows of the dataset to understand its structure
print(head(data))

# Filter dataset for the specific crime type you want to plot
crime_type = "Anti-social behaviour"
filtered_data = data %>%
  filter(CrimeType == crime_type)

# Create the line chart using ggplot2
ggplot(filtered_data, aes(x = Year, y = CrimeCount, color = Falls.Within, group = Falls.Within)) +
  geom_line() +                        # Add line geometry
  geom_point() +                       # Add points on the line
  labs(title = paste("Trend of", crime_type, "Crime Counts by Year"),
       x = "Year",
       y = "Crime Count",
       color = "Police Force") +
  theme_minimal()   