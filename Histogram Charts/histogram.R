#impor tthe necesarry library
library('ggplot2')
#load the dataset
df_real_estate <- read.csv("C:/Users/User/Desktop/data_science bootcamp/Dataset/D.V.Datasets/histogram_data.csv",
                           header = TRUE,
                           sep = (","))
#plot the graph
hist <- ggplot(df_real_estate,
               aes(x = Price)) +
         geom_histogram(bins = 8,
                        fill = "#108A99",
                        color = "white") +
          theme_classic() +
          ggtitle("Distribution of Real estate Prices") +
          xlab("Price in ('000 $')")
          ylab("Number of Properties")
          theme(plot.title = element_text(size = 16,
                                          face = "bold"))
hist
