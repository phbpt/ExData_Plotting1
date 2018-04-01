#########################################################
##### COURSERA EXPLORATIVE DATA ANALSIS        ##########
##### WEEK 1                                   ##########
##### Peer-graded Assignment: Course Project 1 ##########
#########################################################

#########################################################
######  create plot4.R and Plot4.png               ######
#########################################################

### read individual household electric power consumption Data Set
### use dates 2007-02-01 and 2007-02-02 only
### Date and Time variables to Date/Time classes in R using the strptime()
###       and as.Date() functions.
### Note that in this dataset missing values are coded as ?


### load lubridate package - as timezone has to be changed
library(lubridate)

# change local setting so that weekdays will be displayes in english
Sys.setlocale("LC_TIME", "English")
#[1] "English_United States.1252"'

### set working directory
setwd("C:/Users/bonat/Desktop/coursera/Exploratory data analyses/EDA data")


### read data
data_all <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataplot4 <- subset(data_all, Date %in% c("1/2/2007","2/2/2007"))

## date conversion - in data format d/m/y
dataplot4$Date <- as.Date(dataplot4$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(dataplot4$Date), dataplot4$Time)
dataplot4$Datetime <- as.POSIXct(datetime)


#### some checksstrptime("1/1/2010 10:00", format="%m/%d/%Y %H:%M", tz="Etc/GMT-7")
## tail(data_all)
## head(data_all)
## str(data_all)
## summary(data_all)
## tail(dataplot2)
## head(dataplot2)
## str(dataplot2)
## summary(dataplot2$Date)
## ?par
## ?strptime


### create plot4 
### in basic scatterplot the points are joined with straight lines.
### add condtional plotting/ annotation


##device - dev.copy does not correct (re)size
png("plot4.png", width= 480, height= 480)


par(mfrow = c(2, 2))

#1st plot
with(dataplot4, plot(Datetime, Global_active_power, type="l", xlab="", 
                     ylab="Global Active Power") )
#2nd plot
with(dataplot4, plot(Datetime, Voltage, type="l", xlab = "datetime", ylab = "Voltage"))
#3rd plot
with(dataplot4, plot(Datetime, Sub_metering_1,type="n", xlab = "", ylab = "Energy Sub Metering"))
with(dataplot4, points(Datetime, Sub_metering_1, type="l", col="black"))
with(dataplot4, points(Datetime, Sub_metering_2, type="l", col="red"  ))
with(dataplot4, points(Datetime, Sub_metering_3, type="l", col="blue" ))
legend("topright", lty=1, col = c("black", "red", "blue"), bty= "n",
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
#4th plot
with(dataplot4, plot(Datetime, Global_reactive_power, type="l", xlab = "datetime"))



## close device
dev.off()


