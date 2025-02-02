powerin <- read.table("household_power_consumption.txt",header=T,sep=";",stringsAsFactors = F)
datain <- filter(powerin,Date %in% c("1/2/2007","2/2/2007"))

datain$dateTime <- paste(datain$Date,datain$Time,sep=" ")
datain$dateTime <- strptime(datain$dateTime,"%d/%m/%Y %H:%M:%S")
datain$Global_reactive_power <- as.numeric(datain$Global_reactive_power)
datain$Sub_metering_1 <- as.numeric(datain$Sub_metering_1)
datain$Sub_metering_2 <- as.numeric(datain$Sub_metering_2)
datain$Sub_metering_3 <- as.numeric(datain$Sub_metering_3)
datain$Voltage <- as.numeric(datain$Voltage)
datain$Global_active_power <- as.numeric(datain$Global_active_power)


png("plot4.png",height=480,width=480)
par(mfrow=c(2,2))
par(mar=c(4,4,1,1))

plot(datain$dateTime,datain$Global_active_power,xlab="",ylab="Global Active Power",type="l")

plot(datain$dateTime,datain$Voltage,xlab="datetime",ylab="Voltage",type="l")

plot(datain$dateTime,datain$Sub_metering_1,xlab = "",ylab="Energy Sub Metering",type = "l",col="black")
lines(datain$dateTime,datain$Sub_metering_2,type="l",col="red")
lines(datain$dateTime,datain$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","green"),bty="n")

plot(datain$dateTime,datain$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()