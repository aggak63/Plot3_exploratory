

## Plot3
## Read and subset files as in plot1 and convert dates as in plot2

x<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, quote= "", 
strip.white=TRUE, 
stringsAsFactors = F, na.strings = "?")
x<- subset(x, (x$Date == "1/2/2007" | x$Date== "2/2/2007")) 
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")
x$DateTime <- as.POSIXct(paste(x$Date, x$Time))


png("plot3.png", width = 480, height = 480)

## Make relevant plots. As we need to plot three variables in different colors and depict in line
## first create basic plot with data of one variable, then add data of others using lines function

plot(x$DateTime, x$Sub_metering_1, type="l", 
     ylab= "Energy sub metering", xlab="")

lines(x$DateTime, x$Sub_metering_2, type="l", col="red")

lines(x$DateTime, x$Sub_metering_3, type="l", col="blue")

## Add legend at the given place using given colours

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"))

## exit the png device
dev.off() 
## see the file in the finder and not in console
## see the file in the finder and not in console
