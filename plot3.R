# Load the data
df <- read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?")

# Add timestamp in order to plot lines
df$Timestamp <- with(df, as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

# Convert 1st column to Date
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# Subsetting to the records required
df <- df[df$Date >= as.Date("2007-02-01", "%Y-%m-%d") & df$Date <= as.Date("2007-02-02", "%Y-%m-%d"),]

# Plot the line graph
png("./plot3.png", width=480, height=480, bg = "white") # Avoiding dev.copy because of some issues with the legend
plot(df$Sub_metering_1 ~ df$Timestamp, type="n", xlab = "", ylab = "Energy sub metering")
lines(df$Sub_metering_1 ~ df$Timestamp)
lines(df$Sub_metering_2 ~ df$Timestamp, col = "red")
lines(df$Sub_metering_3 ~ df$Timestamp, col = "blue")
legend("topright", lty = 1, col=c('black','red','blue') , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()