# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCCd <- readRDS("Source_Classification_Code.rds")

# Subset coal-combustion related data
combustion_true<- grepl("comb", SCCd$SCC.Level.One, ignore.case = TRUE)
coal_true<- grepl("coal", SCCd$SCC.Level.Four, ignore.case = TRUE)
coal.combustion.SCC<- SCCd[combustion_true & coal_true, "SCC"]
coal.combustion.NEI<- NEI[NEI$SCC %in% coal.combustion.SCC,]

#calling png plotting system
png("plot4.png", width=480, height = 480)

#plotting the bar graph
ggplot(coal.combustion.NEI, aes(x= factor(year),y= Emissions, fill=type))+geom_bar(stat = "identity")+labs(title = "Coal Combustion Source Emissions Across US from 1999-2008", x="Year")+guides(fill=FALSE)

dev.off()

        
        
        
