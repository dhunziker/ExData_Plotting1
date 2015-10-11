# Load the data
df <- read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?")

# Add timestamp in order to plot lines
df$Timestamp <- with(df, as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))

# Convert 1st column to Date
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# Subsetting to the records required
df <- df[df$Date >= as.Date("2007-02-01", "%Y-%m-%d") & df$Date <= as.Date("2007-02-02", "%Y-%m-%d"),]

# Plot the line graph
png("./plot2.png", width=480, height=480, bg = "white")
plot(df$Global_active_power ~ df$Timestamp, type="n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(df$Global_active_power ~ df$Timestamp)
dev.off()