powerin <- read.table("household_power_consumption.txt",header=T,sep=";",stringsAsFactors = F)
datain <- filter(powerin,Date %in% c("1/2/2007","2/2/2007"))

datain$dateTime <- paste(datain$Date,datain$Time,sep=" ")
datain$dateTime <- strptime(datain$dateTime,"%d/%m/%Y %H:%M:%S")
datain$Global_active_power <- as.numeric(datain$Global_active_power)

png("plot2.png",height=480,width=480)
par(mfrow=c(1,1))
plot(datain$dateTime,datain$Global_active_power,xlab = "",ylab="Global Active Power (kilowatts)",type = "l")
dev.off()
