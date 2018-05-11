
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

# Plot 3
# Make the x labels blank as per the requirements
par(mfrow=c(1,1))
plot(datetime, subsetData$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering", col="black")

# Add in the other two plots. Red and Blue
lines(datetime, subsetData$Sub_metering_2, type="l", col="red")
lines(datetime, subsetData$Sub_metering_3, type="l", col="blue")


# Adding Legends
legend("topright", lty=1, col=c("black","red","blue"), cex=0.95,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save to file
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
