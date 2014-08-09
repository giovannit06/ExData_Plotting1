#hpc <- read.table("household_power_consumption.txt", sep=";",header = TRUE,
#                  stringsAsFactors = FALSE)
#head(subset(hpc, hpc$Date == "1/2/2007"| hpc$Date =="2/2/2007"))
#tail(subset(hpc, hpc$Date == "1/2/2007"| hpc$Date =="2/2/2007"))
#66637
#69516

hpc <- read.table("household_power_consumption.txt", sep=";",
                  stringsAsFactors = FALSE, skip = 66637, nrow=2880)
hpcNames <- read.table("household_power_consumption.txt",sep=";",
                       nrow=1,header = TRUE)
names(hpc) <- names(hpcNames)

png("plot1.png")
hist(hpc$Global_active_power, col = "red",
     main = "Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()