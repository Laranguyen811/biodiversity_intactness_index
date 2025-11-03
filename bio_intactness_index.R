
library(dplyr) # A powerful package for efficient and intuitive data manipulation

install.packages("ggplot2") # Install ggplot2 package if not already installed

library(ggplot2) # A popular package for data visualization
bbi_data <- read.csv("data/resource.csv") # Load the dataset

head(bbi_data) # Display the first few rows of the dataset

unique(bbi_data$area_code) # Get unique area codes

str(bbi_data$area_code) # Check the structure of the area_code column

aus_result <- bbi_data %>% filter( grepl("-AUS$", area_code)) # Filter rows where area_code contains "AUS"
print(aus_result)
# Ordering result by years in ascending order
aus_result_ordered_asc_yr <- aus_result %>% select(X_id, lower_uncertainty, scenario, upper_uncertainty, value, variable, year) %>% arrange(year)
print(aus_result_ordered_asc_yr)


# Create a line graph to visualize the Biodiversity Intactness Index over the years, including future projections
ggplot(aus_result_ordered_asc_yr, aes(x = year, y = value, # Plot year on x-axis and value on y-axis
                                  #group = interaction(variable, scenario), # Group by both variable and scenario
                                  color = scenario))+ # Color lines by scenario


  geom_line(linewidth = 1, linetype = 'dotted') +
  facet_wrap(~variable, scales = "free_y") + # Create separate panels for each variable with free y-axis scales
  geom_point(size = 3) +
  scale_color_discrete(
    name = "Scenario",
    labels = c("historical" = "Historical",
               "ssp1rcp2p6image" = "SSP1-RCP2.6 (Sustainability)",
               "ssp2rcp4p5messageglobiom" = "SSP2-RCP4.5 (Current Trends)",
               "ssp3rcp7p0aim" = "SSP3-RCP7.0 (Regional Rivalry)",
               "ssp4rcp6p0gcam" = "SSP4-RCP6.0 (Inequality)",
               "ssp5rcp8p5remindmagpie" = "SSP5-RCP8.5 (Fossil Fuel)")) +
  labs(title = "Biodiversity Intactness Index Over Years for AUS Area Codes",
       x = "Year",
       y = "Biodiversity Intactness Index (BBI)",
       subtitle = "Data from Biodiversity Intactness Index",
       caption = "Source: Natural History Museum") +
theme_minimal()

ggsave("outputs/bbi_aus_area_code.png") # Save the plot as a PNG file

# China Area Code BBI
china_result <- bbi_data %>% filter( grepl("-CHN$", area_code)) # Filter rows where area_code contains "AUS"
print(china_result)
# Ordering result by years in ascending order
china_result_ordered_asc_yr <- china_result %>% select(X_id, lower_uncertainty, scenario, upper_uncertainty, value, variable, year) %>% arrange(year)
print(china_result_ordered_asc_yr)


# Create a line graph to visualize the Biodiversity Intactness Index over the years, including future projections
ggplot(china_result_ordered_asc_yr, aes(x = year, y = value, # Plot year on x-axis and value on y-axis
                                  #group = interaction(variable, scenario), # Group by both variable and scenario
                                  color = scenario))+ # Color lines by scenario


  geom_line(linewidth = 1, linetype = 'dotted') +
  facet_wrap(~variable, scales = "free_y") + # Create separate panels for each variable with free y-axis scales
  geom_point(size = 3) +
  scale_color_discrete(
    name = "Scenario",
    labels = c("historical" = "Historical",
               "ssp1rcp2p6image" = "SSP1-RCP2.6 (Sustainability)",
               "ssp2rcp4p5messageglobiom" = "SSP2-RCP4.5 (Current Trends)",
               "ssp3rcp7p0aim" = "SSP3-RCP7.0 (Regional Rivalry)",
               "ssp4rcp6p0gcam" = "SSP4-RCP6.0 (Inequality)",
               "ssp5rcp8p5remindmagpie" = "SSP5-RCP8.5 (Fossil Fuel)")) +
  labs(title = "Biodiversity Intactness Index Over Years for CHN Area Codes",
       x = "Year",
       y = "Biodiversity Intactness Index (BBI)",
       subtitle = "Data from Biodiversity Intactness Index",
       caption = "Source: Natural History Museum") +
theme_minimal()

ggsave("outputs/bbi_chn_area_code.png") # Save the plot as a PNG file




