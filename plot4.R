# read the dataset
# filter out all data except for data from 1/2/2007 and 2/2/2007
# change the date and time formats

all_data <- read.delim("household_power_consumption.txt", sep = ";", na.strings = "?")
feb_data <- all_data[grep("^[12]/2/2007", all_data$Date),]
rm(all_data)  # In case memory is an issue ?
#names(feb_data)[1:2] <- c("old_date", "old_time")
feb_data$date_time = strptime(paste(feb_data$Date, feb_data$Time), format="%d/%m/%Y %H:%M:%S")
#feb_data <- feb_data %>% mutate(Date = dmy(old_date), Time = hms(old_time))

# create plot
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#plot1 
plot(feb_data$date_time, feb_data$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")

#plot2
plot(feb_data$date_time, feb_data$Voltage,type="l", xlab="datetime", ylab="Voltage")

#plot3
plot(feb_data$date_time, feb_data$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
points(feb_data$date_time, feb_data$Sub_metering_2, col="red", type="l")
points(feb_data$date_time, feb_data$Sub_metering_3, col="blue", type="l")
legend("topright", lty=1, lwd=2, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot4
plot(feb_data$date_time, feb_data$Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()