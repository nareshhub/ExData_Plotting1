powerin <- read.table("household_power_consumption.txt",header=T,sep=";",stringsAsFactors = F,nrows=4)
names <- names(powerin)
datain <- read.table(pipe("findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt"),header=T,sep=";",stringsAsFactors = F)
colnames(datain) <- names

png("plot1.png",height=480,width=480)
par(mfrow=c(1,1))
hist(datain$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",
        main="Global Active Power",col="red")
dev.off()