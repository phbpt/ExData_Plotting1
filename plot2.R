#########################################################
##### COURSERA EXPLORATIVE DATA ANALSIS        ##########
##### WEEK 1                                   ##########
##### Peer-graded Assignment: Course Project 1 ##########
#########################################################

#########################################################
######  create plot2.R and Plot2.png               ######
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

### set working directory
setwd("C:/Users/bonat/Desktop/coursera/Exploratory data analyses/EDA data")


### read data
data_all <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataplot2 <- subset(data_all, Date %in% c("1/2/2007","2/2/2007"))

## date conversion - in data format d/m/y
dataplot2$Date <- as.Date(dataplot2$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(dataplot2$Date), dataplot2$Time)
dataplot2$Datetime <- as.POSIXct(datetime)


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


### create plot2 - lineplot type="l"
### in basic scatterplot the points are joined with straight lines.
with(dataplot2, {
    plot(Global_active_power~Datetime, type="l", xlab="",
         ylab="Global Active Power (kilowatts)")
})



### create Png file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, "plot2.png", width=480, height=480)

## close device
dev.off()


