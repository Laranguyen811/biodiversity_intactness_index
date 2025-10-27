
library(dplyr) # A powerful package for efficient and intuitive data manipulation

bbi_data <- read.csv("data/resource.csv") # Load the dataset

head(bbi_data) # Display the first few rows of the dataset

unique(bbi_data$area_code) # Get unique area codes

str(bbi_data$area_code) # Check the structure of the area_code column

result <- bbi_data %>% filter( grepl("-AUS$", area_code)) # Filter rows where area_code contains "AUS"
print(result)
# Ordering result by years in ascending order
result_ordered_asc_yr <- result %>% arrange(year)
print(result_ordered_asc_yr)