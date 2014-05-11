power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses = c("character", "character", rep("numeric", 7)), na.strings="?")
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]
power <- within (power, datetime <- strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
png("plot1.png", 480, 480)
hist(power$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()