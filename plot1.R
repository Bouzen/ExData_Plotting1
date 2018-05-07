filelocation<-'C:/Users/Nate/Documents/Data Science Course/Exploratory Data/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt'

x<-read.delim(filelocation, header = TRUE,sep =";")
x$DateParsed<- as.Date(Date,"%d/%m/%Y")
y<-x[!x$Global_active_power =="?" & x$DateParsed >= '2007-02-01' & x$DateParsed <= '2007-02-02',] 
y$Global_active_powernum <-as.numeric(as.character(y$Global_active_power))

png('plot1.png', width =480,height=480)
hist(y$Global_active_powernum,col ='red'
     ,xlab = 'Global Active Power (kilowatts)'
     ,main = 'Global Active Power')
dev.off()


