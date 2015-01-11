# Load data
#source('OrganizeInputData.R')

d <- readRDS("power.rds")

# Open png device
png(filename="plot2.png", width=480, height=480)

plot(d$date.time, d$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

#turn off device
dev.off()