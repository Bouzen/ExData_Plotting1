filelocation<-'C:/Users/Nate/Documents/Data Science Course/Exploratory Data/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt'
x <- read.table(filelocation,skip=1,sep=";")

x<-read.delim(filelocation, header = TRUE,sep =";")
x$DateParsed<- as.Date(Date,"%d/%m/%Y")
y<-x[x$DateParsed == '2007-02-01' | x$DateParsed == '2007-02-02',] 
y$Global_active_powernum <-as.numeric(as.character(y$Global_active_power))
y$Sub_metering_1num <-as.numeric(as.character(y$Sub_metering_1))
y$Sub_metering_2num <-as.numeric(as.character(y$Sub_metering_2))
y$Voltagenum<-as.numeric(as.character(y$Voltage))
y$Global_reactive_powernum<-as.numeric(as.character(y$Global_reactive_power))
y$DateTime <- {timestamp = 
    strptime(paste(y$Date,y$Time), '%d/%m/%Y %H:%M:%S')}


png('plot4.png', width =480,height=480)
par(mfrow=c(2,2))
##graph 1
plot(y$DateTime,y$Global_active_powernum
     ,type = 'l', ylab ='Global Active Power'
     ,xlab = '')

##graph 2
plot(y$DateTime
     ,y$Voltagenum 
     , type = 'l'
     ,ylab = 'Volatage'
     ,xlab = 'datetime'
)


##graph 3

plot(y$DateTime,y$Sub_metering_1num
     ,type = 'l', ylab ='Energy sub metering'
     ,xlab = ''
     ,ylim = c(0,max(y$Sub_metering_1num))
     ,yaxt ='n'
)
axis(side = 2, at = c(0,10,20,30))
lines(y$DateTime,y$Sub_metering_2num, type = 'l', col = 'red')
lines (y$DateTime,y$Sub_metering_3, type = 'l', col = 'blue')
legend('topright'
       ,legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
       ,col = c('black','red','blue')
       ,lty=1
       ,cex=0.8
)
##graph 4
plot(y$DateTime, y$Global_reactive_powernum
     ,type = 'l'
     ,xlab = 'datetime'
     ,ylab = 'Global_reactive_power'
     )

dev.off()

