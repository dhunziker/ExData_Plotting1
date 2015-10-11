# Load the data
df <- read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?")

# Convert 1st column to Date
df$Date <- as.Date(df$Date, "%d/%m/%Y")

# Subsetting to the records required
df <- df[df$Date >= as.Date("2007-02-01", "%Y-%m-%d") & df$Date <= as.Date("2007-02-02", "%Y-%m-%d"),]

# Plot the histogram
png("./plot1.png", width=480, height=480, bg = "white")
hist(df$Global_active_power, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()