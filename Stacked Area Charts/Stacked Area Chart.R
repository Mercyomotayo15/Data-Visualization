#import the necessary library
library('ggplot2')
#manipulete the data (remove the others column)
library(dplyr)
#reshape2 helps to transform data from long to wide formats
library("reshape2")
#load the dataset
df_engine_types <- read.csv("C:/Users/User/Desktop/data_science bootcamp/Dataset/D.V.Datasets/stacked_area_chart_data.csv",
                            header = TRUE,
                            sep = ",")
temp <- select(df_engine_types, -matches("other"))
new_engine_types <- melt(temp, id.vars = "Year")
#plot the chart
area_chart <- ggplot (new_engine_types,
                      aes(x = Year,
                          y = value,
                          fill = variable)) + 
                      geom_area() +
#customise the colors in the chart
               scale_fill_manual(values = c("#ef2026", 
                                            "#7e2987",
                                            "#011638")) +
  # classic theme (clean design and white background)
              theme_classic() +
  #shift legend to a different position
              theme(legend.justification = c(0.01, 1),
                    legend.position = c(0.01, 1)) +
              labs(fill = "Engine Type") +
              ylab("Number of Cars") +
              ggtitle("Popularity of Engine Fuel Types(1982 - 2016)") +
  #remove the year label and rotate the values
              theme(axis.text.x = element_text(angle = 90,
                                               vjust = 0.5)) +
              scale_x_continuous(breaks = new_engine_types$Year)
area_chart

