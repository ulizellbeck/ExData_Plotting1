## Set working directory
setwd(dir="media/tko//44C0B556C0B54F44/data_scientist/coursera/courses/04_ExploratoryAnalysis/assignments/assignment_1//ExData_Plotting1")

## Install packages if necessary
install.packages("sqldf")

## This script uses sqldf
require(sqldf)

## Step 1 Read the data

## Set file directory
File <- "../data/household_power_consumption.txt"

## I had to change the locale to the default for the C language which reflects North-American usage 
## so that the plot uses english names for weekdays.
Sys.setlocale(locale = "C")

## An SQL Statement is used to read only the necessary lines (see 
## https://class.coursera.org/exdata-002/forum/thread?thread_id=19#post-111 
## for more information.)

SQL_Statement <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

## Only the lines where Date is '1/2/2007' OR Date = '2/2/2007' are read into the variable
myData <- read.csv2.sql(File,SQL_Statement)

## Create new column with date_time
myData$date_time <- strptime(paste(myData$Date, myData$Time), format="%d/%m/%Y %H:%M:%S")

## Convert Sub_Metering into numeric format
myData$Sub_metering_1 <- as.numeric(myData$Sub_metering_1)
myData$Sub_metering_2 <- as.numeric(myData$Sub_metering_2)
myData$Sub_metering_3 <- as.numeric(myData$Sub_metering_3)

## Plot the graphic 
plot3 <- png(filename="plot3.png", width = 480, height = 480)
with(myData, {
        plot(date_time,Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
        lines(date_time,Sub_metering_1,col="black")
        lines(date_time,Sub_metering_2,col="red")
        lines(date_time,Sub_metering_3,col="blue")
        legend("topright", lwd=1, col=c("black","red","blue"),
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()
