ZSFGH_f <-read.csv("ZSFGH_f.csv", header = TRUE)
head(ZSFGH_f)



ZSFGH_f <-ZSFGH_f[!duplicated(ZSFGH_f[,c("PtNo","prim_dsch_dx_cd")]),] 
nrow(ZSFGH_f)


summary(ZSFGH_f$age)
# Max age 116 is not posiible it might be data entry error so getting rid of the outlier with mean age 
ZSFGH_f$age[which(ZSFGH_f$age==116)] <-mean(ZSFGH_f$age,na.rm = TRUE)
ZSFGH_f$age[which(ZSFGH_f$age==105)] <-mean(ZSFGH_f$age,na.rm = TRUE)            
ZSFGH_f$age[which(ZSFGH_f$age==103)] <-mean(ZSFGH_f$age,na.rm = TRUE) 
ZSFGH_f$age[which(ZSFGH_f$age==102)] <-mean(ZSFGH_f$age,na.rm = TRUE) 
ZSFGH_f$age[which(ZSFGH_f$age==101)] <-mean(ZSFGH_f$age,na.rm = TRUE) 

summary(ZSFGH_f$age)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 14.00   40.00   53.00   53.32   65.00  100.00 


levels(ZSFGH_f$race_cd) <-c("White","African American","other race","Asian","American Indian","Pacific Islander","Decline to specify")
summary(ZSFGH_f$race_cd)
# White   African American         other race              Asian    American Indian   Pacific Islander Decline to specify 
# 2692               2176               2197               1475                 86                148                 12 
summary(ZSFGH_f$gender_cd)

# F    M 
# 3083 5703  


summary(ZSFGH_f$tot_len_of_stay)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 1.000   2.000   3.000   5.438   6.000 161.00


str(ZSFGH_f)
ZSFGH_f$status <-as.factor(ZSFGH_f$status)
summary(ZSFGH_f$status)
# 0    1 
# 6752 2034
# percentage of 30-day readmission 30.12441
summary(ZSFGH_f$Hb)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 5.30   10.70   12.00   11.69   12.50   19.90 

summary(ZSFGH_f$Na)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 120.0   135.0   137.0   137.5   140.0   182.0 

summary(ZSFGH_f$zip_group)
# Alameda County  Contra Costa County             Homeless         Marin County          Napa County               Others           San Benito San Francisco County 
# 135                   87                 1638                   86                    4                  205                    1                 6226 
# San Joaquin     San Mateo County   Santa Clara County    Santa Cruz County        Solana County        Sonoma County 
# 12                  321                   28                    5                   18                   20 
summary(ZSFGH_f$homelessness)
# homeless not_homeless 
# 1638         7148 

summary(ZSFGH_f$hosp_svc)
# CAR  EMR  FPR  GYN  MED  MRC  NEU  NSU  NUR  ORT  OSU  OTO  PED  PSU  SNF  TRA  URO 
# 840    1 1341   66 4028    1  195  498    1  484   36   40    5   55    2 1165   28 