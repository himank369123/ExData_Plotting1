setwd("C:/Users/himank/Documents/R/COURSERA DS/4.Exploratory Analysis/ExData_Plotting1")
library(data.table)

## read data into epc
epc<-fread("epc.txt",sep=";",stringsAsFactors = F,na.strings = "?")
##subset data for 1st and 2nd feb 2007
epc<-epc[epc$Date=="1/2/2007"|epc$Date=="2/2/2007",]
##create new column datetime containing POSIXct times for respective endtries
epc$datetime<-as.POSIXct(paste(epc$Date,epc$Time),format= "%d/%m/%Y %H:%M:%S")
#opening png graphics device
png(filename="figure/plot4.png")
#setting parameter for row and columns for plots
par(mfrow=c(2,2))
#plot1
plot(epc$datetime,epc$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
#plot2
plot(epc$datetime,epc$Voltage,type="l",xlab="datetime",ylab="Voltage")
#plot3
plot(epc$datetime,epc$Sub_metering_1,type='l',col="black",xlab="",ylab="Energy sub metering")
lines(epc$datetime,epc$Sub_metering_2,col="red")
lines(epc$datetime,epc$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1),lwd=c(1,1))
#plot4
plot(epc$datetime,epc$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
#close png device
dev.off()