library(lubridate)

#Verify if data exists, otherwise download, unzip and load the file
#Use .rds to save selected data 
if (!file.exists('electric-power-data.rds')) {
  download.file(paste0('https://d396qusza40orc.cloudfront.net/',
                'exdata%2Fdata%2Fhousehold_power_consumption.zip'),
                destfile='power-data.zip')
  unzip('power-data.zip')

# Creates a table (data frame) with appropriate classes
  power.df <- read.table('household_power_consumption.txt', header=TRUE,
                         sep=';', na.strings='?',
                         colClasses=c(rep('character', 2), 
                                      rep('numeric', 7)))
  
  # Convert dates and times
  power.df$Date <- dmy(power.df$Date)
  power.df$Time <- hms(power.df$Time)
  
  # Select cases requiered 
  start <- ymd('2007-02-01')
  end <- ymd('2007-02-02')
  power.df <- subset(power.df, year(Date) == 2007 & 
                       month(Date) == 2 &
                       (day(Date) == 1 | day(Date) == 2))
  
  # Combine date and time into date.time
  power.df$date.time <- power.df$Date + power.df$Time
  
  # Save file RDS
  saveRDS(power.df, file='power.rds')
} else {
  power.df <- readRDS('power.rds')
}
