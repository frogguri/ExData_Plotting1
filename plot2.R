# read data file
library(data.table)
dat <- fread("household_power_consumption.txt", sep=";", na.strings = "?")

# extract data from 02-01-2007 and 02-02-2007
datSubset <- subset(dat, Date %in% c("1/2/2007", "2/2/2007"))
datSubset$DateTime <- as.POSIXct(strptime(paste(datSubset$Date, datSubset$Time), "%d/%m/%Y %H:%M"))

# create a png file
png(filename ="plot2.png", width = 480, height = 480)

# create a plot
with(datSubset, plot(Global_active_power ~ DateTime, type="l", xlab="", 
                     ylab = "Global Active Power (kilowatts)"))
# close the file
dev.off()