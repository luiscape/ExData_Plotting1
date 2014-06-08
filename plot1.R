## Loading Data ##
source('load_data.R')

## Plotting ##
# This plot use base-graphics.
# And saves the results to a PNG file.
png('graphics/plot1.png')
hist(data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     main = "Global Active Power")
dev.off()