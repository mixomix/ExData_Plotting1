# read data & subset
setwd("C:/Users/mixomix/Desktop/r/ExData_Plotting1/")

dt <- read.csv2("c:/Users/mixomix/Desktop/household_power_consumption.txt",na.strings = "?")
dt$Date <- as.Date(dt$Date, format = '%d/%m/%Y')
dt$Timestamp <- strptime(paste(as.character(dt$Date),dt$Time), format = "%Y-%m-%d %H:%M:%S")
dt <- subset(dt, Date >= "2007-02-01" & Date <= "2007-02-02")
dt$Global_active_power <- as.numeric(dt$Global_active_power)
dt$Sub_metering_1 <- as.numeric(dt$Sub_metering_1)
dt$Sub_metering_2 <- as.numeric(dt$Sub_metering_2)
dt$Sub_metering_3 <- as.numeric(dt$Sub_metering_3)

Sys.setlocale("LC_TIME", "English")

png("plot2.png")
par(ylog = TRUE)
plot(dt$Timestamp,dt$Sub_metering_1,type = "l",main = "", ylab = "Energy sub metering", xlab = "")

lines(dt$Timestamp,dt$Sub_metering_3/3,type = "l",main = "", col="red", ylab = "Energy sub metering", xlab = "")
dev.off()

