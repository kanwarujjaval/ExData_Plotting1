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
png("plot3.png")

plot(usable$datetime,
	usable$Sub_metering_1,
	type="l",
	ylab="Energy sub metering",
	xlab="")

#add metering2 data
lines(usable$datetime,
	usable$Sub_metering_2,
	type="l",
	col="red")

#add metering3 data
lines(usable$datetime,
	usable$Sub_metering_3,
	type="l",
	col="blue")

#add legend
legend("topright",
	legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
	col=c("black","red","blue"),
	lwd=1)

#put to png and close the png dev
dev.off()