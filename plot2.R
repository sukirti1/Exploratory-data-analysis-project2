# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# aggregate sum for bltimore city for different years
aggregate_sum<- aggregate(Emissions ~ year, NEI[NEI$fips=="24510",], sum)

#calling png plotting system
png("plot2.png", width=480, height = 480)

#plotting the bar graph

barplot(aggregate_sum$Emissions, aggregate_sum$year, xlab="Year", 
        ylab = "Emissions", main = "Total PM2.5 emission from all sources for Baltimore", 
        names.arg = aggregate_sum$year)

dev.off()
