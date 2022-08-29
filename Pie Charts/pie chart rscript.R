# Import the library
library('ggplot2')
# Load the dataset
df_fuel_types <- read.csv("C:/Users/User/Desktop/data_science bootcamp/Dataset/D.V.Datasets/pie_chart_data.csv",
                          header = TRUE,
                          sep = ',')
# Plot the pie chart
# N.B There's no ready to use function to create a pie Chart so, we create a stacked bar chart, then convert it to a pie shape
# The first required layer is the data
pie_chart <- ggplot(df_fuel_types,
# The 'aes'  function is a required field where we denote the x and y axes
                    aes(x = "",
                        y = Number.of.Cars,
                        fill = Engine.Fuel.Type)) +
# The last layer is the "geom_bar" which is used to draw a bar chart
                    geom_bar(stat = "identity",
                             width = 1) +
# The cood_polar to transform the chart to a polar coordinate system
                    coord_polar("y") 
pie_chart
# Pie Chart Labels - convert to percentage
percentages <- paste0(round(df_fuel_types$Number.of.Cars/sum(df_fuel_types$Number.of.Cars)*100, 1), "%")
pie_chart <- pie_chart + geom_text(aes(label = percentages),
                                   position = position_stack(vjust = 0.5))
pie_chart
# Remove the column labels
pie_chart <- pie_chart + labs(x = NULL,
                              y = NULL,
                              fill = NULL,
                              title = "Cars by Engine Fuel Type")
pie_chart
# Choose the color of your chart - Colorblind friendly palette
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "F0E442", "#0072B2", "#D55E00", "#CC79A7")
pie_chart <- pie_chart + scale_fill_manual (values = cbPalette)
pie_chart
# Background of the chart adding a classic theme
# Through "theme", we can control other non-data elements such as Grid 
pie_chart <- pie_chart + theme_classic() + 
                         theme(axis.line = element_blank(),
                               axis.text = element_blank(),
                               plot.title = element_text(hjust = 0.5))
pie_chart

