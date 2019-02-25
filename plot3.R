setwd("C:/Users/himank/Documents/R/COURSERA DS/4.Exploratory Analysis/ExData_Plotting1")
library(data.table)

#read data into epc
epc<-fread("epc.txt",sep=";",stringsAsFactors = F,na.strings = "?")
#subset for required dates
epc<-epc[epc$Date=="1/2/2007"|epc$Date=="2/2/2007",]
#creating new column datetime for time of respective entries
epc$datetime<-as.POSIXct(paste(epc$Date,epc$Time),format= "%d/%m/%Y %H:%M:%S")
#opening png graphics device
png(filename="figure/plot3.png")

#plotting
plot(epc$datetime,epc$Sub_metering_1,type='l',col="black",xlab="",ylab="Energy sub metering")
lines(epc$datetime,epc$Sub_metering_2,col="red")
lines(epc$datetime,epc$Sub_metering_3,col="blue")
#adding legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1),lwd=c(1,1))
#closing png device
dev.off()