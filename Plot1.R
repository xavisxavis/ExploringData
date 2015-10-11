
#Replace the filepath below with filepath of household_power_consumption.txt file
setwd("C:/")
table<- read.table("household_power_consumption.txt", header=FALSE, sep=";", skip=66637, nrows=2880, strip.white=TRUE)
table$V1<-as.Date(table$V1, "%d/%m/%Y")
y <- strptime(table$V2, format='%H:%M:%S')
table$V2<-strftime(y, '%H:%M:%S')
names(table)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
par(mar=c(4,4,4,4))
png("plot1.png", width = 480, height = 480)
hist(table$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", col= "red")
dev.off()