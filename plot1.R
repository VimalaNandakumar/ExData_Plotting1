library(data.table)

getwd()

# Set working directory to store the output
setwd('E:\\02 Vimala\\Graphs')

# read the text file based on the delimiter ;
ucidata <- read.table("household_power_consumption.txt", sep=";", header =TRUE, na.strings = "?",colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

# set the date format
ucidata$Date <- as.Date(ucidata$Date, "%dd/%mm/%YY")

# filter the text file based on date
ucidata <- subset(ucidata,Date >= as.Date("01/02/2007") & Date <= as.Date("02/02/2007"))

# head(ucidata)

# open the png file with the given height width
png("plot1.png", width = 480, height = 480)

# plot the histogram 
hist(ucidata$Global_active_power, main = "Global Active Power",  xlab ="Global Active Power (kilowatts)", col="red")

# close the file
dev.off()
