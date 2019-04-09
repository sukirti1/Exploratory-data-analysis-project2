# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset motor vehicle related data
baltimore<- NEI[NEI$fips=="24510",]
california<- NEI[NEI$fips=="06037",]
condition <- grepl("vehicle", SCC[, "SCC.Level.Two"], ignore.case=TRUE)
vehiclesSCC<- SCC[condition,"SCC"]
vehiclesBaltimore <- baltimore[baltimore$SCC %in% vehiclesSCC,]
vehiclesBaltimore$city<-c("Baltimore City")
vehiclesCalifornia <- california[california$SCC %in% vehiclesSCC,]
vehiclesCalifornia$city<- c("Los Angeles")



bothNEI <- rbind(vehiclesBaltimore,vehiclesCalifornia)

#calling png plotting system
png("plot6.png", width=480, height = 480)

#plotting the bar graph
ggplot(bothNEI, aes(x= factor(year),y= Emissions, fill=type))+geom_bar(stat = "identity", fill ="#FF9999")+facet_grid(.~city)+labs(title = "Motor Vehicle Source Emissions in Baltimore & LA", x="Year")+guides(fill=FALSE)

dev.off()
