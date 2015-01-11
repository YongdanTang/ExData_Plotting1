## 1. set the correct working directory and set the original file location
setwd("C:/Users/Yong/ExData_Plotting1/ExData_Plotting1")
fileurl = "C:/Users/Yong/ExData_Plotting1/exdata-data-household_power_consumption/household_power_consumption.txt"


## 2. Read the original data into R using read.csv() function, note "NA"s were stored as "?" in the orignial file, and sep = ";"
## One alternative is to read the data by using the fread() function from the "data.table" package, which is faster than read.csv() function.
## I used read.csv() function then use dplyr package to subset
household_power_consumption <- read.csv(file = fileurl, sep = ";", stringsAsFactors = FALSE, na.strings = "?")


## 3. convert the original data.frame into tbl_df data.frame and remove the old data.frame
library(dplyr)
hhpc1 <- tbl_df(household_power_consumption)
rm(household_power_consumption)

## 4. subset the original data using filter() function to contain only data dated 2007-02-01 and 2007-02-02
hhpc2 <- filter(hhpc1, Date == "1/2/2007" | Date == "2/2/2007")
rm(hhpc1)

## 5. draw the 1st histogram
## Open PNG device; create 'plot1.png' in the working directory
## Create plot and send to a file and annotate the plot with col, main and xlab arguments
## Close the PNG file device
## Then plot1.png is available in the working directory
png(file = "plot1.png") 
with(hhpc2, hist(Global_active_power, col = "red", main = "Glocal Active Power", xlab = "Glocal Active Power (kilowatts)")) 
dev.off() 


