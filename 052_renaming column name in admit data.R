# reading the admit data

admit_data <-read.csv("admit_raw.csv", header = TRUE, stringsAsFactors = FALSE)
colnames(admit_data)
names(admit_data)[1:2] <-c("MRN","PtNo") # Renaming the first two variable to match with lab data 
colnames(admit_data)
head(admit_data)
write.csv(admit_data, file="admit_data_renamed.csv", row.names = FALSE)



admit_data$Interval
