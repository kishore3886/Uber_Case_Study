#Uber Case study starts here!!!
#installing neccessary packages to deal with date
library(lubridate)
install.packages("lubridate")
#Read data into uber data frame
uber_Data<-read.csv("Uber Request Data.csv")


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
Sys.Date()
system.time()
