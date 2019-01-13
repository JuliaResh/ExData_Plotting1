# The function to load the data is stored in a separate file
source("import_data.R")
data <- import_data("data/household_power_consumption.txt", 
                    as.Date('2007-02-01'), as.Date('2007-02-02'))

# create the plot
hist(data$Global_active_power, main = "Global Active Power",
     xlab = 'Global Active Power (kilowatts)', col = 'red')

# save plot to the file
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()