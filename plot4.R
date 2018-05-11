
# Unzip dataset
unzip("exdata_data_household_power_consumption.zip")

# Fetch names from the dataset
namesData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)

# Fetch required data. Beginning of 01-Feb-2007 on row 66637
subsetData <- read.table("household_power_consumption.txt", sep=";", 
                         na.strings=c("NA","?"), skip=66637, nrows=2880)

# Assign names to the data frame to clean it up
names(subsetData) <- names(namesData)

# Get Date and Time for plotting
dates <- paste(subsetData$Date, subsetData$Time)
datetime <- strptime(dates, "%d/%m/%Y %H:%M:%S")

# Plot 4
par(mfrow=c(2,2))

# First plot - Global Active Power
plot(datetime, subsetData$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

# Second plot - Voltage
plot(datetime, subsetData$Voltage, type="l", ylab="Voltage", 
     xlab="datetime")

# Third plot - Replica of plot3.R
plot(datetime, subsetData$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering", col="black")
lines(datetime, subsetData$Sub_metering_2, col="red")
lines(datetime, subsetData$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Fourth plot - Global reactive power
plot(datetime, subsetData$Global_reactive_power, cex=0.95, type="l", 
     ylab="Global_reactive_power", xlab="datetime", xaxt="n")

# Save to file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
