plot2<-function(){
  #load data
  HPC<-read.delim(paste(getwd(),"/household_power_consumption.txt",sep=""),sep=";")
  #HPC<-household_power_consumption
  

  #make power a number instead of factor

  HPC$Global_active_power=as.numeric(as.character(HPC$Global_active_power))

  #find the dates we want
  rightDates<-(HPC[HPC$Date=="1/2/2007" | HPC$Date=="2/2/2007",])

  #get date time into POSIX format
  rightDates$correct<- strptime(paste(rightDates$Date,rightDates$Time,sep=" "), "%e/%m/%Y %H:%M:%S")

  #plot to match assignment
  png("plot2.PNG")
  plot(rightDates$Global_active_power,type="l",xaxt='n',xlab="",ylab="Global Active Power (kilowatts)")
  axis(side=1,labels = c("Thu","Fri","Sat"),at=c(1,1440,2881))
  dev.off()
 
  
}