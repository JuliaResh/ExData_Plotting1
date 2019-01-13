# The function to load the data is stored in a separate file
source("import_data.R")
data <- import_data("data/household_power_consumption.txt", 
                    as.Date('2007-02-01'), as.Date('2007-02-02'))

# initialize the png graphic device
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# create the plots
with(data, {
  plot(datetime, Global_active_power, type = 'l',
       xlab = "", ylab = "Global Active Power")
  plot(datetime, Voltage, type='l')
  
  plot(datetime, Sub_metering_1, type = 'l', xlab = "", ylab = "Energy sub metering")
  points(datetime, Sub_metering_2, type = 'l', col = 'red')
  points(datetime, Sub_metering_3, type = 'l', col = 'blue')
  legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = 'n',
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(datetime, Global_reactive_power, type='l')
})

# close the device to save plot to the file
dev.off()
