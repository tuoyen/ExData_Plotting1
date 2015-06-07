## Read data
initial <- read.csv("household_power_consumption.txt", sep = ";", nrows = 100)
classes <- sapply(initial, class)
alldata <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", colClasses = classes)
data <- subset(alldata, Date == "1/2/2007" | Date == "2/2/2007")
data$DateTime <- strptime(paste(data$Date, data$Time), "%e/%m/%Y %T")

## plot line chart
png(file = "plot3.png", width = 480, height = 480)
plot(data$Sub_metering_1 ~ as.POSIXct(data$DateTime), type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(data$Sub_metering_2 ~ as.POSIXct(data$DateTime), type = "l", col = "red")
lines(data$Sub_metering_3 ~ as.POSIXct(data$DateTime), type = "l", col = "blue")
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()