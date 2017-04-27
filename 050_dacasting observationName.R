# reading the lab report data and getting the HB and Na in seperate column
setwd('C:/Users/Tanzir Hasan/Documents/R-project/Data')

require(reshape2)
require(plyr)
lab_data <- read.csv("lab_raw.csv", header = TRUE, stringsAsFactors = FALSE)

colnames(lab_data)
head(lab_data)
lab_data2 <- lab_data[-1] # removing the ReadDate column

head(lab_data2)
# adding a gorup variable to deal with the duplicate
lab_data3 <- ddply(lab_data2, .(PtNo,ObservationName),function(x) { x$group <- 1:nrow(x); x })
head(lab_data3)
tail(lab_data3)
View(lab_data3)
str(lab_data3)

lab_data_tidy <- dcast(lab_data3, PtNo+MRN+group ~ ObservationName, value.var = 'resultvalue')[-3] # gettng rid of the group column
head(lab_data_tidy)
View(lab_data_tidy)
str(lab_data_tidy)
colnames(lab_data_tidy)
names(lab_data_tidy) <-c("PtNo","MRN","Hb","Na") # renaming the column

colnames(lab_data_tidy)
# writing the data frame to a csv file
write.csv(lab_data_tidy, file="lab_data_tidy.csv", row.names = FALSE)





