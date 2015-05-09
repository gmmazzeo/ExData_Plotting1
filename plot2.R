setwd("~/r/ExData_Plotting1")
Sys.setenv(LANG = "en") # does not work - days of week will be printed in Italian
library(data.table)
t <- fread("data.csv", header = TRUE)
x11()
x <- strptime(t$DateTime, format = "%Y-%m-%d %H:%M:%S")
y <- t$Global_active_power
plot(x, y, ann=FALSE, type="n")
lines(x, y)
title(ylab="Global Active Power (kilowatts)")
dev.copy(device = png, filename="plot2.png")
dev.off()
dev.off(dev.prev())