library(dplyr)


# File is read from the working directory
data <- read.delim("household_power_consumption.txt", sep = ";", na.strings = c("","?"))

explore_data <- data %>%
        # Filter for the dates we are interested in
        filter(Date %in% c("1/2/2007", "2/2/2007")) %>%
        # Add a column with date/time Posixlt info
        mutate(DateTime = strptime(paste(Date, Time),
                                   format = "%d/%m/%Y %H:%M:%S"))


# Create the png file we want as a graphics device
png("plot4.png", width = 480, height = 480)

# Create 2 rows and columns for the plots and redefine the margins
par(mfcol = c(2,2), mar = c(4,4,2,2))
#### Create the plots
# Number 1
plot(explore_data$DateTime, explore_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
# Number 2
plot(explore_data$DateTime, explore_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(explore_data$DateTime, explore_data$Sub_metering_2, col = "red")
lines(explore_data$DateTime, explore_data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = "solid", legend = names(explore_data[7:9]), bty = "n")
plot(explore_data$DateTime, explore_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(explore_data$DateTime, explore_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Close the graphics device
dev.off()
