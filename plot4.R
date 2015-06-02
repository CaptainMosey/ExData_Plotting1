plot4<-function(){
  #load data
  HPC<-read.delim(paste(getwd(),"/household_power_consumption.txt",sep=""),sep=";")
  #HPC<-household_power_consumption
  
  
  
  #find the dates we want
  rightDates<-(HPC[HPC$Date=="1/2/2007" | HPC$Date=="2/2/2007",])
  
  #get date time into POSIX format
  rightDates$correct<- strptime(paste(rightDates$Date,rightDates$Time,sep=" "), "%e/%m/%Y %H:%M:%S")
  
  #make power, metering,etc a number instead of factor
  rightDates$Global_active_power=as.numeric(as.character(rightDates$Global_active_power))
  rightDates$Sub_metering_1=as.numeric(as.character(rightDates$Sub_metering_1))
  rightDates$Sub_metering_2=as.numeric(as.character(rightDates$Sub_metering_2))
  rightDates$Sub_metering_3=as.numeric(as.character(rightDates$Sub_metering_3))
  rightDates$Voltage=as.numeric(as.character(rightDates$Voltage))
  rightDates$Global_reactive_power=as.numeric(as.character(rightDates$Global_reactive_power))
  
  
  
  
  
  #plot to match assignment
  png("plot4.PNG")
  par(mfcol=c(2,2))
  #upper left plot
  plot(rightDates$Global_active_power,type="l",xaxt='n',xlab="",ylab="Global Active Power (kilowatts)")
  axis(side=1,labels = c("Thu","Fri","Sat"),at=c(1,1440,2881))

  
  
  
  
  #lower left plot
  plot(rightDates$Sub_metering_1,type="l",xaxt='n',xlab="",ylab="Energy sub metering")
  lines(rightDates$Sub_metering_2,col="red")
  lines(rightDates$Sub_metering_3,col="blue")
  legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5),col=c("black","red","blue"),bty="n")
  axis(side=1,labels = c("Thu","Fri","Sat"),at=c(1,1440,2881))
  
  #upper right plot
  plot(rightDates$Voltage,type="l",xaxt='n',xlab="datetime",ylab="Voltage")
  axis(side=1,labels = c("Thu","Fri","Sat"),at=c(1,1440,2881))
 
  #lower right plot
  plot(rightDates$Global_reactive_power,type="l",xaxt='n',xlab="datetime",ylab="Global_reactive_power")
  axis(side=1,labels = c("Thu","Fri","Sat"),at=c(1,1440,2881))
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  dev.off()
  
}