
library(dplyr) # A powerful package for efficient and intuitive data manipulation

install.packages("ggplot2") # Install ggplot2 package if not already installed

library(ggplot2) # A popular package for data visualization
bbi_data <- read.csv("data/resource.csv") # Load the dataset

head(bbi_data) # Display the first few rows of the dataset

unique(bbi_data$area_code) # Get unique area codes

str(bbi_data$area_code) # Check the structure of the area_code column

result <- bbi_data %>% filter( grepl("-AUS$", area_code)) # Filter rows where area_code contains "AUS"
print(result)
# Ordering result by years in ascending order
result_ordered_asc_yr <- result %>% select(X_id, lower_uncertainty, scenario, upper_uncertainty, value, variable, year) %>% arrange(year)
print(result_ordered_asc_yr)


# Create a line graph to visualize the Biodiversity Intactness Index over the years, including future projections
ggplot(result_ordered_asc_yr, aes(x = year, y = value,
                                  group = interaction(variable, scenario),
                                  color = variable,
                                  linetype = scenario,
                                  linename = "")) +
  geom_line(linewidth = 1) +
  geom_point(size = 3) +
  labs(title = "Biodiversity Intactness Index Over Years for AUS Area Codes",
       x = "Year",
       y = "Biodiversity Intactness Index (BBI)",
       color = "Variable",
       subtitle = "Data from Biodiversity Intactness Index",
       caption = "Source: Natural History Museum") +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5, size = 12),
    plot.caption = element_text(size = 10),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14)

  )
