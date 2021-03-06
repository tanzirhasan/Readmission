  

SELECT	med_rec_no, count(*)
FROM  [BI].[dbo].[tblZSFG_PtFlow_Admit_ED]
GROUP BY med_rec_no
HAVING count(*) > 1
ORDER BY med_rec_no

  	  
-- Getting the data with admission interval

SELECT [med_rec_no]
      ,[pt_id]
	  ,[birth_date]
	  ,[race_cd]
      ,[gender_cd]
	  ,[tot_len_of_stay]
	  ,[admit_dtime]
      ,[dsch_dtime]
	  ,COALESCE(DATEDIFF(DAY, LEAD(dsch_dtime) OVER (PARTITION BY med_rec_no ORDER BY admit_dtime DESC), admit_dtime),0) AS Interval
	  ,[dsch_disp]
	  ,[ed_admissiontype]
	  ,[first_adm_order]
	  ,[hosp_svc]
	  ,[lang]
      ,[dsch_md]
      ,[prim_dsch_dx_cd]
      ,[fc]
      ,[fc_description]
      ,[prim_pyr_cd]
      ,[pyr_desc]
      ,[MedSurg_Accts30Days]
      ,[LastMedSurgDsch]
      ,[SNF4A_Accts30Days]
      ,[LastSNF4A]
      ,[ED_Accts30Days]
      ,[LastED]
      ,[UrgCare_Accts30Days]
      ,[LastUrgCare]
 
FROM  [BI].[dbo].[tblZSFG_PtFlow_Admit_ED]
WHERE admit_dtime BETWEEN '2016-01-01 00:00:00' AND '2016-12-31 23:59:59'
     AND dsch_dtime BETWEEN '2015-12-01 00:00:00' AND '2016-12-31 23:59:59'
      AND first_adm_order = 'ADMIT TO: INPATIENT'
      AND ed_admissiontype <> 'Labor & Delivery' 

 
SELECT t.[med_rec_no]
      ,t.[pt_id]
	  ,t.[birth_date]
	  ,t.[race_cd]
      ,t.[gender_cd]
	  ,t.[admit_dtime]
      ,t.[dsch_dtime]
	  ,t.Interval 
	  ,t.[tot_len_of_stay]
	  ,t.[dsch_disp]
	  ,t.[ed_admissiontype]
	  ,t.[first_adm_order]
	  ,t.[hosp_svc]
	  ,t.[lang]
      ,t.[dsch_md]
      ,t.[prim_dsch_dx_cd]
      ,t.[fc]
      ,t.[fc_description]
      ,t.[prim_pyr_cd]
      ,t.[pyr_desc]
      ,t.[MedSurg_Accts30Days]
      ,t.[LastMedSurgDsch]
      ,t.[SNF4A_Accts30Days]
      ,t.[LastSNF4A]
      ,t.[ED_Accts30Days]
      ,t.[LastED]
      ,t.[UrgCare_Accts30Days]
      ,t.[LastUrgCare]
	  ,d.ZipCode

FROM
(
SELECT [med_rec_no]
      ,[pt_id]
	  ,[birth_date]
	  ,[race_cd]
      ,[gender_cd]
	  ,[admit_dtime]
      ,[dsch_dtime]
	  ,[tot_len_of_stay]
	  ,[dsch_disp]
	  ,[ed_admissiontype]
	  ,[first_adm_order]
	  ,[hosp_svc]
	  ,[lang]
      ,[dsch_md]
      ,[prim_dsch_dx_cd]
      ,[fc]
      ,[fc_description]
      ,[prim_pyr_cd]
      ,[pyr_desc]
      ,[MedSurg_Accts30Days]
      ,[LastMedSurgDsch]
      ,[SNF4A_Accts30Days]
      ,[LastSNF4A]
      ,[ED_Accts30Days]
      ,[LastED]
      ,[UrgCare_Accts30Days]
      ,[LastUrgCare]
	   ,COALESCE(DATEDIFF(DAY, LEAD(dsch_dtime) OVER (PARTITION BY med_rec_no ORDER BY admit_dtime DESC), admit_dtime),0) AS Interval 
FROM  [BI].[dbo].[tblZSFG_PtFlow_Admit_ED]
WHERE admit_dtime BETWEEN '2016-01-01 00:00:00' AND '2016-12-31 23:59:59' AND first_adm_order = 'ADMIT TO: INPATIENT'
      AND dsch_dtime BETWEEN '2015-12-01 00:00:00' AND '2016-12-31 23:59:59'
      AND ed_admissiontype <> 'Labor & Delivery') t
inner join Invision.dbo.tblDemographics d --table has other factors at time of registration creation
  on t.pt_id=d.PtNo
  Where  t.Interval >= 0


--Where t.Interval<>0 AND t.Interval <=30
-- getting the lab value

IF OBJECT_ID('tempdb..#test') IS NOT NULL
DROP TABLE #test

SELECT  MAX(ObservationDatetime) MaxReadDate,MRN, PtNo, ObservationName
INTO #test
FROM [Invision].[dbo].[c_VP_Hemoglobin_Sodium_2016]
GROUP BY MRN, PtNo, ObservationName

IF OBJECT_ID('tempdb..#test1') IS NOT NULL
DROP TABLE #test1


SELECT  MAX(b.ObservationDatetime) AS ReadDate, b.MRN, b.PtNo, b.ObservationName, b.resultvalue
INTO #test1
FROM [BI].[dbo].[tblZSFG_PtFlow_Admit_ED] a
INNER JOIN [Invision].[dbo].[c_VP_Hemoglobin_Sodium_2016] b
ON a.pt_id COLLATE SQL_Latin1_General_CP1_CI_AS =b.PtNo
GROUP BY b.MRN, b.PtNo, b.ObservationName, b.resultvalue
--Having b.MRN ='05280062' AND b.PtNo='200035847454'

SELECT DISTINCT B.*
FROM #test A
INNER JOIN #test1 B
ON A.PtNo = B.PtNo
AND A.MaxReadDate = B.ReadDate