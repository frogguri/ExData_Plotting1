
# read data file
library(data.table)
dat <- fread("household_power_consumption.txt", sep=";", na.strings = "?")

# extract data from 02-01-2007 and 02-02-2007
datSubset <- subset(dat, Date %in% c("1/2/2007", "2/2/2007"))

# create a png file
png(filename ="plot1.png", width = 480, height = 480)

# create histogram with Global active power
hist(datSubset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (killowatts)")

# close the file
dev.off()