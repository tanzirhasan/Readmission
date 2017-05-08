# selecting few colum for exploratory data analysis
#install.packages("readr")
require(dplyr)
#require(readr)
#ZSFGH_d <- read_csv("ZSFGH_c.CSV")
ZSFGH_d <- read.csv("ZSFGH_c.CSV",header = TRUE, stringsAsFactors = FALSE)



colnames(ZSFGH_d)
ZSFGH_d <-ZSFGH_d%>% select(1,2,4,5,6,7,10,13,14,15,21,22,23)
ZSFGH_d
colnames(ZSFGH_d)
head(ZSFGH_d)
View(ZSFGH_d)
ZSFGH_d%>% distinct(ZipCode)
ZSFGH_e <- mutate(ZSFGH_d, status=as.factor(ifelse(Interval <30 & Interval >0,1,0))) # adding a variable status as  is the response variable

str(ZSFGH_e)
