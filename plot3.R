# This code will produce Plot3. The code assumes you have the dplyr package
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

# Then we draw a plot of the relationship between datetime and the submetering 
# variables with a legend and store it in png file called plot3.png. 
png("plot3.png", width = 480, height = 480)
plot(datetime, as.numeric(feb_data$Sub_metering_1), type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(datetime, feb_data$Sub_metering_2, col="red") 
lines(datetime, feb_data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty= 1, lwd = 2, col=c("black", "red", "blue"))
dev.off()