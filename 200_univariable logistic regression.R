# this code will repeate univariate logistic regression with the outcome variable status and different predictor variable

lapply(c("age","gender_cd","race_cd", "zip_group","tot_len_of_stay","hosp_svc","lang","Hb","Na"),
       
       function(var) {
         
         formula    <- as.formula(paste("status ~", var))
         res.logist <- glm(formula, data = ZSFGH_e, family = binomial)
         
         summary(res.logist)
       })



