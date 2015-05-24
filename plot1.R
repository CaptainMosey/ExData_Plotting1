plot1<-function(){
  #load data
  HPC<-read.delim(paste(getwd(),"/household_power_consumption.txt",sep=""),sep=";")

  #make numbers our of power factor
  HPC$num<-as.numeric(as.character(HPC$Global_active_power))

  #make histogram in png in folder
  png("plot1.PNG")
  hist(as.numeric(HPC$num[HPC$Date=="1/2/2007" | HPC$Date=="2/2/2007"]),xlab="Global active power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
  dev.off()

  
  
}