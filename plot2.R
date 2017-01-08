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
png(filename = "plot2.png", width = 480, height = 480)
plot(feb_data$date_time, feb_data$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowatts)")


dev.off()