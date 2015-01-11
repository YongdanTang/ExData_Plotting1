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

## 5. change the date format into POSIXt format so that week day info can be properly displayed
## combine the Date and Time variables into one variable datetime using paste() function
## remove the Date and Time variables using select() function
## convert the datetime variable into POSIXt format using strptime() function
hhpc2$datetime <- paste(hhpc2$Date, hhpc2$Time, sep=" ")
hhpc2 = hhpc2 %>% select(datetime, Global_active_power:Sub_metering_3)
hhpc2$datetime <- strptime(hhpc2$datetime, format = "%d/%m/%Y %H:%M:%S")


## 6. draw the 2nd line chart
## Open PNG device; create 'plot2.png' in the working directory
## Create plot and annotate the plot with col, main and xlab arguments, send the plot to the png device
## Close the PNG file device
## Then plot2.png will be available in the working directory

png(file = "plot2.png") 
with(hhpc2, plot(datetime, Global_active_power, xlab = "", ylab = "Glocal Active Power (kilowatts)", type = "l")) 
dev.off() 