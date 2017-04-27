# making a column for homelessness

ZSFGH_e$homelessness <- factor(rep(NA,nrow(ZSFGH_e)),levels = c("homeless", "not_homeless"))
ZSFGH_e$homelessness <- ifelse(ZSFGH_e$zip_group =="Homeless","homeless","not_homeless")
head(ZSFGH_e)

write.csv(ZSFGH_e, file = "ZSFGH_f.csv",row.names = FALSE)
