## Read data
initial <- read.csv("household_power_consumption.txt", sep = ";", nrows = 100)
classes <- sapply(initial, class)
alldata <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", colClasses = classes)
data <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")
data$DateTime <- strptime(paste(data$Date, data$Time), "%e/%m/%Y %T")

## plot histogram
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()