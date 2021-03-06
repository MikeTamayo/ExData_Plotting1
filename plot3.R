power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character", "character", rep("numeric", 7)), na.strings="?")
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]
power <- within (power, datetime <- strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
png("plot3.png", 480, 480)
plot(power$datetime, power$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
lines(power$datetime, power$Sub_metering_1)
lines(power$datetime, power$Sub_metering_2, col="red")
lines(power$datetime, power$Sub_metering_3, col="blue")
legend("topright",lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()