# read data & subset
setwd("C:/Users/mixomix/Desktop/r/ExData_Plotting1/")

dt <- read.csv2("c:/Users/mixomix/Desktop/household_power_consumption.txt",na.strings = "?")
dt$Date <- as.Date(dt$Date, format = '%d/%m/%Y')
dt$Timestamp <- strptime(paste(as.character(dt$Date),dt$Time), format = "%Y-%m-%d %H:%M:%S")
dt <- subset(dt, Date >= "2007-02-01" & Date <= "2007-02-02")
dt$Global_active_power <- as.numeric(dt$Global_active_power)

Sys.setlocale("LC_TIME", "English")

png("plot2.png")
plot(dt$Timestamp,dt$Global_active_power/1000*2,type = "l",main = "", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

