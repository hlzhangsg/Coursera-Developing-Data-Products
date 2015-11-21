library(dplyr)

# APPLE
APPLE <- read.csv("./data/AAPL_wk.csv", 
                    header = TRUE,
                    sep = ",")
names(APPLE) <- c("Period", "Price")
APPLE$name <- "APPLE"

# IBM
IBM <- read.csv("./data/IBM_wk.csv", 
                 header = TRUE,
                 sep = ",")
names(IBM) <- c("Period", "Price")
IBM$name <- "IBM"

# Microsoft
Microsoft <- read.csv("./data/Microsoft_wk.csv", 
                 header = TRUE,
                 sep = ",")
names(Microsoft) <- c("Period", "Price")
Microsoft$name <- "Microsoft"

data <- rbind(APPLE,IBM,Microsoft)

write.csv(data, 'data.csv')
