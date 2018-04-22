plot1 <- function()
{
  ## You should install.packages("sqldf") if necessary
  library(sqldf)
  rowNames = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  electricPowerConsuption = read.csv.sql("household_power_consumption.txt", header = TRUE,
                                         row.names = rowNames,
                                         sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'",
                                         sep = ";",eol = "\n")
  png("plot1.png", width = 480, height=480)
  ## Plot 1
  par(lty=1)
  hist(electricPowerConsuption$Global_active_power,
       col = "red",
       main = "Global Active Power",
       xlab = "Global Active Power (kilowatts)")
  dev.off()
}