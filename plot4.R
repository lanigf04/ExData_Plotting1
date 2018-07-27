# read data into R
FILE <- "household_power_consumption.txt"
DATA <- read.table(text = grep("^[1,2]/2/2007",readLines(FILE),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

# Plot 4
# Open Device, Plot figure and Closing the device
if(!file.exists('Figures')) dir.create('Figures')
png(filename = './Figures/plot4.png', units='px')
Sys.setlocale(category = "LC_ALL", locale = "english")
par(mfrow = c(2, 2))
plot(DATA$DateTime, DATA$Global_active_power, xlab = '', ylab = 'Global Active Power', type = 'l')
plot(DATA$DateTime, DATA$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
plot(DATA$DateTime, DATA$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(DATA$DateTime, DATA$Sub_metering_2, col = 'red')
lines(DATA$DateTime, DATA$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
plot(DATA$DateTime, DATA$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
dev.off()

