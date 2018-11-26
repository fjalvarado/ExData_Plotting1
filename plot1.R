library(sqldf)
library(lubridate)
query_string <- "select * from file where (Date=='1/2/2007')|(Date=='2/2/2007')"
data<-read.csv.sql(file="household_power_consumption.txt",sep=";",header=T,sql=query_string)
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Wday<-wday(data$Date,label=T)
datetime<-paste(data$Date,data$Time)
strptime(datetime,format="%Y-%m-%d %H:%M:%S")

#Fig 1
dev.new(width = 480, height = 480, unit = "px")
hist(data$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.copy(png,"plot1.png")
dev.off()