
#drawPlot1 function draws the Plot1 as specified in the assignment
drawPlot1 <- function() {
	#It has been assumed that 'household_power_consumption.txt' is present in current directory.
	input <- read.csv2("household_power_consumption.txt", colClasses = "character") #read the Electric power consumption data from the file
	reqData <- input[(input$Date == "1/2/2007" | input$Date == "2/2/2007"),] # read the data for 2-day period in February, 2007
	reqData[,'Global_active_power']<-as.numeric(reqData[,'Global_active_power']) #convert Global_active_power in numeric
	png(filename='plot1.png') #open graphics file device
	hist(reqData$Global_active_power, xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', col = 'red', main =' Global Active Power')
	dev.off() #close graphics file device
}