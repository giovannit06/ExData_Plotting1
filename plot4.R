#hpc <- read.table("household_power_consumption.txt", sep=";",header = TRUE,
#                  stringsAsFactors = FALSE)
#head(subset(hpc, hpc$Date == "1/2/2007"| hpc$Date =="2/2/2007"))
#tail(subset(hpc, hpc$Date == "1/2/2007"| hpc$Date =="2/2/2007"))
#66637
#69516

Sys.setlocale("LC_TIME", "English")

hpc <- read.table("household_power_consumption.txt", sep=";",
                  stringsAsFactors = FALSE, skip = 66637, nrow=2880)
hpcNames <- read.table("household_power_consumption.txt",sep=";",
                       nrow=1,header = TRUE)
names(hpc) <- names(hpcNames)

hpc$Date <- strptime(paste(hpc$Date,hpc$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png")
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
plot(hpc$Date, hpc$Global_active_power,type="l",xlab="",
     ylab="Global Active Power")
plot(hpc$Date, hpc$Voltage, type="l",xlab="datetime",ylab="Voltage")
plot(hpc$Date, hpc$Sub_metering_1,xlab="", type="l",ylab="Energy sub metering")
lines(hpc$Date, hpc$Sub_metering_2, col ="red")
lines(hpc$Date, hpc$Sub_metering_3, col ="blue")
legend("topright",legend = c("Sub metering 1","Sub metering 2", 
        "Sub metering 3"),  col = c("black","red","blue"), lwd=1,bty="n")
plot(hpc$Date, hpc$Global_reactive_power, type="l",
     xlab="datetime",ylab="Global_reactive_power")
dev.off()