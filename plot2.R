# The function to load the data is stored in a separate file
source("import_data.R")
data <- import_data("data/household_power_consumption.txt", 
                    as.Date('2007-02-01'), as.Date('2007-02-02'))

# create the plot
with(data, plot(datetime, Global_active_power, type = 'l',
                xlab = "", ylab = "Global Active Power (kilowatts)"))

# save plot to the file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()