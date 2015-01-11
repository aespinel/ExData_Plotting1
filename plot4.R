# Load data
#source('OrganizeInputData.R')
d <- readRDS("power.rds")

# Open device
png(filename='plot4.png')

## Make plots
par(mfrow=c(2,2))

# Top left
plot(d$date.time, d$Global_active_power,
     ylab='Global Active Power', xlab='', type='l')

# Top right
plot(d$date.time, d$Voltage,
     xlab='datetime', ylab='Voltage', type='l')

# Bottom left
plot(d$date.time, d$Sub_metering_1, type='l',
     xlab='', ylab='Energy sub metering')
lines(d$date.time, d$Sub_metering_2, col='red')
lines(d$date.time, d$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid', bty='n')

# Bottom right
plot(d$date.time, d$Global_reactive_power,
     xlab='datetime', ylab='Global_reactive_power', type='l')

# Turn off device
dev.off()