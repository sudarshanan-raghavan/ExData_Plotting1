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
png(file = "plot1.png")

# Let's plot the histogram of global active power and set the appropriate colors and labels
with(data,
     hist(Global_active_power,
          col = "red",
          xlab = "Global Active Power (kilowatts)",
          main = "Global Active Power"))

# Let's close the graphics device
dev.off()