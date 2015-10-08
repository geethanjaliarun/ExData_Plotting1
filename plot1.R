uciData = read.table("./household_power_consumption.txt", header = TRUE, sep=";")
d1 = as.Date("2007-02-01", "%Y-%m-%d")
d2 = as.Date("2007-02-02", "%Y-%m-%d")
uciData$Date = as.Date(uciData$Date, "%d/%m/%Y")
newData = uciData[uciData$Date == d1 | uciData$Date == d2,]
newData$Time = hms(newData$Time)
newData$Global_active_power = as.character(newData$Global_active_power)
newData$Global_active_power = as.numeric(newData$Global_active_power)
png(filename = "plot1.png", height = 480, width = 480)
hist(newData$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red"
     , main = "Global Active Power", cex = 1.5)
dev.off()