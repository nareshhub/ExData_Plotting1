powerin <- read.table("household_power_consumption.txt",header=T,sep=";",stringsAsFactors = F)
datain <- filter(powerin,Date %in% c("1/2/2007","2/2/2007"))
datain$Global_active_power <- as.numeric(datain$Global_active_power)

png("plot1.png",height=480,width=480)
par(mfrow=c(1,1))
hist(datain$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",
        main="Global Active Power",col="red")
dev.off()