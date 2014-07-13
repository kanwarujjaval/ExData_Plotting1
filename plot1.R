#read file
data <- read.table("household_power_consumption.txt",
	header=T,
	sep=";",
	na.strings="?")

#extract subset
usable <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#open png device
png("plot1.png")

#plot
hist(as.numeric(usable$Global_active_power),
	col="Red",
	main="Global Active Power",
	xlab="Global Active Power (kilowatts)")

#put to png and close the png dev
dev.off()