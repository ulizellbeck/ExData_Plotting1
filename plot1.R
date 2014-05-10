## Set working directory
setwd(dir="media/tko//44C0B556C0B54F44/data_scientist/coursera/courses/04_ExploratoryAnalysis/assignments/assignment_1//ExData_Plotting1")

## Install packages if necessary
install.packages("sqldf")

## This script uses sqldf
require(sqldf)

## Step 1 Read the data

## Set file directory
File <- "../data/household_power_consumption.txt"

## An SQL Statement is used to read only the necessary lines (see 
## https://class.coursera.org/exdata-002/forum/thread?thread_id=19#post-111 
## for more information.)

SQL_Statement <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

## Only the lines where Date is '1/2/2007' OR Date = '2/2/2007' are read into the variable
myData <- read.csv2.sql(File,SQL_Statement)

## Plot the graphic 
plot1 <- png(filename="plot1.png", width= 480, height = 480)
with(myData, hist(Global_active_power, xlab="Global Active Power (kilowatts)", 
                  col = "red", main="Global Active Power"))
dev.off()
