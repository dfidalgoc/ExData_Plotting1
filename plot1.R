library(lubridate)

electric_data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

# convert date and time into lubridate types
electric_data$Date <- dmy(electric_data$Date)
electric_data$Time <- hms(electric_data$Time)

# only get the data between 01-02-2007 and 02-02-2007
elec <- subset(electric_data, electric_data$Date==dmy("01-02-2007") | electric_data$Date==dmy("02-02-2007"))

# convert Global_active_power to numeric values
elec$Global_active_power <- as.numeric(elec$Global_active_power)

# create the plot and save it into plot1.png
png(file="plot1.png", width = 480, height = 480)
par(bg="transparent")
hist(elec$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()

