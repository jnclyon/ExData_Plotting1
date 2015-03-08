##Loads up the full data set and sorts out the two days needed
powerdata <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
datafordates <- powerdata[powerdata$Date=='1/2/2007'|powerdata$Date=='2/2/2007',]
datafordates$theTime <- paste(datafordates$Date,datafordates$Time)
datafordates$theTime <- strptime(datafordates$theTime,format="%d/%m/%Y %H:%M:%S")

##Isolates the Global Active Power Dataset
globalActivePower <- as.numeric(as.character(datafordates$Global_active_power))

##Isolates the Sub-Metering Sets
Sub_metering_1 <- as.numeric(as.character(datafordates$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(datafordates$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(datafordates$Sub_metering_3))

##Isolates two new sets
Voltage <- as.numeric(as.character(datafordates$Voltage))
Global_reactive_power <- as.numeric(as.character(datafordates$Global_reactive_power))

##Starts the plot of multiple graphs to a PNG file
png(filename = "Plot4.png") 
par(mfrow=c(2,2))

##Plots global active power time series
plot(datafordates$theTime,globalActivePower,
     type = "l",
     xlab=" ",
     ylab="Global Active Power")

##Plots voltage time series
plot(datafordates$theTime,Voltage,
     type = "l",
     xlab="datetime")

##Plots sub-metering time series
plot(datafordates$theTime,Sub_metering_1,
     type = "l",
     xlab=" ",
     ylab="Energy sub metering",
     col="black")
lines(datafordates$theTime,Sub_metering_2,col="red")
lines(datafordates$theTime,Sub_metering_3,col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,bty="n",
       col=c("black","red","blue"))

##Plots global reactive power time series
plot(datafordates$theTime,Global_reactive_power,
     type = "l",
     xlab="datetime")

dev.off()

