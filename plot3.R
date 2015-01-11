# Load data
#source('OrganizeInputData.R')
d <- readRDS("power.rds")

# Open png device
png(filename='plot3.png')

# Make plot
plot(d$date.time, d$Sub_metering_1, type='l',
     xlab='', ylab='Energy sub metering')
lines(d$date.time, d$Sub_metering_2, col='red')
lines(d$date.time, d$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid')

# Turn off device
dev.off()