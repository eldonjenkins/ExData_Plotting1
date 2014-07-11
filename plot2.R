#get data if doesn't exist already
if (!file.exists("household_power_consumption.txt")) {
	download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip", method="curl")
	unzip("household_power_consumption.zip")
}

# read in dataset (kind of big, so it will take a minute)
epc <- read.csv2("household_power_consumption.txt", na.strings="?")

# subset the dates we are interested in
targetdata <- epc[(epc$Date == "1/2/2007" | epc$Date == "2/2/2007"),]

#create plot 2 
plot(as.numeric(targetdata$Global_active_power)/500, ylab="Global Active Power (kilowatts)", xlab="", type="l", xaxt="n")

#adjust y axis with days
axis(1, at=c(1,nrow(targetdata)/2,nrow(targetdata)),labels=c("Thu","Fri","Sat"))

#write out png of second graph
png(filename="plot2.png")
plot(as.numeric(targetdata$Global_active_power)/500, ylab="Global Active Power (kilowatts)", xlab="", type="l", xaxt="n")
axis(1, at=c(1,nrow(targetdata)/2,nrow(targetdata)),labels=c("Thu","Fri","Sat"))
dev.off()

