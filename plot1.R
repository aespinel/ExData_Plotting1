# Load data
#source('OrganizeInputData.R')

d <- readRDS("power.rds")

# Open png device
png(filename="plot1.png", width=480, height=480)
png("plot1.png", width=480, height=480)
par(mar=c(4.7, 4.7, 0.7, 0.7))
hist(d$Global_active_power, breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()
