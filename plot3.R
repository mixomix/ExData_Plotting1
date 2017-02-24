# read data & subset
setwd("C:/Users/mix/Desktop/ExData_Plotting1/")

dt <- read.csv2("c:/Users/mix/Desktop/household_power_consumption.txt",na.strings = "?")
dt$Date <- as.Date(dt$Date, format = '%d/%m/%Y')
dt$Timestamp <- strptime(paste(as.character(dt$Date),dt$Time), format = "%Y-%m-%d %H:%M:%S")
dt <- subset(dt, Date >= "2007-02-01" & Date <= "2007-02-02")

options(digits=3)
dt$Sub_metering_1 <- as.numeric(as.character(dt$Sub_metering_1))
dt$Sub_metering_2 <- as.numeric(as.character(dt$Sub_metering_2))
dt$Sub_metering_3 <- as.numeric(as.character(dt$Sub_metering_3))
dt$Global_reactive_power <- as.numeric(as.character(dt$Global_reactive_power))
dt$Voltage <- as.numeric(as.character(dt$Voltage))

Sys.setlocale("LC_TIME", "English")

png("plot3.png")

plot(dt$Timestamp,dt$Sub_metering_1,type = "l",main = "", ylab = "Energy sub metering", xlab = "")
lines(dt$Timestamp,dt$Sub_metering_2,type = "l",main = "", col="red", ylab = "Energy sub metering", xlab = "")
lines(dt$Timestamp,dt$Sub_metering_3,type = "l",main = "", col="blue", ylab = "Energy sub metering", xlab = "")
legend("topright",lty = 1,col = c("black","red","blue") ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

