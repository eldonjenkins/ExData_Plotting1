#get data if doesn't exist already
if (!file.exists("household_power_consumption.txt")) {
	download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip", method="curl")
	unzip("household_power_consumption.zip")
}

# read in dataset (kind of big, so it will take a minute)
epc <- read.csv2("household_power_consumption.txt", na.strings="?")

# subset the dates we are interested in
targetdata <- epc[(epc$Date == "1/2/2007" | epc$Date == "2/2/2007"),]

#create third graph
plot(as.numeric(as.character(targetdata$Sub_metering_1)), col="black", type="l", xlab="", ylab="Energy sub metering", xaxt="n")

#add second data set
lines(as.numeric(as.character(targetdata$Sub_metering_2)), col="red")

#add third set
lines(as.numeric(as.character(targetdata$Sub_metering_3)), col="blue")

#fix y axis
axis(1, at=c(1,nrow(targetdata)/2,nrow(targetdata)),labels=c("Thu","Fri","Sat"))

#add legend
legend("topright", col= c("black", "red", "blue"), lty="solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#write out png of third graph
png(filename="plot3.png")
plot(as.numeric(as.character(targetdata$Sub_metering_1)), col="black", type="l", xlab="", ylab="Energy sub metering", xaxt="n")
lines(as.numeric(as.character(targetdata$Sub_metering_2)), col="red")
lines(as.numeric(as.character(targetdata$Sub_metering_3)), col="blue")
axis(1, at=c(1,nrow(targetdata)/2,nrow(targetdata)),labels=c("Thu","Fri","Sat"))
legend("topright", col= c("black", "red", "blue"), lty="solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

