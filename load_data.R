## Loading Data ##
# The dataset has more than 2 million observations.
# First, I have to calculate how much memory will be
# necessary to load this data set in R.
# I am using a function provided by the user Carlos Cinelli
# on StackOverflow.
HowMuchRAM <-function(ncol, nrow, cushion=3){
    #40 bytes per col
    colBytes <- ncol*40
    
    #8 bytes per cell
    cellBytes <- ncol*nrow*8
    
    #object.size
    object.size <- colBytes + cellBytes
    
    #RAM
    RAM <- object.size*cushion
    cat("Your dataset will have up to", format(object.size*9.53674e-7, digits=1), "MB and you will probably need", format(RAM*9.31323e-10,digits=1), "GB of RAM to deal with it.")
    result <- list(object.size = object.size, RAM = RAM, ncol=ncol, nrow=nrow, cushion=cushion)
}

HowMuchRAM(ncol = 9, nrow = 2075259)

# As seen running the function above:
# - The dataset has around 142 MB
# - And will need 0.4 GB of RAM

# Considering the above, let's load data selectively.
# (Loading the whole dataset is also an option. In my computer
# it took 25 seconds.)
data <- read.csv('data/household_power_consumption.txt', sep = ";")

# Converting the the right classes.
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$Global_active_power <- as.double(as.character(data$Global_active_power))

# Subsetting for only the date-range of interest: 2007-02-01 and 2007-02-02
data <- subset(data, (Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02')))

# Let's create a single column with dates and times.
correctDates <- function(df) {
    for(i in 1:nrow(df)) {
        df$DateTime[i] <- paste(as.character(df$Date[i]), as.character(df$Time[i]))
    }
    df$Date <- NULL
    df$Time <- NULL
    df$DateTime <- strptime(df$DateTime, format = "%Y-%m-%d %H:%M:%S")
    df
}

dataClean <- correctDates(df = data)