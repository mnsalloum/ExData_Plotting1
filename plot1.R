# This code will produce Plot1. The code assumes you have the dplyr package
# installed and that dataset already downloaded and unzipped and the main
# file for the dataset is present in the current work directory. 

library(dplyr)

# We read the dataset and subset it by date.
data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",
                   sep= ";", header = T)
feb_data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# Then we draw a histogram of the global active power and store it in png file
# called plot1.png. 
png("plot1.png", width = 480, height = 480)
hist(as.numeric(feb_data$Global_active_power), main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()