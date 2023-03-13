-- CHILD CARE FACILITIES --
-- Child Care Facilities count --
SELECT '# Homes for the the aged ' AS 'header', COUNT(*) AS header
FROM HealthInspections.dbo.FORM_ChildCareServicesInspection 
UNION

-- Inspections count --
SELECT '# of Inspected ' AS 'header', COUNT(InspectionDate) AS header
FROM HealthInspections.dbo.FORM_ChildCareServicesInspection  
UNION

-- Health Certificates issued --
SELECT '# Health Certificates issued ' AS 'header', COUNT(*) AS header
FROM HealthInspections.dbo.FORM_FormalFoods i
INNER JOIN HealthInspections.dbo.LK_CertComp r on r.PK_ID=i.TobaccoControl 
WHERE r.PK_ID = 1
GROUP BY r.PK_ID
UNION

-- Total Health Certificates issued --
SELECT 'Total Health Certificates issued count ' AS 'header', COUNT(*) AS header
FROM HealthInspections.dbo.FORM_FormalFoods
WHERE TobaccoControl >= 0
UNION


-- R962 issued --
SELECT '# R962 issued ' + MAX(r.DESCRIPTION) AS 'header', COUNT(InspectionDate) AS header
FROM HealthInspections.dbo.FORM_FuneralUndertakerInspection i
INNER JOIN HealthInspections.dbo.LK_Regions r on r.PK_ID=i.LK_RegionID GROUP BY r.PK_ID
UNION

-- Total R962 Certificates issued  --
SELECT 'Total R962 Certificates issued ' + MAX(r.DESCRIPTION) AS 'header', COUNT(InspectionDate) AS header
FROM HealthInspections.dbo.FORM_FuneralUndertakerInspection i
INNER JOIN HealthInspections.dbo.LK_Regions r on r.PK_ID=i.LK_RegionID GROUP BY r.PK_ID