df<-read.table("household_power_consumption.txt", header = T,
               sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?")
dataplott<- subset(df,df$Date=="1/2/2007"|df$Date=="2/2/2007")
datetime <- strptime(paste(dataplott$Date, dataplott$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
library(lubridate)
with(dataplott, {
   plot(datetime, Sub_metering_1, xlab = "", 
     ylab = "Energy sub metering", type = "l")
lines(datetime, Sub_metering_2, col = "red")
lines(datetime, Sub_metering_3,  col = "blue")})
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.6)     

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
