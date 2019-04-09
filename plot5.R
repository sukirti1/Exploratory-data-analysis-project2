# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset motor vehicle related data
baltimore<- NEI[NEI$fips=="24510",]
condition <- grepl("vehicle", SCC[, "SCC.Level.Two"], ignore.case=TRUE)
vehiclesSCC<- SCC[condition,"SCC"]
vehiclesNEI <- baltimore[baltimore$SCC %in% vehiclesSCC,]

#calling png plotting system
png("plot5.png", width=480, height = 480)

#plotting the bar graph
ggplot(vehiclesNEI, aes(x= factor(year),y= Emissions, fill=type))+geom_bar(stat = "identity", fill ="#FF9999")+labs(title = "Motor Vehicle Source Emissions in Baltimore from 1999-2008", x="Year")+guides(fill=FALSE)

dev.off()

