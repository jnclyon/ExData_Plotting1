##Loads up the full data set and sorts out the two days needed
powerdata <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
datafordates <- powerdata[powerdata$Date=='1/2/2007'|powerdata$Date=='2/2/2007',]
datafordates$theTime <- paste(datafordates$Date,datafordates$Time)
datafordates$theTime <- strptime(datafordates$theTime,format="%d/%m/%Y %H:%M:%S")

##Isolates the Sub-Metering Sets
Sub_metering_1 <- as.numeric(as.character(datafordates$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(datafordates$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(datafordates$Sub_metering_3))

##Plots the time-series data
png(filename = "Plot3.png") 
plot(datafordates$theTime,Sub_metering_1,
     type = "l",
     xlab=" ",
     ylab="Energy sub metering",
     col="black")
lines(datafordates$theTime,Sub_metering_2,col="red")
lines(datafordates$theTime,Sub_metering_3,col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,cex=0.5,
       col=c("black","red","blue"))
dev.off()