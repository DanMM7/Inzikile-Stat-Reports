-- COMPLIANCE TO TAT --
-- Approved Building Plans --
SELECT 'Building plans ' + MAX(r.DESCRIPTION) AS 'header', COUNT(*) AS header 
FROM HealthInspections.dbo.FORM_AddBuildingPlan i
INNER JOIN HealthInspections.dbo.LK_Approval r on r.PK_ID=i.Approved GROUP BY r.PK_ID
UNION
-- Received Building Plans --
SELECT 'Building plans Received by ' + MAX(r.EHPName)  AS 'header', COUNT(*) AS header
FROM HealthInspections.dbo.FORM_AddBuildingPlan i
INNER JOIN HealthInspections.dbo.FORM_EHP r on r.PK_ID=i.EHP GROUP BY r.PK_ID;