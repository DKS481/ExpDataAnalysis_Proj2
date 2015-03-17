# Exploratory Data Analysis Project 2 Plot 5
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

# Create and Generate Plot to Answer Question 5
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "EDA_Proj2_plot5.png", 
    width = 480, height = 480, 
    units = "px")
motor <- grep("motor", sccData$Short.Name, ignore.case = T)
motor <- sccData[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]
motorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")

plot(motorEmissions, type = "l", xlab = "Year", 
     main = "Baltimore City Total Emissions\n From Motor Vehicle Sources, 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()

# Question
# 5. How have emissions from motor vehicle sources changed from 1999-2008 
#   in Baltimore City?