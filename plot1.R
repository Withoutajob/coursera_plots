#########################################################################################################

## First Plot

#Don't panic if you see in the x-axis the day short name written in english, I'm italian and though the name are in italian
#this is a legend:
## "gio" stands for "gioved�" that translates as "Thursday" 
## "ven" stands for "venerd�" that translates as "Friday"
## "sab" stands for "sabato" that translates as "Saturday"



library(data.table)

file  <- fread("C://Users//ivano//Desktop//household_power_consumption.txt", skip=66636)
light<-file[1:2882]
rm(file)
names <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
"Sub_metering_1","Sub_metering_2","Sub_metering_3")
colnames(light) <- names

a <- NULL
DateTime <- NULL
for(i in  1:2882) 
{
a <- paste(light[i,1],light[i,2],sep=" ")
DateTime<- c(DateTime,a)
}


light<-cbind(DateTime,light)
light$DateTime<-as.POSIXct(DateTime,format= "%d/%m/%Y %H:%M:%S")
light$Date <- NULL
light$Time <- NULL
light$Global_active_power <- as.numeric(light$Global_active_power)


png(filename="coursera//plot1.png",width=480,height=480)

hist(light$Global_active_power, col= "red",xlab ="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
 
dev.off()



