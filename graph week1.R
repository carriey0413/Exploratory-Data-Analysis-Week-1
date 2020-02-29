df <- read.table("./household_power_consumption.txt",skip=1,sep=";")

names(df) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Time <- strptime(df$Time, format="%H:%M:%S")


df_subset <- subset(df,df$Date=="2007-02-01" | df$Date =="2007-02-02")

df_subset[1441:2880,"Time"] <- format(df_subset[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
df_subset[1:1440,"Time"] <- format(df_subset[1:1440,"Time"],"2007-02-01 %H:%M:%S")

#plot1
hist(as.numeric(as.character(df_subset$Global_active_power)),col="red",
     main="Global Active Power",xlab="Global Active Power(kilowatts)")


#plot2
plot(df_subset$Time,as.numeric(as.character(df_subset$Global_active_power)),type="l",
     xlab = "", ylab="Global Active Power(kilowatts)")
title(main="Global Active Power Vs Time")

#plot3
plot(df_subset$Time,df_subset$Sub_metering_1,type="n", 
     xlab = "", ylab="Energy Submerging")

lines(df_subset$Time,as.numeric(as.character(df_subset$Sub_metering_1)))

lines(df_subset$Time,as.numeric(as.character(df_subset$Sub_metering_2)),col='red')

lines(df_subset$Time,as.numeric(as.character(df_subset$Sub_metering_3)),col='blue')

title(main="Energy sub-metering")

legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#plot 4
par(mfrow=c(2,2))

plot(df_subset$Time,as.numeric(as.character(df_subset$Global_active_power)),type="l",
     xlab = "", ylab="Global Active Power(kilowatts)")

plot(df_subset$Time,as.numeric(as.character(df_subset$Voltage)),type="l",
     xlab = "datatime", ylab="Voltage")

plot(df_subset$Time,df_subset$Sub_metering_3,type="n", 
     xlab = "", ylab="Energy Submerging")
lines(df_subset$Time,as.numeric(as.character(df_subset$Sub_metering_1)),col='red')
lines(df_subset$Time,as.numeric(as.character(df_subset$Sub_metering_2)),col='black')
lines(df_subset$Time,as.numeric(as.character(df_subset$Sub_metering_3)),col='blue')
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(df_subset$Time,as.numeric(as.character(df_subset$Global_reactive_power)),type="l",
     xlab = "datatime", ylab="Global_reactive_power")