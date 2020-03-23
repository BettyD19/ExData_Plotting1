## Peer-graded Assignment: Course Project 1
# setting working directory
setwd("~/Coursera/Exploratory Data Analysis/Quiz & Project/Week - 1/Project")

# Assigning the path of directory to read the data frame 
path <- file.path("./exdata_data_household_power_consumption")

# Reading the data frame usning read.table
House_power <- read.table(file.path(path, "household_power_consumption.txt"), header = TRUE, sep = ";", dec = ".")

# Reading the required data (2007-02-01 and 2007-02-02) from the data frame using subset function
feb12_power<- subset(House_power, Date == "1/2/2007" | Date == "2/2/2007")

# convert the Date and Time variables to Date/Time classes
date_time <- strptime(paste(feb12_power$Date,feb12_power$Time , sep = " "), "%d/%m/%Y %H:%M:%S")

# Multiple graph plotting using par() function
par(mfrow = c(2, 2))

# Ploting multiple graphs
plot(date_time, as.numeric(as.character(feb12_power$Global_active_power)), "l", xlab = " ", ylab = "Global Active Power")
plot(date_time, as.numeric(as.character(feb12_power$Voltage)),"l", xlab = "datetime", ylab = "Voltage")
plot(date_time, as.numeric(as.character(feb12_power$Sub_metering_1)), "l", xlab = " ", ylab = "Energy Sub metering")
lines(date_time, as.numeric(as.character(feb12_power$Sub_metering_2)), "l", xlab = " ", ylab = "Energy Sub metering", col = "red")
lines(date_time, as.numeric(as.character(feb12_power$Sub_metering_3)), "l", xlab = " ", ylab = "Energy Sub metering", col = "blue")

# Adding legend to the plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n", cex = 0.8)

# ploting the fourth graph
plot(date_time, as.numeric(as.character(feb12_power$Global_reactive_power)), "l", xlab = "datetime", ylab = "Global_reactive_ Power")


# Copying the plot to png
dev.copy(png, file = "plot4.png", width = 480, height = 480)

# closing the file using dev.off
dev.off()

