#This file generates histogram plot of Global active power from the power subset
#of 1st and 2nd of February 2007 
#-------------------------------------------------------------------------------

#Ensure common function for loading dataset exists
if(!exists("getPlotData", mode="function")) {
  source("plotdata.R")
}

#keep local and set to enforce english day names.
originalLocale <- Sys.getlocale("LC_TIME");
Sys.setlocale("LC_TIME","C")

#setup single page plot and png file
par(mfrow=c(1,1))
png(file="plot1.png", bg="transparent", width=480, heigh=480, units="px")

#Load subset of household_power_consumption.txt
powerSubset <- getPlotData()

#plot and save file.
hist(powerSubset$Global_active_power, main="Global Active Power", xlab ="Global Active Power (kilowatts)", col="red")

#save to file
dev.off()

#restore locale to user original
Sys.setlocale("LC_TIME",originalLocale)
