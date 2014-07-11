#get data if doesn't exist already
if (!file.exists("household_power_consumption.txt")) {
	download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip", method="curl")
	unzip("household_power_consumption.zip")
}

# read in dataset (kind of big, so it will take a minute)
epc <- read.csv2("household_power_consumption.txt", na.strings="?")

# subset the dates we are interested in
targetdata <- epc[(epc$Date == "1/2/2007" | epc$Date == "2/2/2007"),]

#build first graph! 
hist(as.numeric(targetdata$Global_active_power)/500, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#write out png of first graph
png(filename="plot1.png")
hist(as.numeric(targetdata$Global_active_power)/500, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

