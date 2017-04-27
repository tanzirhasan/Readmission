
setwd('C:/Users/Tanzir Hasan/Documents/R-project/Data')
# define the object list of variable to be kept
ZSFGH_a <-read.csv("ZSFGH1.csv",header = TRUE ,stringsAsFactors = FALSE)

colnames(ZSFGH_a)





ZSFGHVarlist <- c("MRN",
                  "PtNo",
                  "birth_date",
                  "race_cd",
                  "gender_cd",
                  "ZipCode",
                  "tot_len_of_stay",
                  "admit_dtime",
                  "dsch_dtime",
                  "Interval",
                  "dsch_disp",
                  "ed_admissiontype",
                  "hosp_svc",
                  "lang",
                  "prim_dsch_dx_cd",
                  "fc",
                  "prim_pyr_cd",
                  "MedSurg_Accts30Days",
                  "SNF4A_Accts30Days",
                  "UrgCare_Accts30Days",
                  "Hb",
                  "Na")

# subsetting by varlist
ZSFGH_b <-ZSFGH_a[ZSFGHVarlist]

# check column
colnames(ZSFGH_b)

#check row number
nrow(ZSFGH_b)
head(ZSFGH_b)
View(ZSFGH_b)
str(ZSFGH_b)
