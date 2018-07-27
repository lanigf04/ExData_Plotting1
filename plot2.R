# read data into R
FILE <- "household_power_consumption.txt"
DATA <- read.table(text = grep("^[1,2]/2/2007",readLines(FILE),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

# Plot 2
DATA$Date <- as.Date(DATA$Date, format = '%d/%m/%Y')
DATA$DateTime <- as.POSIXct(paste(DATA$Date, DATA$Time))
# Open Device, Plot figure and Closing the device
if(!file.exists('Figures')) dir.create('Figures')
png(filename = './Figures/plot2.png', units='px')
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(DATA$DateTime, DATA$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatts)', type = 'l')
dev.off()