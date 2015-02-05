#
# Plot 4
#

# load the data from zip file
powerDat <- read.csv(unz('household_power_consumption.zip',
                         'household_power_consumption.txt'),
                     sep=';', na.strings="?",
                     colClasses=c(rep('character',2), rep('numeric',7)))

# filter for the days we want
powerDat <- powerDat[powerDat$Date %in% c('1/2/2007', '2/2/2007'),]

# combine date and time columns
powerDat$Date <- strptime(paste(powerDat$Date, powerDat$Time), "%d/%m/%Y %H:%M:%S")

# make the plot
png(filename = "plot4.PNG", width = 480, height = 480)

# 2x2 panels
par(mfrow=c(2,2))

# plot 1
plot(powerDat[c(1,3)], type='l', ylab='Global Active Power', xlab='')
# plot 2
plot(powerDat[c(1,5)], type='l', ylab='Voltage', xlab='datetime')
# plot 3
plot(powerDat[c(1,7)], type='l', ylab='Energy sub metering', xlab='')
lines(powerDat[c(1,8)], type='l', col='red')
lines(powerDat[c(1,9)], type='l', col='blue')
legend("topright", lty=1, col=c("black", "red", "blue"), bty="n",
       legend=colnames(powerDat[c(7,8,9)]))
# plot 4
plot(powerDat[c(1,4)], type='l', xlab='datetime')

dev.off()