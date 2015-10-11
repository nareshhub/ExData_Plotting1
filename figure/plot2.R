powerin <- read.table("household_power_consumption.txt",header=T,sep=";",stringsAsFactors = F,nrows=4)
names <- names(powerin)
datain <- read.table(pipe("findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt"),header=T,sep=";",stringsAsFactors = F)
colnames(datain) <- names
datain$dateTime <- paste(datain$Date,datain$Time,sep=" ")
datain$dateTime <- strptime(datain$dateTime,"%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1))
plot(datain$dateTime,datain$Global_active_power,xlab = "",ylab="Global Active Power (kilowatts)",type = "l")

