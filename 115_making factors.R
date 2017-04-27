str(ZSFGH_e)

ZSFGH_e$race_cd <-as.factor(ZSFGH_e$race_cd)
ZSFGH_e$gender_cd <-as.factor(ZSFGH_e$gender_cd)
ZSFGH_e$hosp_svc <-as.factor(ZSFGH_e$hosp_svc)
ZSFGH_e$lang <-as.factor(ZSFGH_e$lang)


View(ZSFGH_e)
write.csv(ZSFGH_e, file="ZSFGH_f.csv", row.names = FALSE)
