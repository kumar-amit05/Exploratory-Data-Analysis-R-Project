#setting working directory
setwd("EDA/project2")

# loading ggplot2 package
library(ggplot2)

# Reading the NEI  & SCC data
NEI <- readRDS("summaryScc_PM25.rds")
SCC <- readRDS("Source_classification_Code.rds")

# Subset coal combustion related NEI data
combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]

png("plot4.png",width=480,height=480)

g <- ggplot(combustionNEI,aes(factor(year),Emissions/10^5))

g+geom_bar(stat="identity",fill="green",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)"))+
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

dev.off()
