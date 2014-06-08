## Loading Data ##
source('load_data.R')

## Plotting ##
png('graphics/plot2.png')
plot(dataClean$DateTime, dataClean$Global_active_power, 
     type = "l", 
     xlab = "",
     ylab = "Global Active Power")
dev.off()