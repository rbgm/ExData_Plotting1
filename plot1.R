######################################
## Exploratory Data Analysis Project 1
######################################

################
## Plot 1 Script
################


## Downloads the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("plot")){
  dir.create("plot")
  download.file(fileUrl, destfile="./plot/household_power_consumption.zip", method = "auto")
  #unzip("./plot/household_power_consumption.zip")
}


## Loads the data
data <- read.table(unz("./plot/household_power_consumption.zip", "household_power_consumption.txt"),
                   header = TRUE, sep = ";", na.strings = "?")


## Adds a new column with the Date and time as Date Class
data <- cbind(paste(data$Date, data$Time), data)
names(data)[1] <- "Date_time"
data$Date_time <- strptime(data$Date_time, "%d/%m/%Y %H:%M:%S")

## Filters data between 2007-02-01 and 2007-02-02
data1 <- data[data$Date_time > "2007-02-01" & data$Date_time < "2007-02-03",]


## Creates the Plot 1
hist(data1$Global_active_power, col = "red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

## Copies plot to PNG
dev.copy(png, file="plot1.png")
dev.off()









