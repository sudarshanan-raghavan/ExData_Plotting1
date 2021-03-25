# Let's first read in the complete data set into a data frame
data_all <- read.table("household_power_consumption.txt",
                       sep = ";",
                       header = TRUE,
                       na.strings = "?")

# Let's convert the date character values in the data frame into the date class
data_all$Date <- as.Date(data_all$Date, "%d/%m/%Y")

# Let's subset the data frame for only the 1st and 2nd day of February
data <- subset(data_all,
               Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

rm(data_all)

# Let's convert and combine the date and time character values into the time class
data$date_time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Let's open a PNG graphics device in which to save the plot
png(file = "plot3.png")

# Let's plot the three sub metering readings against the date and time

# First, let's initialize a plot for sub metering 1 readings
with(data,
     plot(date_time,
          Sub_metering_1,
          type = "l",
          xlab = "",
          ylab = "Energy sub metering",
          main = ""))

# Second, let's add the data for sub metering 2 readings to the plot
with(data,
     points(date_time,
            Sub_metering_2,
            type = "l",
            col = "red"))

# Third, let's add the data for sub metering 3 readings to the plot
with(data,
     points(date_time,
            Sub_metering_3,
            type = "l",
            col = "blue"))

# Finally, let's add an appropriate legend to the plot
legend("topright",
       lty = 1,
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Let's close the graphics device
dev.off()