df<-read.table("household_power_consumption.txt", header = T,
               sep=";", comment.char="%", stringsAsFactors=FALSE, na.strings="?")
dataplott<- subset(df,df$Date=="1/2/2007"|df$Date=="2/2/2007")
datetime <- strptime(paste(dataplott$Date, dataplott$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
hist(dataplott$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Acitive Power (kilowatts", ylab = "Frequency")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()








