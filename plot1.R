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
png("plot1.png", width = 480, height = 480)
# Create the histogram
hist(explore_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Close the graphics device
dev.off()
