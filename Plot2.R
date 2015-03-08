##Loads up the full data set and sorts out the two days needed
powerdata <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
datafordates <- powerdata[powerdata$Date=='1/2/2007'|powerdata$Date=='2/2/2007',]
datafordates$theTime <- paste(datafordates$Date,datafordates$Time)
datafordates$theTime <- strptime(datafordates$theTime,format="%d/%m/%Y %H:%M:%S")

##Isolates the Global Active Power Dataset
globalActivePower <- as.numeric(as.character(datafordates$Global_active_power))

##Plots the time-series data
plot(datafordates$theTime,globalActivePower,
     type = "l",
        xlab=" ",
        ylab="Global Active Power (kilowatts)")

##Saves off the histogram to a PNG file
dev.copy(png, file = "Plot1.png") 
dev.off()
