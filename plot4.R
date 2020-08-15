library(data.table)

getwd()

# Set working directory to store the output
setwd('E:\\02 Vimala\\Graphs')

# read the text file based on the delimiter ;
ucidata <- read.table("household_power_consumption.txt", sep=";", header =TRUE, na.strings = "?",colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

# Combine Date and Time field into 1 column using column bind
DateTime <- paste(ucidata$date,ucidata$Time)

ucidata <- cbind(DateTime, ucidata)


# set the date format
ucidata$DateTime <- as.Date(ucidata$Date, "%dd/%mm/%YY")

# filter the text file based on date
ucidata <- subset(ucidata,Date >= as.Date("01/02/2007") & Date <= as.Date("02/02/2007"))

# head(ucidata)



# open the png file with the given height width
png("plot4.png", width = 480, height = 480)

# set the plot area with 2 columns and 2 rows

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))



with(ucidata, {
  plot(ucidata$Global_active_power~ucidata$DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(ucidata$Voltage~ucidata$DateTime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(ucidata$Sub_metering_1~ucidata$DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(ucidata$Sub_metering_2~ucidata$DateTime,col='Red')
  lines(ucidata$Sub_metering_3~ucidata$DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(ucidata$Global_reactive_power~ucidata$DateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

#close the file
dev.off()
 