library(sqldf)
library(lubridate)
query_string <- "select * from file where (Date=='1/2/2007')|(Date=='2/2/2007')"
data<-read.csv.sql(file="household_power_consumption.txt",sep=";",header=T,sql=query_string)
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Wday<-wday(data$Date,label=T)
datetime<-paste(data$Date,data$Time)
strptime(datetime,format="%Y-%m-%d %H:%M:%S")

#Fig 3
dev.new(width = 480, height = 480, unit = "px")
with(data,plot(Sub_metering_1,type="l",xaxt="n",xlab="",ylab="Energy sub metering"))
with(data,lines(Sub_metering_2,col="red"))
with(data,lines(Sub_metering_3,col="blue"))
axis(1,at=c(1,1441,2881),labels=c("Thu","Fri","Sat"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.copy(png,"plot3.png")
dev.off()
