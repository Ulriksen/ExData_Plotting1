#This file generates graph for global active power in kilowatts from the power subset
#of 1st and 2nd of February 2007 
#------------------------------------------------------------------------------------

#Ensure common function for loading dataset exists
if(!exists("getPlotData", mode="function")) {
  source("plotdata.R")
}

#keep local and set to enforce english day names.
originalLocale <- Sys.getlocale("LC_TIME");
Sys.setlocale("LC_TIME","C")

#setup single page plot
par(mfrow=c(1,1))

#Load subset of household_power_consumption.txt
powerSubset <- getPlotData()

#plot and save file.
plot(powerSubset$Time,powerSubset$Global_active_power, type="l",ylab ="Global Active Power (kilowatts)", xlab=NA) 
dev.copy(png,"plot2.png")
dev.off()

#restore locale to user original
Sys.setlocale("LC_TIME",originalLocale)

