power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character", "character", rep("numeric", 7)), na.strings="?")
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]
power <- within (power, datetime <- strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
png("plot2.png", 480, 480)
plot(power$datetime, power$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n")
lines(power$datetime, power$Global_active_power)
dev.off()