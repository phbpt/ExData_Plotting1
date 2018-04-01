#########################################################
##### COURSERA EXPLORATIVE DATA ANALSIS        ##########
##### WEEK 1                                   ##########
##### Peer-graded Assignment: Course Project 1 ##########
#########################################################

#########################################################
######  create plot3.R and Plot3.png               ######
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
dataplot3 <- subset(data_all, Date %in% c("1/2/2007","2/2/2007"))

## date conversion - in data format d/m/y
dataplot3$Date <- as.Date(dataplot3$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(dataplot3$Date), dataplot3$Time)
dataplot3$Datetime <- as.POSIXct(datetime)


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


### create plot3 - lineplot type="l"
### in basic scatterplot the points are joined with straight lines.
### add condtional plotting/ annotation


##device - dev.copy does not correct (re)size
png("plot3.png", width= 480, height= 480)


with(dataplot3, plot(Datetime, Sub_metering_1,type="n", xlab = "", ylab = "Energy Sub Metering"))
with(dataplot3, points(Datetime, Sub_metering_1, type="l", col="black"))
with(dataplot3, points(Datetime, Sub_metering_2, type="l", col="red"  ))
with(dataplot3, points(Datetime, Sub_metering_3, type="l", col="blue" ))
legend("topright", lty=1, col = c("black", "red", "blue"),
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))


## close device
dev.off()


