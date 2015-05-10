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
## Set working directory for plot1 output of hystogram with png vector file type and screen resolution of 480x480 pixels
setwd("D:/Data")
png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")
hist(Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     breaks = 12, ylim = c(0, 1200))
dev.off()
