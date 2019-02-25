setwd("C:/Users/himank/Documents/R/COURSERA DS/4.Exploratory Analysis/ExData_Plotting1")
library(data.table)
#reading data into epc
epc<-fread("epc.txt",sep=";",stringsAsFactors = F,na.strings = "?")
#subsetting data for required dates
epc<-epc[epc$Date=="1/2/2007"|epc$Date=="2/2/2007",]
#new column datetime containing times for respective entries
epc$datetime<-as.POSIXct(paste(epc$Date,epc$Time),format= "%d/%m/%Y %H:%M:%S")
#opening png graphics device
png(filename = "figure/plot1.png")
#plotting the histogram
hist(epc$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")
#closing png device
dev.off()