# fitting model

data_mod1 <-read.csv("data_mod.csv", header = TRUE)
data_mod1$ulti_stat <-as.factor(data_mod1$ulti_stat)
head(data_mod1)
str(data_mod1)
fit1 <-glm(ulti_stat~ race_cd+ gender_cd+ tot_len_of_stay+hosp_svc+dx_group+Hb+Na+age+ homelessness,family = binomial(),data = data_mod1)
summary(fit1)
plot(fit1)


fit2 <-glm(ulti_stat~ race_cd+ gender_cd+ tot_len_of_stay+hosp_svc+dx_group+Hb+Na+ homelessness,family = binomial(),data = data_mod1)
summary(fit2)


# Step 
fit_null <- glm(ulti_stat~ 1, family = binomial(),data = data_mod1)
summary(fit_null)

fit_main <- glm(ulti_stat~.,family = binomial(),data = data_mod1)
summary(fit_main)

fit_step1 <- step(fit_null, scope = list(lower=fit_null,upper=fit_main),direction = "both")

fit_some_inter <-glm(ulti_stat ~ AdmitCount + tot_len_of_stay + age+Hb+Na+homelessness+dx_group,family = binomial(),data = data_mod1)
summary(fit_some_inter)

fit_step2 <- step(fit_null, scope = list(lower=fit_null,upper=fit_some_inter),direction = "both")
summary(fit_step2 )



fit4 <-glm(ulti_stat ~ AdmitCount + tot_len_of_stay +Hb+Na+homelessness,family = binomial(),data = data_mod1)
summary(fit4 )


logisticPseudoR2s <- function(LogModel){
  dev <- LogModel$deviance
  nullDev <-LogModel$null.deviance 
  modelN <- length(LogModel$fitted.values)
  R.l <- 1 -dev/nullDev
  R.cs <- 1-exp(-(nullDev-dev)/modelN)
  R.n <- R.cs/(1-exp(-(nullDev/modelN)))
  cat("Pseudo R^2 for  logistic regression\n")
  cat("Hosmer and Lameshow R^2 ", round(R.l,3),"\n")
  cat("Cox and Snell R^2       ", round(R.cs, 3),"\n")
  cat("Nagelkerke R^2          ", round(R.n,3), "\n")
  
}

logisticPseudoR2s(fit_step1)
# 
# Pseudo R^2 for  logistic regression
# Hosmer and Lameshow R^2  1 
# Cox and Snell R^2        0.025 
# Nagelkerke R^2           1 
