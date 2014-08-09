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

png("plot2.png")
plot(hpc$Date, hpc$Global_active_power,type="l",xlab="",
     ylab="Global active power (kilowatts)")
dev.off()