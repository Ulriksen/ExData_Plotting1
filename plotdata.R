#Shared functions for all plot#.R files.

#load subset to data frame and convert time and date columns.
getPlotData <- function() {
  powersubsetFile <- "./data/powersubset.txt"
  
  if (!file.exists("./data/powersubset.txt"))
    prepareData(powersubsetFile)
    
  powerSubset <- read.table(powersubsetFile, header=TRUE, stringsAsFactors = FALSE, dec=".")
  powerSubset$Time <- strptime(paste(powerSubset$Date, powerSubset$Time), "%d/%m/%Y %H:%M:%S")
  powerSubset$Date <- as.Date(powerSubset$Date , "%d/%m/%Y")
  powerSubset
}

#download and unzip file if txt file not found. Extract date range from file and save subset.
prepareData <- function(outputFilename) {
  
  #check if we have source data file.
  if (file.exists("household_power_consumption.txt"))
    con <- file("household_power_consumption.txt", open="r")
  else
  {  
    if (file.exists(".data/household_power_consumption.txt"))     {
      con <- file("./data/household_power_consumption.txt")
    }
    else {
      #could not find data, download
      temp <- tempfile()
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp, mode="wb")
      con <- unz(temp,"household_power_consumption.txt")
    }
  }
  
  #read all and save date-range to new file for quick processing accross all plots.
  data <- read.table(con, header=TRUE, sep=";", dec=".")
  subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
  if (!dir.exists("data")) {
    dir.create("data")
  }
  write.table(subsetData, file=outputFilename, append=FALSE, col.names = TRUE, row.names = FALSE)
}