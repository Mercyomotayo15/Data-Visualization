# Import the necessary libraries
library('ggplot2')
library('reshape2')
library('plyr')

# Load the data set
spx_ftse_00_10 <- read.csv("C:/Users/User/Desktop/data_science bootcamp/Dataset/D.V.Datasets/line_chart_data.csv",
                           header = TRUE,
                           sep = ",")
# Convert date to the correct format
spx_ftse_00_10$Date <- as.Date(spx_ftse_00_10$Date,
                               format = "%m/%d/%Y")
# Combine the S$P and FTSE column into one single column
spx_ftse_00_10_melt <- melt(spx_ftse_00_10,
                            id = "Date")
# Rename the columns
spx_ftse_00_10_melt <- rename(spx_ftse_00_10_melt,
                              c("value" = "Returns",
                                "variable" = "Index"))
# Plot the graph
line_chart <- ggplot(spx_ftse_00_10_melt,
                     aes(x = Date,
                         y = Returns,
                         color = Index,
                         group = Index)) +
             geom_line(aes(color = Index),
                           size = 1) + 
             scale_color_manual(values = c("navyblue", "red4")) +
             theme_minimal() +
             ggtitle("S&P VS FTSE Returns(2000 - 2010)")
line_chart

# Choose a smaller time frame
min <- as.Date("2008-7-1")
max <- as.Date("2008-12-31")
# Create the new line chart for the new Time Frame(2008)
line_chart_H2_08 <- ggplot(spx_ftse_00_10_melt,
                     aes(x = Date,
                         y = Returns,
                         color = Index,
                         group = Index)) +
  geom_line(aes(color = Index),
            size = 1) + 
  scale_color_manual(values = c("navyblue", "red4")) +
  theme_minimal() +
  ggtitle("S&P VS FTSE Returns(H2 2008)") +
  scale_x_date(limits = c(min, max)) +
  theme(legend.justification = c(0.01, 1) ,
        legend.position = c(0.01, 1))
line_chart_H2_08

