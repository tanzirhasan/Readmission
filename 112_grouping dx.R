# Grouping diagnosis code.


ZSFGH_e$dx_group <- factor(rep(NA,nrow(ZSFGH_e)),levels = c("infectious and parasitic diseases",
                                                            "Neoplasms",
                                                            "Diseases of the blood and blood-forming organs",
                                                            "Endocrine, nutritional and metabolic",
                                                            "Mental disorder",
                                                            "nervous system",
                                                            "eye and adnexa",
                                                            "ear and mastoid process",
                                                            "circulatory system",
                                                            "respiratory system",
                                                            "digestive system",
                                                            "skin and subcutaneous tissue",
                                                            "musculoskeletal system",
                                                            "genitourinary",
                                                            "Pregnancy, childbirth and the puerperium",
                                                            "conditions in perinatal period",
                                                            "Congenital malformations",
                                                            "Injury poisoning",
                                                            "External causes of morbidity",
                                                            "Factors influencing h status & contact hservices",
                                                            "circulatory and respiratory systems",
                                                            "nervous and musculoskeletal systems",
                                                            "speech and voice",
                                                            "General symptoms and signs",
                                                            "Abnormal findings on diagnostic imaging and in function studies",
                                                            " Ill-defined and unknown cause of mortality"))
str(ZSFGH_e)
View(ZSFGH_e)
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "A00" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="B99"]<- "infectious and parasitic diseases"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "C00" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="D49"]<-"Neoplasms"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "D50" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="D89"]<- "Diseases of the blood and blood-forming organs"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "E00" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="E89"]<-"Endocrine, nutritional and metabolic"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "F01" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="F99"]<- "Mental disorder"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "G00" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="G99"]<-"nervous system"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "H00" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="H59"]<-"eye and adnexa"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "H60" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="H95"]<- "ear and mastoid process"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "I00" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="I99"]<-"circulatory system"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "J00" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="J99"]<-"respiratory system"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "K00" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="K95"]<-"digestive system"
#ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "R00" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="R99"]<- "not elsewhere classified"

ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "L00" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="L99"]<-"skin and subcutaneous tissue"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "M00" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="M99"]<-"musculoskeletal system"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "N00" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="N99"]<-"genitourinary"

ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "O00" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="O9A"]<-"Pregnancy, childbirth and the puerperium"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "P00" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="P96"]<- "conditions in perinatal period"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "Q00" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="Q99"]<- "Congenital malformations"

ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "R00" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="R09"]<- "circulatory and respiratory systems"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "R10" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="R19"]<- "digestive system"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "R20" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="R23"]<- "skin and subcutaneous tissue"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "R25" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="R29"]<- "nervous and musculoskeletal systems"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "R30" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="R39"]<- "genitourinary"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "R40" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="R46"]<- "Mental disorder"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "R47" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="R49"]<- "speech and voice"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "R50" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="R69"]<- "General symptoms and signs"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "R70" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="R79"]<- "Diseases of the blood and blood-forming organs"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "R80" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="R82"]<- "genitourinary"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "R83" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="R89"]<- "circulatory system"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "R90" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="R94"]<- "Abnormal findings on diagnostic imaging and in function studies"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) == "R97"]<- "Neoplasms"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) == "R99"]<- " Ill-defined and unknown cause of mortality"


#############
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "S00" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="T88"]<-"Injury poisoning"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "V00" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="Y99"]<- "External causes of morbidity"
ZSFGH_e$dx_group[substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) >= "Z00" & substr(ZSFGH_e$prim_dsch_dx_cd,start = 1, stop = 3) <="Z99"]<- "Factors influencing h status & contact hservices"  
head(ZSFGH_e)  
View(ZSFGH_e)  
is.null(ZSFGH_e$dx_group)  
which(is.null(ZSFGH_e$dx_group))
