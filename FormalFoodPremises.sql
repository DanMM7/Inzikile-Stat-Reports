-- FORMAL FOOD PREMISES --
-- Formal Food Premises count --
SELECT 'Funeral Undertaker in ' AS 'header', COUNT(*) AS header
FROM HealthInspections.dbo.FORM_FormalFoods 
UNION

-- Inspections count --
SELECT '# of Inspections carried out ' AS 'header', COUNT(InspectionDate) AS header
FROM HealthInspections.dbo.FORM_FormalFoods  
UNION

-- Complying Tobacco act count --
SELECT '# of Complying Tobacco act ' AS 'header', COUNT(*) AS header
FROM HealthInspections.dbo.FORM_FormalFoods i
INNER JOIN HealthInspections.dbo.LK_CertComp r on r.PK_ID=i.TobaccoControl 
WHERE r.PK_ID = 1
GROUP BY r.PK_ID
UNION

-- Total Tobacco vending machines count --
SELECT 'Total Tobacco vending machines count ' AS 'header', COUNT(*) AS header
FROM HealthInspections.dbo.FORM_FormalFoods
WHERE TobaccoControl >= 0
UNION

-- Delivery vehicles inspected --
SELECT '# of Inspections carried out in ' + MAX(r.DESCRIPTION) AS 'header', COUNT(InspectionDate) AS header
FROM HealthInspections.dbo.FORM_FuneralUndertakerInspection i
INNER JOIN HealthInspections.dbo.LK_Regions r on r.PK_ID=i.LK_RegionID GROUP BY r.PK_ID
UNION

-- Delivery vehicles complying --
SELECT '# of Inspections carried out in ' + MAX(r.DESCRIPTION) AS 'header', COUNT(InspectionDate) AS header
FROM HealthInspections.dbo.FORM_FuneralUndertakerInspection i
INNER JOIN HealthInspections.dbo.LK_Regions r on r.PK_ID=i.LK_RegionID GROUP BY r.PK_ID
UNION

-- R962 issued --
SELECT '# of Inspections carried out in ' + MAX(r.DESCRIPTION) AS 'header', COUNT(InspectionDate) AS header
FROM HealthInspections.dbo.FORM_FuneralUndertakerInspection i
INNER JOIN HealthInspections.dbo.LK_Regions r on r.PK_ID=i.LK_RegionID GROUP BY r.PK_ID
UNION

-- total R962 count --
SELECT '# of Inspections carried out in ' + MAX(r.DESCRIPTION) AS 'header', COUNT(InspectionDate) AS header
FROM HealthInspections.dbo.FORM_FuneralUndertakerInspection i
INNER JOIN HealthInspections.dbo.LK_Regions r on r.PK_ID=i.LK_RegionID GROUP BY r.PK_ID