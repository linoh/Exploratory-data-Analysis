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
## Set working directory for plot4 output of 4 graphs of png vector file type and screen resolution of 480x480 pixels
setwd("D:/Data")
png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
par(mfrow = c(2, 2))
## output is set to display on Top left corner
plot(DateTime, Global_active_power, 
     type = "l",
     xlab = "", ylab = "Global Active Power")
## output is set to display on Top right corner
plot(DateTime, Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")
## output is set to display on Bottom-left corner
plot(DateTime, Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")
## Graphs Plot4  data legend is suppressed 
legend("topright", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
## output is set to display on Bottom- right corner
plot(DateTime, Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = colnames(newData)[4])
dev.off()
