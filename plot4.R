#read file
data <- read.table("household_power_consumption.txt",
	header=T,
	sep=";",
	na.strings="?")

#extract subset data
usable <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#convert date and time from string to Date
usable$datetime <- paste(usable$Date, usable$Time)
usable$datetime <- strptime(usable$datetime, "%d/%m/%Y %R")

#open png device
png("plot4.png")

#create 2X2 grid
par(mfrow=(c(2,2)))

#plot graph 1
plot(usable$datetime, usable$Global_active_power,
	type="l",
	ylab="Global Active Power",
	xlab="")

#plot graph 2
plot(usable$datetime, usable$Voltage,
	type="l",
	ylab="Voltage",
	xlab="datetime")

#plot graph 3
#metering 1 data
plot(usable$datetime, usable$Sub_metering_1,
	type="l",
	ylab="Energy sub metering",
	xlab="")

#metering 2 data
lines(usable$datetime, usable$Sub_metering_2,
	type="l",
	col="red")

#metering 3 data
lines(usable$datetime, usable$Sub_metering_3,
	type="l",
	col="blue")

#add legend
legend("topright",
	legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lwd=1,
       bty="n")

#plot graph 4
plot(usable$datetime, usable$Global_reactive_power,
	type="l",
	ylab="Global_reactive_power",
	xlab="datetime")

#put to png and close the png dev
dev.off()