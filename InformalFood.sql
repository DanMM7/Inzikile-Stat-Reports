-- INFORMAL FOOD VENDORS --
-- Informal Food Vendors --
SELECT '# Informal Food Vendors ' AS 'header', COUNT(*) AS header 
FROM HealthInspections.dbo.FORM_InformalFoodInspection 
UNION

-- Inspected count --
SELECT '# of Inspected ' AS 'header', COUNT(InspectionDate) AS header
FROM HealthInspections.dbo.FORM_InformalFoodInspection 
UNION

-- R962 issued --
SELECT '# R962 issued ' + MAX(r.DESCRIPTION) AS 'header', COUNT(InspectionDate) AS header
FROM HealthInspections.dbo.FORM_FuneralUndertakerInspection i
INNER JOIN HealthInspections.dbo.LK_Regions r on r.PK_ID=i.LK_RegionID GROUP BY r.PK_ID
UNION

-- Total R962 issued  --
SELECT 'Total R962 Certificates issued ' + MAX(r.DESCRIPTION) AS 'header', COUNT(InspectionDate) AS header
FROM HealthInspections.dbo.FORM_FuneralUndertakerInspection i
INNER JOIN HealthInspections.dbo.LK_Regions r on r.PK_ID=i.LK_RegionID GROUP BY r.PK_ID