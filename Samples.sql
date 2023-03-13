-- SAMPLES --
-- Approved Building Plans --
SELECT 'Inspection in ' + MAX(r.PremiseType)  AS 'header', COUNT(*) AS header 
FROM HealthInspections.dbo.FORM_Premises i 
INNER JOIN HealthInspections.dbo.FORM_PremisesTypes_LK r on r.PK_ID=i.LK_PremisesTypeID 
GROUP BY r.PK_ID;