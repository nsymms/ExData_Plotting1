#
# Plot 2
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
png(filename = "plot2.PNG", width = 480, height = 480)

plot(powerDat[c(1,3)], type='l', ylab='Global Active Power (kilowatts)', xlab='')

dev.off()
