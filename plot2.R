dt<-read.table("household_power_consumption.txt", sep = ";",header = TRUE)
dt$Date<-as.Date(dt$Date,"%d/%m/%Y")
library(dplyr)
dat<-filter(dt,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))
rm(dt)
dat$datetime<-strptime(paste(dat$Date,dat$Time),format = "%Y-%m-%d %H:%M:%S")

plot(dat$datetime,as.numeric(dat$Global_active_power),ylab = "Global Active Power (kilowatts)",xlab = "",xlim = c(as.POSIXct("2007-02-01 00:00:00",format = "%Y-%m-%d %H:%M:%S"),as.POSIXct("2007-02-03 00:00:00",format = "%Y-%m-%d %H:%M:%S")),type = 'l')

dev.copy(png,"plot2.png")
dev.off()