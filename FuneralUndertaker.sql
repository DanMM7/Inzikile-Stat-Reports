-- FUNERAL UNDERTAKER --
-- Funeral Undertaker count --
SELECT 'Funeral Undertaker in ' + MAX(r.DESCRIPTION) AS 'header', COUNT(*) AS header
FROM HealthInspections.dbo.FORM_FuneralUndertakerInspection i
INNER JOIN HealthInspections.dbo.LK_Regions r on r.PK_ID=i.LK_RegionID GROUP BY r.PK_ID
UNION

-- Inspections carried --
SELECT '# of Inspections carried out in ' + MAX(r.DESCRIPTION) AS 'header', COUNT(InspectionDate) AS header
FROM HealthInspections.dbo.FORM_FuneralUndertakerInspection i
INNER JOIN HealthInspections.dbo.LK_Regions r on r.PK_ID=i.LK_RegionID GROUP BY r.PK_ID
UNION

-- Inspections found --
SELECT '# of Inspections found to be satisfactory in ' + MAX(r.DESCRIPTION) AS 'header', COUNT(*) AS header
FROM HealthInspections.dbo.FORM_FuneralUndertakerInspection i
INNER JOIN HealthInspections.dbo.LK_YesNo r on r.PK_ID=i.Satisfactory 
WHERE r.PK_ID = 1
GROUP BY r.PK_ID

-- R237 issued --
SELECT 'Funeral Undertaker in ' + MAX(r.DESCRIPTION) AS 'header', COUNT(*) AS header
FROM HealthInspections.dbo.FORM_FuneralUndertakerInspection i
INNER JOIN HealthInspections.dbo.LK_Regions r on r.PK_ID=i.LK_RegionID GROUP BY r.PK_ID

-- total R237 certificate --
SELECT 'Funeral Undertaker in ' + MAX(r.DESCRIPTION) AS 'header', COUNT(*) AS header
FROM HealthInspections.dbo.FORM_FuneralUndertakerInspection i
INNER JOIN HealthInspections.dbo.LK_Regions r on r.PK_ID=i.LK_RegionID GROUP BY r.PK_ID