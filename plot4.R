power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character", "character", rep("numeric", 7)), na.strings="?")
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]
power <- within (power, datetime <- strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
png("plot4.png", 480, 480)
par(mfrow = c(2,2))

plot(power$datetime, power$Global_active_power, xlab="", ylab="Global Active Power", type="n")
lines(power$datetime, power$Global_active_power)

plot(power$datetime, power$Voltage, xlab="datetime", ylab="Voltage", type="n")
lines(power$datetime, power$Voltage)

plot(power$datetime, power$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
lines(power$datetime, power$Sub_metering_1)
lines(power$datetime, power$Sub_metering_2, col="red")
lines(power$datetime, power$Sub_metering_3, col="blue")
legend("topright", lty = 1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(power$datetime, power$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="n")
lines(power$datetime, power$Global_reactive_power)

dev.off()