# Developing Data Products
# Final Project 
# This script shows the steps to dowload and compact the data I wil use in the final product

# Create a folder to save plot files
if (!file.exists("./finalproject")) {
  dir.create("finalproject")
}
setwd("./finalproject")


## NEI - Data for Peer Assessment
nei.url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
nei.zip <- "exdata-data-NEI_data.zip"
if (!file.exists(nei.zip))
  download.file(nei.url, destfile = nei.zip, method = "auto")

#Extract data
unzip(nei.zip)
dir()

nei <- readRDS("summarySCC_PM25.rds")

# Aggregate
emission <- aggregate(nei[,"Emissions"], by=list(nei$year, nei$type), FUN=sum)
colnames(emission) <- c("year", "type", "pm25")
library(Hmisc)
emission$logpm25 <- log(emission$pm25 )
emission$type <- capitalize(tolower(emission$type))
emission$year <- as.factor(emission$year)
emission$type <- as.factor(emission$type)
save(emission, file="emission.rda")


