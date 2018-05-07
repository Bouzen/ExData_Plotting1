filelocation<-'C:/Users/Nate/Documents/Data Science Course/Exploratory Data/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt'

x<-read.delim(filelocation, header = TRUE,sep =";")
x$DateParsed<- as.Date(Date,"%d/%m/%Y")
y<-x[!x$Global_active_power =="?" & x$DateParsed >= '2007-02-01' & x$DateParsed <= '2007-02-02',] 
y$Global_active_powernum <-as.numeric(as.character(y$Global_active_power))
y$DateTime <- {timestamp = 
    strptime(paste(y$Date,y$Time), '%d/%m/%Y %H:%M:%S')
}

png('plot2.png', width =480,height=480)
plot(y$DateTime,y$Global_active_powernum
     , type = 'l'
     , ylab ='Global Active Power (kilowatts)'
     ,xlab = '')
dev.off()



