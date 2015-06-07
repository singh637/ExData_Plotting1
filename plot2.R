
#drawPlot2 function draws the Plot2 as specified in the assignment
drawPlot2 <- function() {
	#It has been assumed that 'household_power_consumption.txt' is present in current directory.
	input <- read.csv2("household_power_consumption.txt", colClasses = "character") #read the Electric power consumption data from the file
	reqData <- input[(input$Date == "1/2/2007" | input$Date == "2/2/2007"),] # read the data for 2-day period in February, 2007
	reqData[,'Global_active_power']<-as.numeric(reqData[,'Global_active_power']) #convert Global_active_power in numeric
	
	dateTime <- paste(reqData[,1], reqData[,2], sep = ' ') #combine date and time into a character
	dateTime <- strptime(dateTime, format = '%d/%m/%Y %H:%M:%S' ) #convert into Time format
	test <- cbind(reqData, dateTime) 
	
	png(filename='plot2.png') #open graphics file device
	plot(test$dateTime, test$Global_active_power, type = 'n', xlab = '', ylab = 'Global Active Power (kilowatts)') # prepare with no plot type
	lines(test$dateTime, test$Global_active_power)
	dev.off() #close graphics file device
}