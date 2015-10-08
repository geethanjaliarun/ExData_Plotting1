uciData = read.table("./household_power_consumption.txt", header = TRUE, sep=";")
library(lubridate)
uciData$Date = dmy(uciData$Date)
d1 = ymd("2007-02-01")
d2 = ymd("2007-02-02")
newData = uciData[uciData$Date == d1 | uciData$Date == d2,]
newData$Time = hms(newData$Time)
newData$Global_active_power = as.character(newData$Global_active_power)
newData$Global_active_power = as.numeric(newData$Global_active_power)
newData$Global_reactive_power = as.character(newData$Global_reactive_power)
newData$Global_reactive_power = as.numeric(newData$Global_reactive_power)
newData$Sub_metering_1 = as.character(newData$Sub_metering_1)
newData$Sub_metering_2 = as.character(newData$Sub_metering_2)
newData$Sub_metering_3 = as.character(newData$Sub_metering_3)
newData$Sub_metering_1 = as.numeric(newData$Sub_metering_1)
newData$Sub_metering_2 = as.numeric(newData$Sub_metering_2)
newData$Sub_metering_3 = as.numeric(newData$Sub_metering_3)
newData$Voltage = as.character(newData$Voltage)
newData$Voltage = as.numeric(newData$Voltage)

png(filename = "plot4.png", height = 480, width = 480)
par(mfcol = c(2,2))

plot(1:2880, newData$Global_active_power, type="l", xaxt="n", xlab = "",
     ylab = "Global Active Power")
newXaxis = seq(from = 0, to = 2880, by = 1440)
axis(side = 1, at = newXaxis, labels=c("Thu", "Fri", "Sat"))

plot(1:2880, newData$Sub_metering_1, type="l", xaxt="n", xlab = "", ylab = "Energy sub metering", col = "black", yaxt="n")
lines(1:2880, newData$Sub_metering_2, type="l", xaxt="n", xlab = "", ylab = "Energy sub metering", col = "red")
lines(1:2880, newData$Sub_metering_3, type="l", xaxt="n", xlab = "", col = "blue",
      ylab = "Energy sub metering")
newXaxis = seq(from = 0, to = 2880, by = 1440)
newYaxis = seq(from = 0, to = 30, by = 10)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = c(1,1,1), col = c("black","red","blue"), bty="n")
axis(side = 1, at = newXaxis, labels=c("Thu", "Fri", "Sat"))
axis(side = 2, at = newYaxis)

plot(1:2880, newData$Voltage, type="l", xlab="datetime", ylab="Voltage", xaxt="n")
newXaxis = seq(from = 0, to = 2880, by = 1440)
axis(side = 1, at = newXaxis, labels=c("Thu", "Fri", "Sat"))


plot(1:2880, newData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", xaxt="n", ylim = c(0, 0.5))
newXaxis = seq(from = 0, to = 2880, by = 1440)
axis(side = 1, at = newXaxis, labels=c("Thu", "Fri", "Sat"))

dev.off()