-- SCHOOLS --
-- Schools count --
SELECT '# Schools ' AS 'header', COUNT(*) AS header
FROM HealthInspections.dbo.FORM_SchoolInspection 
UNION

-- Inspections count --
SELECT '# of Inspected ' AS 'header', COUNT(InspectionDate) AS header
FROM HealthInspections.dbo.FORM_SchoolInspection  
UNION

-- Complying Health Standards --
SELECT '# Complying with Health standards ' AS 'header', COUNT(*) AS header
FROM HealthInspections.dbo.FORM_SchoolInspection i
INNER JOIN HealthInspections.dbo.LK_YesNo r on r.PK_ID=i.InspectionSatisfactory 
WHERE r.PK_ID = 1
GROUP BY r.PK_ID
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