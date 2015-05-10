## This Routine is to create dataset in between 1/2/2007 and 2/2/2007
filename <- "D:/data/household_power_consumption.txt"
data <- read.table(filename,header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric",7)),na = "?")
## dimension the dataset
dim(data)
## adds the dataset to the search path
attach(data)
## create subset data by Set filter for required date ranges.
subset <- Date == "1/2/2007" | Date == "2/2/2007"
## Create new dataset from filetered data
newData <- data[subset, ]
## adds the new dataset to the search path
attach(newData)
x <- paste(Date, Time)
newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newData) <- 1:nrow(newData)
## Redim new dataset
dim(newData)
attach(newData)
## Set working directory for plot3 output of Line graph with png vector file type and screen resolution of 480x480 pixels
## graph showing sub metering  of daily power usage.
setwd("D:/Data")
png(filename = "plot3.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
plot(DateTime, Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
dev.off()
