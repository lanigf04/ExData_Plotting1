# read data into R
FILE <- "household_power_consumption.txt"
DATA <- read.table(text = grep("^[1,2]/2/2007",readLines(FILE),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

# Plot 1
# Open Device, Plot figure and Closing the device
if(!file.exists('Figures')) dir.create('Figures')
png(filename = './Figures/plot1.png', units='px')
with(DATA, hist(Global_active_power, ylab = 'Frequency',xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power', col = 'red'))
dev.off()
