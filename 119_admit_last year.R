setwd('C:/Users/Tanzir Hasan/Documents/R-project/Data')
require(dplyr)
admit_last <- read.csv("admit_lastyear.csv", header = TRUE)

nrow(admit_last)
colnames(admit_last)
names(admit_last) <- c("MRN","PtNo","AdmitCount")
semifinal <-read.csv("ZSFGH_f.csv",header=TRUE)
str(semifinal)
nrow(semifinal)
nrow(semifinal)
colnames(semifinal)
test <- left_join(semifinal,admit_last,by =c("MRN","PtNo"))
nrow(test)


ZSFGH_h <-test[!duplicated(test[,c("PtNo","prim_dsch_dx_cd")]),] 
nrow(ZSFGH_h)
View(ZSFGH_h)
summary(ZSFGH_h$AdmitCount)
write.csv(ZSFGH_h, file = "ZSFGH_h.csv",row.names = FALSE)
