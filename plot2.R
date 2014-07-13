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
png("plot2.png")

#plot the graph
plot(usable$datetime, as.numeric(usable$Global_active_power),
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

#put to png and close the png dev
dev.off()