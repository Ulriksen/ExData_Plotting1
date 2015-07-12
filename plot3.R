#This file generates graph for energy sub metering 1-3 from the power subset
#of 1st and 2nd of February 2007 
#------------------------------------------------------------------------------------


#Ensure common function for loading dataset exists
if(!exists("getPlotData", mode="function")) {
  source("plotdata.R")
}

#keep local and set to enforce english day names.
originalLocale <- Sys.getlocale("LC_TIME");
Sys.setlocale("LC_TIME","C")

#setup single page plot and png file
par(mfrow=c(1,1))
png(file="plot3.png", bg="transparent", width=480, heigh=480, units="px")

#Load subset of household_power_consumption.txt
powerSubset <- getPlotData()

#plot and save file.
plot(powerSubset$Time, powerSubset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=NA)
lines(powerSubset$Time, powerSubset$Sub_metering_2, type="l", col="red")
lines(powerSubset$Time, powerSubset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

#save to file
dev.off()

#restore locale to user original
Sys.setlocale("LC_TIME",originalLocale)
