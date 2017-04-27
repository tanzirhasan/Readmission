admit_last <- read.csv("admit_lastyear.csv", header = TRUE,stringsAsFactors = FALSE)
nrow(admit_last)
colnames(admit_last)
names(admit_last) <- c("MRN","PtNo","AdmitCount")
semifinal <-read.csv("ZSFGH_g.csv",header=TRUE,stringsAsFactors = FALSE)
nrow(semifinal)
nrow(semifinal)
colnames(semifinal)
test <- left_join(semifinal,admit_last,by =c("MRN","PtNo"))
nrow(test)
#9068
test1 <- inner_join(semifinal,admit_last)
nrow(test1)
#9068
View(test)
ZSFGH_O <-test[!duplicated(test[,c("PtNo","prim_dsch_dx_cd")]),] 
nrow(ZSFGH_O)
View(ZSFGH_O)
