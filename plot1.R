#
# Plot 1
#

# load the data from zip file
powerDat <- read.csv(unz('household_power_consumption.zip',
                             'household_power_consumption.txt'),
                sep=';', na.strings="?",
                colClasses=c(rep('character',2), rep('numeric',7)))

# filter for the days we want
powerDat <- powerDat[powerDat$Date %in% c('1/2/2007', '2/2/2007'),]

# make the plot
png(filename = "plot1.PNG", width = 480, height = 480)

hist(powerDat$Global_active_power, col = 'red', main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')

dev.off()

