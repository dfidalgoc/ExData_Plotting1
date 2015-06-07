library(lubridate)

electric_data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

# convert date into a lubridate type
electric_data$Date <- dmy(electric_data$Date)

# only get the data between 01-02-2007 and 02-02-2007
elec <- subset(electric_data, electric_data$Date==dmy("01-02-2007") | electric_data$Date==dmy("02-02-2007"))

# convert the date and time into one date/time object. There has to be an easier way...
elec$Date <- ymd_hms(paste(elec$Date, elec$Time, sep=" "))

# convert Global_active_power to numeric values
elec$Global_active_power <- as.numeric(elec$Global_active_power)

# create the plot and save it into plot2.png
png(file="plot2.png", width = 480, height = 480)
par(bg="transparent")
plot(elec$Date, elec$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

