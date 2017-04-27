require(dplyr)
admit_data <-read.csv("admit_data_renamed.csv", header = TRUE, stringsAsFactors = FALSE)
nrow(admit_data)
head(admit_data)
View(admit_data)
lab_data_tidy <-read.csv("lab_data_tidy.csv",header = TRUE, stringsAsFactors = FALSE)
nrow(lab_data_tidy)
colnames(lab_data_tidy)
ZSFGH <-left_join(admit_data, lab_data_tidy, by= c("MRN","PtNo"))
colnames(ZSFGH)
head(ZSFGH)
View(ZSFGH)
nrow(ZSFGH)
write.csv(ZSFGH, file = "ZSFGH.csv",row.names = FALSE)



#nrow(merge(x=admit_data,y=lab_data_tidy, by=c("PtNo","MRN"),all.x=TRUE))
