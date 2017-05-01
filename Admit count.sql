SELECT  med_rec_no, pt_id,admit_dtime,dsch_dtime, ROW_NUMBER () over(partition by [med_rec_no] order by (admit_dtime)ASC) AS 'AdmitCount'
FROM [BI].[dbo].[tblZSFG_PtFlow_Admit_ED]
WHERE [dsch_dtime] BETWEEN '2015-12-01 00:00:00' AND '2016-12-31 23:59:59'
AND admit_dtime BETWEEN DATEADD(month, -12, admit_dtime)  AND admit_dtime
AND first_adm_order = 'ADMIT TO: INPATIENT'



SELECT  med_rec_no, pt_id,admit_dtime,dsch_dtime, ROW_NUMBER () over(partition by [med_rec_no] order by (admit_dtime) ASC)-1 AS 'AdmitCount'
FROM [BI].[dbo].[tblZSFG_PtFlow_Admit_ED]
WHERE [dsch_dtime] BETWEEN '2015-12-01 00:00:00' AND '2016-12-31 23:59:59'
AND admit_dtime BETWEEN DATEADD(month, -12, admit_dtime)  AND admit_dtime
AND first_adm_order = 'ADMIT TO: INPATIENT'

SELECT DATEADD(day,-1,'2016-12-31 23:59:59')