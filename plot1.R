#########################################################
##### COURSERA EXPLORATIVE DATA ANALSIS        ##########
##### WEEK 1                                   ##########
##### Peer-graded Assignment: Course Project 1 ##########
#########################################################

#########################################################
######  create plot1.R and Plot1.png               ######
#########################################################

### read individual household electric power consumption Data Set
### use dates 2007-02-01 and 2007-02-02 only
### Date and Time variables to Date/Time classes in R using the strptime()
###       and as.Date() functions.
### Note that in this dataset missing values are coded as ?
   

### set working directory
setwd("C:/Users/bonat/Desktop/coursera/Exploratory data analyses/EDA data")


### read data
data_all <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
dataplot1 <- subset(data_all, Date %in% c("1/2/2007","2/2/2007"))


#### some checks
## tail(data_all)
## head(data_all)
## str(data_all)
## summary(data_all)
## tail(dataplot1)
## head(dataplot1)
## str(dataplot1)
## summary(dataplot1$Date)
## ?par


### create plot1 - Histogram as png
### variable(s) needed - Global_active_power
hist(dataplot1$Global_active_power, col= "red", main= "Global Active Power",
     xlab= "Global Active Power (kilowatts)")

### create Png file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, "plot1.png", width=480, height=480)

## close device
dev.off()


