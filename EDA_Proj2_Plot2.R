# Exploratory Data Analysis Project 2 Plot 2
# DKS481
# 17 March 2015

# Check and Load Data
if (!"neiData" %in% ls()) {
  neiData <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  sccData <- readRDS("./data/Source_Classification_Code.rds")
}
#Subset
subset <- neiData[neiData$fips == "24510", ] 

# Create and Generate Plot to Answer Question 2
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "EDA_Proj2_plot2.png", 
    width = 480, height = 480, 
    units = "px")
totalEmissions <- aggregate(subset$Emissions, list(subset$year), FUN = "sum")

plot(totalEmissions, type = "l", xlab = "Year", 
     main = "Baltimore City Total Emissions, 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()

# Question
# 2.Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
#   (fips == "24510") from 1999 to 2008? Use the base plotting system to make 
#   a plot answering this question.