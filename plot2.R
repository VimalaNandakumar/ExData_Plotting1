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
png("plot2.png", width = 480, height = 480)

#Plot the graph with Global Active Power and Date Time
plot(ucidata$Global_active_power~ucidata$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#close the file
dev.off()