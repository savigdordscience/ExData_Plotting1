plot4 <- function()
{
  ## You should install.packages("sqldf") if necessary
  library(sqldf)
  rowNames = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  electricPowerConsuption = read.csv.sql("household_power_consumption.txt", header = TRUE,
                                         row.names = rowNames,
                                         sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'",
                                         sep = ";",eol = "\n")
  electricPowerConsuption$fullDateTime <- strptime(paste(electricPowerConsuption$Date, electricPowerConsuption$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  png("plot4.png", width = 480, height=480)  
  par(mfrow=c(2,2))
  
  plot(electricPowerConsuption$fullDateTime,
       electricPowerConsuption$Global_active_power,type="l",
       xlab = "",
       ylab = "Global Active Power (kilowatts)")
  
  plot(electricPowerConsuption$fullDateTime,
       electricPowerConsuption$Voltage,
       type="l",
       xlab = "datetime",
       ylab = "voltage")
  
  plot(electricPowerConsuption$fullDateTime,
       electricPowerConsuption$Sub_metering_1,type="l",
       xlab = "",
       ylab = "Energy sub metering",col="black")
  lines(electricPowerConsuption$fullDateTime,
        electricPowerConsuption$Sub_metering_2,
        col="red")
  lines(electricPowerConsuption$fullDateTime,
        electricPowerConsuption$Sub_metering_3,
        col="blue")
  legend("topright", 
         pch = 95, 
         col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
         cex=0.6,
         bty = "n")
  
  plot(electricPowerConsuption$fullDateTime,
       electricPowerConsuption$Global_reactive_power,
       type="l",
       xlab = "datetime",
       ylab = "voltage")
 
  dev.off() 
}