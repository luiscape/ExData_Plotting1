## Loading Data ##
source('load_data.R')

## Plotting ##
png('graphics/plot3.png')
plot(dataClean$DateTime, dataClean$Sub_metering_1, 
     type = "l", 
     xlab = "",
     ylab = "Energy sub metering")
lines(dataClean$DateTime, dataClean$Sub_metering_2, col = "red")
lines(dataClean$DateTime, dataClean$Sub_metering_3, col = "blue")
legend("topright", lty = 1, 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"))
dev.off()