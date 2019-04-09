# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# sum according to year for NEI data frame
aggregate_sum<- aggregate(Emissions ~ year, NEI, sum)

## another method instead of aggregate        
## a<- lapply(split(NEI, NEI$year), function(chunk){
        
       ## return(sum(chunk$Emissions))
        
## })

## cbind(a)

# call the png plotting system
png("plot5.png", width = 480, height = 480)

# create a barplot
barplot(aggregate_sum$Emissions, aggregate_sum$year, xlab="Year", ylab = "Emissions", names.arg = aggregate_sum$year, main= "Total PM2.5 emission from all sources")


dev.off()

