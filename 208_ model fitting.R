# fitting model

data_mod1 <-read.csv("data_mod.csv", header = TRUE)
data_mod1$ulti_stat <-as.factor(data_mod1$ulti_stat)
colnames(data_mod1)
head(data_mod1)
str(data_mod1)


ggplot(filter(data_mod1,ulti_stat==1),aes(dx_group, fill= dx_group))+ geom_bar(aes(y = (..count..)/sum(..count..)))+
  #geom_text(aes(y = ((..count..)/sum(..count..)), label = scales::percent((..count..)/sum(..count..))), stat = "count", vjust = -0.25)+
  scale_y_continuous(labels = percent)+ theme(axis.title.y=element_blank(),axis.text.x = element_text(angle = 90, hjust = 1),legend.position="none")+
  ggtitle("Distribution of dx group by readmission status")
require(GGally)
ggpairs(data_mod1[sapply(data_mod1,function(x)!is.factor(x))])
data_remod <- data_mod1
data_remod$cancer <- factor(rep("yes",nrow(data_remod)),levels = c("yes", "no")) 
data_remod$cancer <- ifelse(data_remod$dx_group=="Neoplasms","yes","no")
data_remod$digesdis <- factor(rep("yes",nrow(data_remod)),levels = c("yes", "no")) 
data_remod$digesdis <- ifelse(data_remod$dx_group=="digestive system","yes","no")
head(data_remod)
data_remod$higlander <- factor(rep("yes",nrow(data_remod)),levels = c("yes", "no")) 
data_remod$higlander <- ifelse(data_remod$race_cd=="Pacific Islander","yes","no")
data_remod$homelessness1 <- factor(rep("yes",nrow(data_remod)),levels = c("yes", "no"))
data_remod$homelessness1 <-  ifelse(data_remod$homelessness=="homeless","yes","no")
data_remod$asian <- factor(rep("yes",nrow(data_remod)),levels = c("yes", "no")) 
data_remod$asian <- ifelse(data_remod$race_cd=="Asian","yes","no")
fit1 <-glm(ulti_stat~   tot_len_of_stay+Hb+Na+age+ homelessness1+higlander ,family = binomial(),data = data_remod)
summary(fit1)
plot(fit1)

#
fit1 <-glm(ulti_stat~ race_cd+ gender_cd+ tot_len_of_stay+hosp_svc+dx_group+Hb+Na+age+ homelessness,family = binomial(),data = data_mod1)
summary(fit1)


fit2 <-glm(ulti_stat~ race_cd+ gender_cd+ tot_len_of_stay+hosp_svc+dx_group+Hb+Na+ homelessness,family = binomial(),data = data_mod1)
summary(fit2)



##
fit_null <- glm(ulti_stat~ 1, family = binomial(),data = data_mod1)
summary(fit_null)

fit_main <- glm(ulti_stat~.,family = binomial(),data = data_mod1)
summary(fit_main)

fit_step1 <- step(fit_null, scope = list(lower=fit_null,upper=fit_main),direction = "both")

fit_mod <- glm(ulti_stat~race_cd + Hb,family = binomial(),data = data_mod1)
summary(fit_mod)


# Step 
fit_null1 <- glm(ulti_stat~ 1, family = binomial(),data = data_remod)
summary(fit_null1)

fit_main1 <- glm(ulti_stat~.,family = binomial(),data = data_remod)
summary(fit_main1)

fit_step11 <- step(fit_null, scope = list(lower=fit_null,upper=fit_main),direction = "both")

fit_some_inter <-glm(ulti_stat ~ AdmitCount + tot_len_of_stay + age+Hb+Na+homelessness+dx_group,family = binomial(),data = data_mod1)
summary(fit_some_inter)

fit_step21 <- step(fit_null, scope = list(lower=fit_null,upper=fit_some_inter),direction = "both")
summary(fit_step21 )



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
logisticPseudoR2s(fit_mod)
# 
# Pseudo R^2 for  logistic regression
# Hosmer and Lameshow R^2  1 
# Cox and Snell R^2        0.025 
# Nagelkerke R^2           1 
