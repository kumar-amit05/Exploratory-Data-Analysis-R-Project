#setting working directory
setwd("EDA/project2")

# loading ggplot2 package
library(ggplot2)

# Reading the NEI  & SCC data
NEI <- readRDS("summaryScc_PM25.rds")
SCC <- readRDS("Source_classification_Code.rds")

# Subseting  NEI data for Baltimore's fip.
baltimoreNEI <- NEI[NEI$fips=="24510", ]

# Aggregate using sum the Baltimore emissions data by year
TotalBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

png("plot3.png",width=480,height=480)

g<- ggplot(baltimoreNEI, aes(factor(year), Emissions, fill = type))

g+ geom_bar(stat = "identity")+
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008"))

dev.off()