# Exploratory Data Analysis
# Week 1
# Peer-graded Assignment: Course Project 1
# Plot 3

# INSTRUCTIONS
# Our overall goal here is simply to examine how household energy usage varies 
# over a 2-day period in February, 2007. Your task is to reconstruct the 
# following plots below, all of which were constructed using the base plotting 
# system. 
# 1. Construct the plot and save it to a PNG file with a width of 480 pixels and
#    a height of 480 pixels.
# 2. Name the plot file plot3.png.
# 3. Create a separate R code file that constructs the corresponding plot.
#    Include code for reading the data and creating the PNG file.
# 4. Add the PNG file and R code file to the top-level folder of your git repo.

# DATA
# Electric power consumption
# http://archive.ics.uci.edu/ml/index.php

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

# Reading data
setwd("~/Desktop/Data Science/Peer-graded Assignments")
powerconsumption <- read.csv("household_power_consumption.txt", sep=';', 
                             na.strings="?", stringsAsFactors = FALSE) 

# Subsetting data
powerconsumption_subset <- subset(powerconsumption, Date %in% c("1/2/2007","2/2/2007"))

# Plotting data and creating the PNG file
powerconsumption_subset$Date <- as.Date(powerconsumption_subset$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(powerconsumption_subset$Date), powerconsumption_subset$Time)
powerconsumption_subset$Datetime <- as.POSIXct(datetime)
png("plot3.png", width = 480, height = 480)
with(powerconsumption_subset, 
     {
       plot(Sub_metering_1~Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
       lines(Sub_metering_2~Datetime, col = "red")
       lines(Sub_metering_3~Datetime, col = "blue")
     })
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()