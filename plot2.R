#setting working directory
setwd("EDA/project2")

# Reading the NEI  & SCC data
NEI <- readRDS("summaryScc_PM25.rds")
SCC <- readRDS("Source_classification_Code.rds")

# Subseting  NEI data for Baltimore's fip.
baltimoreNEI <- NEI[NEI$fips=="24510", ]

#Aggregate using sum the Baltimore emissions data by year
TotalBaltimore<- aggregate(Emissions ~ year, baltimoreNEI, sum)

png("plot2.png",width=480,height=480)

barplot(
  TotalBaltimore$Emissions,
  names.arg=TotalBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From all Baltimore City Sources",
  col = "green"
)
dev.off()
