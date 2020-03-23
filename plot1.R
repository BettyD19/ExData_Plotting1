## Peer-graded Assignment: Course Project 1
# setting working directory
setwd("~/Coursera/Exploratory Data Analysis/Quiz & Project/Week - 1/Project") 

# Assigning the path of directory to read the data frame 
path <- file.path("./exdata_data_household_power_consumption")

# Reading the data frame usning read.table.
House_power <- read.table(file.path(path, "household_power_consumption.txt"), header = TRUE, sep = ";", dec = ".")

# Reading the required data (2007-02-01 and 2007-02-02) from the data frame using subset function
feb12_power<- subset(House_power, Date == "1/2/2007" | Date == "2/2/2007")


# Ploting the graph using histogram plotting.
hist(as.numeric(as.character(feb12_power$Global_active_power)), main = "Global Active Power",col = "red", xlab = "Global Active Power (kilowatts)")

# Copying the plot to png
dev.copy(png, file = "plot1.png", width = 480, height = 480)

# closing the file using dev.off
dev.off()

