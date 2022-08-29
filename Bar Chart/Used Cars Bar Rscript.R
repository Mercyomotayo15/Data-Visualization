# import the library
library("ggplot2")
# load the datset
df_used_cars <- read.csv("C:/Users/User/Desktop/data_science bootcamp/Dataset/bar_chart_data.csv",
                         header = TRUE,
                         sep = ",")

#plot the chart
bar_chart <- ggplot(df_used_cars,
                    aes(x = Brand,
                        y = Cars.Listings)) +                   
                    geom_bar(stat = "identity",
                             width = 0.8,
                             color = "navyblue",
                             fill = "navyblue") + 
              ggtitle("Cars Listings by Brand") + 
              theme_classic() + 
              theme(axis.text.x = element_text(angle = 45,
                                               hjust = 1)) + 
              labs(x = NULL,
                   y = "Number of listings") 
bar_chart

