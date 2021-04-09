# This code will produce Plot2. The code assumes you have the dplyr package
# installed and that dataset already downloaded and unzipped and the main
# file for the dataset is present in the current work directory. 

library(dplyr)

# We read the dataset and subset it by date.
data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",
                   sep= ";", header = T, na.strings = "?")
feb_data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# Then we create a new variable called datetime that merges the Date and the Time
# variables.
datetime <- strptime(paste(feb_data$Date, feb_data$Time, sep=" "), 
          "%d/%m/%Y %H:%M:%S")

# Then we draw a plot of the global active power relationship with the datetime 
# variable and store it in png file called plot2.png. 
png("plot2.png", width = 480, height = 480)
plot(datetime, as.numeric(feb_data$Global_active_power), type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()