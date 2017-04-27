# fitting model

fit1 <-glm(status~ race_cd+ gender_cd+ tot_len_of_stay+hosp_svc+dx_group+Hb+Na+age+ homelessness,family = binomial(),data = ZSFGH_f)
summary(fit1)
plot(fit1)

fit2 <-glm(status~ race_cd+ gender_cd+ tot_len_of_stay+hosp_svc+dx_group+Hb+Na+ homelessness,family = binomial(),data = ZSFGH_f)
summary(fit2)
