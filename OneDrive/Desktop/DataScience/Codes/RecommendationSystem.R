# Load required libraries
library(dplyr)
library(tidyr)
library(readr)
library(ggplot2)

# Load datasets
lsoa_data = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/Cleaned_LSOA.csv")
population_data = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/Cleaned_Population.csv")
broadband_data = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Obtained_data/broadband speed/201809_fixed_pc_r03/201805_fixed_pc_performance_r03.csv")
crime_data = read_csv("C:/Users/NITRO 5/OneDrive/Desktop/Data-Science_Sangam/Cleaned_data/Cleaned_crime.csv")

# Clean and standardize column names
clean_data = function(df) {
  df %>%
    clean_names() %>%
    drop_na()
}

# Apply cleaning
population_data = clean_data(population_data)
broadband_data = clean_data(broadband_data)
crime_data = clean_data(crime_data)

# Merge datasets
combined_data = lsoa_data %>%
  left_join(population_data, by = "PostCode") %>%
  left_join(broadband_data, by = "postcode_area") %>%
  left_join(crime_data, by = "shortPostCode")

# Feature engineering: create scoring for each characteristic
calculate_score = function(data) {
  data %>%
    mutate(
      population_score = scale(population),
      broadband_score = scale(avg_download_speed),
      crime_score = -scale(crime_rate), # Assuming lower crime rate is better
      # school_score is removed as the school dataset is not included
    ) %>%
    rowwise() %>%
    mutate(
      total_score = mean(c(population_score, broadband_score, crime_score), na.rm = TRUE)
    )
}

# Apply scoring
scored_data = calculate_score(combined_data)

# Rank cities based on total score and recommend top 3 cities
recommended_cities = scored_data %>%
  arrange(desc(total_score)) %>%
  select(city, total_score) %>%
  head(3) # Top 3 cities

# Print recommendations
print("Top recommended cities based on the combined score:")
print(recommended_cities)

# Visualization of top recommended cities
ggplot(recommended_cities, aes(x = reorder(city, total_score), y = total_score)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Top Recommended Cities", x = "City", y = "Score")
