#get data if doesn't exist already
if (!file.exists("household_power_consumption.txt")) {
	download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip", method="curl")
	unzip("household_power_consumption.zip")
}

# read in dataset (kind of big, so it will take a minute)
epc <- read.csv2("household_power_consumption.txt", na.strings="?")

# subset the dates we are interested in
targetdata <- epc[(epc$Date == "1/2/2007" | epc$Date == "2/2/2007"),]

#create 4th graph

#make a 2x2 panel
par(mfrow=c(2,2))

#insert first graph
plot(as.numeric(targetdata$Global_active_power)/500, ylab="Global Active Power", xlab="", type="l", xaxt="n")

#adjust y axis with days
axis(1, at=c(1,nrow(targetdata)/2,nrow(targetdata)),labels=c("Thu","Fri","Sat"))

#insert second graph
plot(as.numeric(as.character(targetdata$Voltage)), type="l", ylab="Voltage", xlab="datetime", xaxt="n")
axis(1, at=c(1,nrow(targetdata)/2,nrow(targetdata)),labels=c("Thu","Fri","Sat"))

#insert third graph
plot(as.numeric(as.character(targetdata$Sub_metering_1)), col="black", type="l", xlab="", ylab="Energy sub metering", xaxt="n")

#add second data set
lines(as.numeric(as.character(targetdata$Sub_metering_2)), col="red")

#add third set
lines(as.numeric(as.character(targetdata$Sub_metering_3)), col="blue")

#fix y axis
axis(1, at=c(1,nrow(targetdata)/2,nrow(targetdata)),labels=c("Thu","Fri","Sat"))

#add legend
legend("topright", col= c("black", "red", "blue"), lty="solid", bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#insert 4th graph
plot(as.numeric(as.character(targetdata$Global_reactive_power)), type="l", ylab="Global_reactive_power", xlab="datetime", xaxt="n")
axis(1, at=c(1,nrow(targetdata)/2,nrow(targetdata)),labels=c("Thu","Fri","Sat"))

#write out as png
png(filename="plot4.png")
par(mfrow=c(2,2))
plot(as.numeric(targetdata$Global_active_power)/500, ylab="Global Active Power", xlab="", type="l", xaxt="n")
plot(as.numeric(as.character(targetdata$Voltage)), type="l", ylab="Voltage", xlab="datetime", xaxt="n")
axis(1, at=c(1,nrow(targetdata)/2,nrow(targetdata)),labels=c("Thu","Fri","Sat"))
plot(as.numeric(as.character(targetdata$Sub_metering_1)), col="black", type="l", xlab="", ylab="Energy sub metering", xaxt="n")
lines(as.numeric(as.character(targetdata$Sub_metering_2)), col="red")
lines(as.numeric(as.character(targetdata$Sub_metering_3)), col="blue")
axis(1, at=c(1,nrow(targetdata)/2,nrow(targetdata)),labels=c("Thu","Fri","Sat"))
legend("topright", col= c("black", "red", "blue"), lty="solid", bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(as.numeric(as.character(targetdata$Global_reactive_power)), type="l", ylab="Global_reactive_power", xlab="datetime", xaxt="n")
axis(1, at=c(1,nrow(targetdata)/2,nrow(targetdata)),labels=c("Thu","Fri","Sat"))
dev.off()

