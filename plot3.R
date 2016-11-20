# read data file
library(data.table)
dat <- fread("household_power_consumption.txt", sep=";", na.strings = "?")

# extract data from 02-01-2007 and 02-02-2007
datSubset <- subset(dat, Date %in% c("1/2/2007", "2/2/2007"))
datSubset$DateTime <- as.POSIXct(strptime(paste(datSubset$Date, datSubset$Time), "%d/%m/%Y %H:%M"))

# create a png file
png(filename ="plot3.png", width = 480, height = 480)

# create a plot
with(datSubset, plot(Sub_metering_1 ~ DateTime, type="l", xlab="", 
                     ylab = "Energy sub metering")) 

# add data            
points(datSubset$Sub_metering_2 ~ datSubset$DateTime, type="l", col="red")
points(datSubset$Sub_metering_3 ~ datSubset$DateTime, type="l", col="blue")

# add legend
legend("topright", col=c("black", "red", "blue"), lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close the file
dev.off()