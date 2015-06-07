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

# create the plot and save it into plot4.png
png(file="plot4.png", width = 480, height = 480)
par(bg="transparent")
par(mfrow=c(2,2))

plot(elec$Date, elec$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(elec$Date, elec$Voltage, type="l", xlab="datetime", ylab="Voltage")


with(elec, {
  plot(elec$Date, elec$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
  lines(elec$Date, elec$Sub_metering_2, xlab="", col="red")
  lines(elec$Date, elec$Sub_metering_3, xlab="", , col="blue")
  legend("topright", bty="n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

plot(elec$Date, elec$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()

