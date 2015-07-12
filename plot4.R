#This file generates 4 plots for from the power subset #of 1st and 2nd of February 2007 
#The first 3 mimics plot 1-3 while the last plot graphs global reactiv power. 
#--------------------------------------------------------------------------------------

#Ensure common function for loading dataset exists
if(!exists("getPlotData", mode="function")) {
  source("plotdata.R")
}

#keep local and set to enforce english day names.
originalLocale <- Sys.getlocale("LC_TIME");
Sys.setlocale("LC_TIME","C")

#Setup multipage plot
par(mfrow = c(2, 2)) 

#Load subset of household_power_consumption.txt
powerSubset <- getPlotData()

#plot 1
plot(powerSubset$Time,powerSubset$Global_active_power,type="l", ylab ="Global Active Power", xlab=NA)

#plot 2
plot(powerSubset$Time,powerSubset$Voltage, type="l", ylab ="Voltage", xlab="datetime")

#plot 3
plot(powerSubset$Time, powerSubset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=NA)
lines(powerSubset$Time, powerSubset$Sub_metering_2, type="l", col="red")
lines(powerSubset$Time, powerSubset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue"))

#plot 4
plot(powerSubset$Time, powerSubset$Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power")

#copy to file and save
dev.copy(png,"plog4.png")
dev.off()

#restore locale to user original
Sys.setlocale("LC_TIME",originalLocale)