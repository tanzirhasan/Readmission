# adding a new colum called age 
#install.packages("lubridate")

refDate<-"2016-01-01"   # Using 1st January 2016 as reference for calculating age

age_in_years<- function(birth_date, refDate){
  require(lubridate)
  period <- as.period(interval(birth_date,refDate),unit= "year")
  period$year
}
require(dplyr)
ZSFGH_c <- mutate(ZSFGH_b,age= age_in_years(birth_date,refDate)) # adding new column age to data farme
head(ZSFGH_c)
View(ZSFGH_c)
write.csv(ZSFGH_c, file="ZSFGH_c.csv", row.names = FALSE)

