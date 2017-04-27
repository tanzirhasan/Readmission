# taking care of ICD 9 code with replacement with ICD 10.There is 4 data row with ICD-9 code 
# that were converted to ICD 10 with help from  http://www.icd10codesearch.com/


ZSFGH_e$prim_dsch_dx_cd[ZSFGH_e$prim_dsch_dx_cd=="294.8   "] <-"F068"
ZSFGH_e$prim_dsch_dx_cd[ZSFGH_e$prim_dsch_dx_cd=="411.1   "] <-"I200"
ZSFGH_e$prim_dsch_dx_cd[ZSFGH_e$prim_dsch_dx_cd=="427.31  "] <-"I4891"

