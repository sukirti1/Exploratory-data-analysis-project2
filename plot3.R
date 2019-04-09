# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# aggregate sum for bltimore city for different years
aggregate_sum<- aggregate(Emissions ~ year, NEI[NEI$fips=="24510",], sum)

#calling png plotting system
png("plot3.png", width=480, height = 480)

#plotting the bar graph

ggplot(NEI[NEI$fips=="24510",], aes(x= factor(year),y= Emissions, fill=type))+geom_bar(stat = "identity")+facet_grid(.~type)+labs(title = "Total PM2.5 emission from different sources for Baltimore city", x="Year")+guides(fill=FALSE)

dev.off()
