# fitting model

data_mod1 <-read.csv("data_mod.csv", header = TRUE)

head(data_mod1)
str(data_mod1)
fit1 <-glm(status~ race_cd+ gender_cd+ tot_len_of_stay+hosp_svc+dx_group+Hb+Na+age+ homelessness,family = binomial(),data = data_mod1)
summary(fit1)
plot(fit1)


fit2 <-glm(status~ race_cd+ gender_cd+ tot_len_of_stay+hosp_svc+dx_group+Hb+Na+ homelessness,family = binomial(),data = data_mod1)
summary(fit2)


# Step 
fit_null <- glm(status~ 1, family = binomial(),data = data_mod1)
summary(fit_null)

fit_main <- glm(status~.,family = binomial(),data = data_mod1)
summary(fit_main)

fit_step1 <- step(fit_null, scope = list(lower=fit_null,upper=fit_main),direction = "both")
###
# > fit_step1 <- step(fit_null, scope = list(lower=fit_null,upper=fit_main),direction = "both")
# Start:  AIC=16.77
# status ~ 1
# 
# Df Deviance    AIC
# + AdmitCount        1   10.735  14.74
# + tot_len_of_stay   1   10.873  14.87
# + age               1   12.493  16.49
# + gender_cd         1   12.602  16.60
# <none>                  14.769  16.77
# + Na                1   13.822  17.82
# + homelessness      1   14.225  18.23
# + ZipCode           1   14.701  18.70
# + Hb                1   14.756  18.76
# + race_cd           6   11.833  25.83
# + lang             10   10.454  32.45
# + zip_group         9   14.097  34.10
# + hosp_svc         11   13.595  37.60
# + dx_group         19   11.260  51.26
# + prim_dsch_dx_cd 269    0.000 540.00
# 
# Step:  AIC=14.74
# status ~ AdmitCount
# 
# Df Deviance    AIC
# + tot_len_of_stay   1   6.3297  12.33
# + age               1   6.6310  12.63
# + gender_cd         1   7.5794  13.58
# + homelessness      1   8.2015  14.20
# <none>                 10.7354  14.74
# + Hb                1   9.7276  15.73
# + Na                1  10.2227  16.22
# + ZipCode           1  10.3784  16.38
# - AdmitCount        1  14.7687  16.77
# + race_cd           6   7.0594  23.06
# + zip_group         9   8.1496  30.15
# + lang             10   6.6263  30.63
# + hosp_svc         11   8.3237  34.32
# + dx_group         19   8.5413  50.54
# + prim_dsch_dx_cd 269   0.0000 542.00
# 
# Step:  AIC=12.33
# status ~ AdmitCount + tot_len_of_stay
# 
# Df Deviance    AIC
# + age               1   0.0000   8.00
# + Hb                1   0.0000   8.00
# + Na                1   0.0000   8.00
# <none>                  6.3297  12.33
# + gender_cd         1   5.4114  13.41
# + homelessness      1   6.2088  14.21
# + ZipCode           1   6.3274  14.33
# - tot_len_of_stay   1  10.7354  14.74
# - AdmitCount        1  10.8735  14.87
# + race_cd           6   5.5525  23.55
# + hosp_svc         11   0.0000  28.00
# + zip_group         9   6.0833  30.08
# + lang             10   5.2196  31.22
# + dx_group         19   0.0000  44.00
# + prim_dsch_dx_cd 269   0.0000 544.00
# 
# Step:  AIC=8
# status ~ AdmitCount + tot_len_of_stay + age
# 
# Df Deviance    AIC
# <none>                  0.0000   8.00
# + Hb                1   0.0000  10.00
# + Na                1   0.0000  10.00
# + gender_cd         1   0.0000  10.00
# + ZipCode           1   0.0000  10.00
# + homelessness      1   0.0000  10.00
# - age               1   6.3297  12.33
# - tot_len_of_stay   1   6.6310  12.63
# - AdmitCount        1   8.4042  14.40
# + race_cd           6   0.0000  20.00
# + zip_group         9   0.0000  26.00
# + lang             10   0.0000  28.00
# + hosp_svc         11   0.0000  30.00
# + dx_group         19   0.0000  46.00
# + prim_dsch_dx_cd 269   0.0000 546.0


##############
fit_some_inter <-glm(status ~ AdmitCount + tot_len_of_stay + age+Hb+Na+homelessness+dx_group,family = binomial(),data = data_mod1)
summary(fit_some_inter)

fit_step2 <- step(fit_null, scope = list(lower=fit_null,upper=fit_some_inter),direction = "both")
summary(fit_step2 )

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
