
#drawPlot4 function draws the Plot4 as specified in the assignment
drawPlot4 <- function() {
	input <- read.csv2("household_power_consumption.txt", colClasses = "character") #read the Electric power consumption data from the file
	reqData <- input[(input$Date == "1/2/2007" | input$Date == "2/2/2007"),] # read the data for 2-day period in February, 2007
	reqData[,'Global_active_power']<-as.numeric(reqData[,'Global_active_power']) #convert Global_active_power in numeric
	
	dateTime <- paste(reqData[,1], reqData[,2], sep = ' ') #combine date and time into a character
	dateTime <- strptime(dateTime, format = '%d/%m/%Y %H:%M:%S' ) #convert into Time format
	test <- cbind(reqData, dateTime) 
	test[,'Sub_metering_1'] <- as.numeric(test[,'Sub_metering_1'])
	test[,'Sub_metering_2'] <- as.numeric(test[,'Sub_metering_2'])
	test[,'Sub_metering_3'] <- as.numeric(test[,'Sub_metering_3'])
	test[,'Global_reactive_power'] <- as.numeric(test[,'Global_reactive_power'])
	test[,'Voltage'] <- as.numeric(test[,'Voltage'])

	png(filename='plot4.png') #open graphics file device
	par(mar=c(4,4,2,1))
	par(mai=c(0.7,0.7,0.6,0.4))
	par(mfrow=c(2,2)) # no. of graphs to be plotted
	
	#graph1
	plot(test$dateTime, test$Global_active_power, type = 'n', xlab = '', ylab = 'Global Active Power', cex.lab = 1) 
	lines(test$dateTime, test$Global_active_power)
	
	#graph2
	plot(test$dateTime, test$Voltage, type = 'n', xlab = 'datetime', ylab = 'Voltage', cex.lab = 1) 
	lines(test$dateTime, test$Voltage)

	#graph3
	plot(test$dateTime, test$Sub_metering_1, type='n',  xlab = '', ylab = 'Energy sub metering', cex.lab = 1)
	lines(test$dateTime, test$Sub_metering_1, col ='black')
	lines(test$dateTime, test$Sub_metering_2, col ='red')
    lines(test$dateTime, test$Sub_metering_3, col ='blue')
	legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=1, col =c('black','red','blue'),bty="n",cex = 0.9)
	
	#graph4
	plot(test$dateTime, test$Global_reactive_power, type = 'n', xlab = 'datetime', ylab = 'Global_reactive_power', cex.lab = 1) 
	lines(test$dateTime, test$Global_reactive_power)
	
	dev.off() #close graphics file device
}