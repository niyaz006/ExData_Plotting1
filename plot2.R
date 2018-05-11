
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

# Plot 2
# Make the x labels blank as per the requirements
par(mfrow=c(1,1))
plot(datetime, subsetData$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

# Save to file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
