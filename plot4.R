setwd("~/r/ExData_Plotting1")
Sys.setenv(LANG = "en") # does not work - days of week will be printed in Italian
library(data.table)
t <- fread("data.csv", header = TRUE)
x11()
par(mfcol=c(2,2))

#Global active power - topleft
x <- strptime(t$DateTime, format = "%Y-%m-%d %H:%M:%S")
y <- t$Global_active_power
plot(x, y, ann=FALSE, type="n")
lines(x, y)
title(ylab="Global Active Power (kilowatts)")

#Energy sub metering - bottomleft
y1 <- t$Sub_metering_1
y2 <- t$Sub_metering_2
y3 <- t$Sub_metering_3
plot(x, y1, ann=FALSE, type="n")
lines(x, y1, col = "black")
lines(x, y2, col = "red")
lines(x, y3, col = "blue")
title(ylab="Energy sub metering")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=c(1, 1, 1), bty = "n")

#Voltage - topright
y <- t$Voltage
plot(x, y, ann=FALSE, type="n")
lines(x, y)
title(xlab = "datetime", ylab="Voltage")

#Global reactive power - bottomright
y <- t$Global_reactive_power
plot(x, y, ann=FALSE, type="n")
lines(x, y)
title(xlab = "datetime", ylab="Global_reactive_power")

dev.copy(device = png, filename="plot4.png")
dev.off()
dev.off(dev.prev())