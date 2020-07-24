dt<-read.table("household_power_consumption.txt", sep = ";",header = TRUE)
dt$Date<-as.Date(dt$Date,"%d/%m/%Y")
library(dplyr)
dat<-filter(dt,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))
rm(dt)
dat$datetime<-strptime(paste(dat$Date,dat$Time),format = "%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))
#First plot
plot(dat$datetime,as.numeric(dat$Global_active_power),ylab = "Global Active Power (kilowatts)",xlab = "",xlim = c(as.POSIXct("2007-02-01 00:00:00",format = "%Y-%m-%d %H:%M:%S"),as.POSIXct("2007-02-03 00:00:00",format = "%Y-%m-%d %H:%M:%S")),type = 'l')

#Second Plot
plot(dat$datetime,as.numeric(dat$Voltage),ylab = "Voltage",xlab = "datetime",xlim = c(as.POSIXct("2007-02-01 00:00:00",format = "%Y-%m-%d %H:%M:%S"),as.POSIXct("2007-02-03 00:00:00",format = "%Y-%m-%d %H:%M:%S")),type = 'l')

#Third Plot
plot(dat$datetime,as.numeric(dat$Sub_metering_1),ylab = "Energy sub metering",xlab = "",xlim = c(as.POSIXct("2007-02-01 00:00:00",format = "%Y-%m-%d %H:%M:%S"),as.POSIXct("2007-02-03 00:00:00",format = "%Y-%m-%d %H:%M:%S")),type = 'l')
lines(dat$datetime,dat$Sub_metering_2,col="red")
lines(dat$datetime,dat$Sub_metering_3,col="blue")

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty = "n",cex = 0.2)

#Fourth Plot
plot(dat$datetime,as.numeric(dat$Global_reactive_power),ylab = "Global_reactive_power",xlab = "datetime",xlim = c(as.POSIXct("2007-02-01 00:00:00",format = "%Y-%m-%d %H:%M:%S"),as.POSIXct("2007-02-03 00:00:00",format = "%Y-%m-%d %H:%M:%S")),type = 'l')

dev.copy(png,"plot4.png")
dev.off()