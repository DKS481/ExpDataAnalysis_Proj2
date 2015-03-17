# Exploratory Data Analysis Project 2 Plot 4
# DKS481
# 17 March 2015

# Check and Load Data
if (!"neiData" %in% ls()) {
  neiData <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  sccData <- readRDS("./data/Source_Classification_Code.rds")
}

# Create and Generate Plot to Answer Question 4
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "EDA_Proj2_plot4.png", 
    width = 480, height = 480, 
    units = "px")
coal <- grep("coal", sccData$Short.Name, ignore.case = T)
coal <- sccData[coal, ]
coal <- neiData[neiData$SCC %in% coal$SCC, ]

coalEmissions <- aggregate(coal$Emissions, list(coal$year), FUN = "sum")

plot(coalEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Coal Combustion-related\n Sources, 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()

# Question
# 4. Across the United States, how have emissions from coal combustion-related 
#   sources changed from 1999-2008?