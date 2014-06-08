## Loading Data ##
source('load_data.R')

## Plotting ##
png('graphics/plot4.png')
par(mfrow=c(2,2))

# Plot 1
plot(dataClean$DateTime, dataClean$Global_active_power, 
     type = "l", 
     xlab = "",
     ylab = "Global Active Power")

# Plot 2
plot(dataClean$DateTime, dataClean$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

# Plot 3
plot(dataClean$DateTime, dataClean$Sub_metering_1, 
     type = "l", 
     xlab = "",
     ylab = "Energy sub metering")
lines(dataClean$DateTime, dataClean$Sub_metering_2, col = "red")
lines(dataClean$DateTime, dataClean$Sub_metering_3, col = "blue")
legend("topright", lty = 1,
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       bty = "n")

# Plot 4
plot(dataClean$DateTime, dataClean$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()