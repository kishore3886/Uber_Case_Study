#Uber Case study starts here!!!
#installing neccessary packages to deal with date
library(lubridate)
library(xts)
library(dplyr)

install.packages("lubridate")
install.packages("xts")
#Read data into uber data frame


#here are six attributes associated with each request made by a customer:
# Request id: A unique identifier of the request
#Time of request: The date and time at which the customer made the trip request
#Drop-off time: The drop-off date and time, in case the trip was completed 
#Pick-up point: The point from which the request was made
#Driver id: The unique identification number of the driver
#Status of the request: The final status of the trip, that can be either completed, cancelled by the driver or no cars available
#Note: For this assignment, only the trips to and from the airport are being considered.
#procedure: Data Cleaning-----------------------------
#Identify the data quality issues and clean the data so that you can use it for analysis.
#Ensure that the dates and time are in the proper format. Derive new variables which will be useful for analysis.
uber_Data<-read.csv("Uber Request Data.csv")
head(uber_Data)
# COnvert the date time to proper format using parse_Date_Time function available in lubridate
#--------------------Data Cleaning and deriving new variables----------------------------------------------------------
uber_Data$Request.timestamp <- parse_date_time(x = uber_Data$Request.timestamp, orders = c("d/m/Y H:M","d-m-Y H:M:S"), locale = "eng")
uber_Data$Drop.timestamp <- parse_date_time(x= uber_Data$Drop.timestamp,orders = c("d/m/Y H:M","d-m-Y H:M:S"), locale = "eng")
# Creatin seperate columns for request time and response time
#This may be useful for analysing at what time more requests are coming
uber_Data$Request.Time<- format(as.POSIXct(uber_Data$Request.timestamp) ,format = "%H:%M:%S") 
uber_Data$Drop.Time<- format(as.POSIXct(uber_Data$Drop.timestamp),format = "%H:%M:%S")

#Finding travel time
uber_Data$Travel_Time<-  uber_Data$Drop.timestamp -uber_Data$Request.timestamp 

#Finding numbler of incomplete rides 
number_Of_Incomplete_rides<- sum(is.na(uber_Data$Travel_Time))

#Finding mean travel time. Initially filter only completed status data

completed_Rides<- filter(uber_Data, uber_Data$Status=="Trip Completed")
mean_Travel_Time<- mean(completed_Rides$Travel_Time)
#mean travel time for completed status is 52.41375 mins

plot(completed_Rides$Travel_Time)

#--------------------------------Analysis-------------------------------------------------

# write the new uber data into csv for visualizing using tableau
write.csv(uber_Data, file = "Uber_Data_AfterCleaning.csv")

#----- time slots creating is Done in Tableau---------------------------------------------
