setwd("~/r/ExData_Plotting1")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","data.zip","curl")
library(data.table)
t <- fread(unzip("data.zip"), header = TRUE, sep = ";")
file.remove("data.zip")
file.remove("household_power_consumption.txt")
t$Date <- as.Date(t$Date, format = "%d/%m/%Y")
t <- subset(t, t$Date>="2007-02-01" & t$Date<="2007-02-02")
numericCols=3:ncol(t)
for (j in numericCols) set(t,j=j,value=as.numeric(t[[j]]))
t <- cbind(DateTime=paste(strftime(t$Date, format="%Y-%m-%d"), t$Time, sep = " "), t)
t <- t[,Date:=NULL]
t <- t[,Time:=NULL]
write.table(t, file = "data.csv", row.names = FALSE)