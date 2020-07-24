dt<-read.table("household_power_consumption.txt", sep = ";",header = TRUE)
dt$Date<-as.Date(dt$Date,"%d/%m/%Y")
library(dplyr)
dat<-filter(dt,Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))
rm(dt)

hist(as.numeric(dat$Global_active_power),main = "Global Active Power", col = "Red", ylim = c(0,1200) ,xlab = "Global Active Power (kilowatts)",las=1)

dev.copy(png,"plot1.png")
dev.off()