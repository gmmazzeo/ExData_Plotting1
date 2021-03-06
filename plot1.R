setwd("~/r/ExData_Plotting1")
library(data.table)
t <- fread("data.csv", header = TRUE)
x11()
hist(t$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(device = png, filename="plot1.png")
dev.off()
dev.off(dev.prev())