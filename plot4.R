# Load the data
df <- read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?")

# Add timestamp in order to plot lines
df$Timestamp <- with(df, as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

# Convert 1st column to Date
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# Subsetting to the records required
df <- df[df$Date >= as.Date("2007-02-01", "%Y-%m-%d") & df$Date <= as.Date("2007-02-02", "%Y-%m-%d"),]


# Plot all 4 graphs
png("./plot4.png", width=480, height=480, bg = "white")
par(mfrow=c(2,2))

# Plot 1
plot(df$Global_active_power ~ df$Timestamp, type="n", xlab = "", ylab = "Global Active Power")
lines(df$Global_active_power ~ df$Timestamp)

# Plot 2
plot(df$Voltage ~ df$Timestamp, type="n", xlab = "datetime", ylab = "Voltage")
lines(df$Voltage ~ df$Timestamp)

# Plot 3
plot(df$Sub_metering_1 ~ df$Timestamp, type="n", xlab = "", ylab = "Energy sub metering")
lines(df$Sub_metering_1 ~ df$Timestamp)
lines(df$Sub_metering_2 ~ df$Timestamp, col = "red")
lines(df$Sub_metering_3 ~ df$Timestamp, col = "blue")
legend("topright", cex = 0.9, lty = 1, col=c('black','red','blue') , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

# Plot 4
plot(df$Global_reactive_power ~ df$Timestamp, type="n", xlab = "datetime", ylab = "Global_reactive_power")
lines(df$Global_reactive_power ~ df$Timestamp)

dev.off()