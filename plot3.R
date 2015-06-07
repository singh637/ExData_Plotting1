
#drawPlot3 function draws the Plot3 as specified in the assignment
drawPlot3 <- function() {
	#It has been assumed that 'household_power_consumption.txt' is present in current directory.
	input <- read.csv2("household_power_consumption.txt", colClasses = "character") #read the Electric power consumption data from the file
	reqData <- input[(input$Date == "1/2/2007" | input$Date == "2/2/2007"),] # read the data for 2-day period in February, 2007
	reqData[,'Global_active_power']<-as.numeric(reqData[,'Global_active_power']) #convert Global_active_power in numeric
	
	dateTime <- paste(reqData[,1], reqData[,2], sep = ' ') #combine date and time into a character
	dateTime <- strptime(dateTime, format = '%d/%m/%Y %H:%M:%S' ) #convert into Time format
	test <- cbind(reqData, dateTime) 
	test[,'Sub_metering_1'] <- as.numeric(test[,'Sub_metering_1'])
	test[,'Sub_metering_2'] <- as.numeric(test[,'Sub_metering_2'])
	test[,'Sub_metering_3'] <- as.numeric(test[,'Sub_metering_3'])
	

	
	png(filename='plot3.png') #open graphics file device

	plot(test$dateTime, test$Sub_metering_1, type='n',  xlab = '', ylab = 'Energy sub metering')	
	
	lines(test$dateTime, test$Sub_metering_1, col ='black')
	lines(test$dateTime, test$Sub_metering_2, col ='red')
    lines(test$dateTime, test$Sub_metering_3, col ='blue')
	legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=1, col =c('black','red','blue'))
	
	dev.off() #close graphics file device
}