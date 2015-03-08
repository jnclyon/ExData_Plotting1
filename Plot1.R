##Loads up the full data set and sorts out the two days needed
powerdata <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
datafordates <- powerdata[powerdata$Date=='1/2/2007'|powerdata$Date=='2/2/2007',]

##Isolates the Global Active Power Dataset
globalActivePower <- as.numeric(as.character(datafordates$Global_active_power))

##Creates a histogram for the G.A.P. data
hist(globalActivePower,breaks=12,xlab="Global Active Power (kilowatts)",
     main="Global Active Power",col=c("red"))

##Saves off the histogram to a PNG file
dev.copy(png, file = "Plot1.png") 
dev.off()

