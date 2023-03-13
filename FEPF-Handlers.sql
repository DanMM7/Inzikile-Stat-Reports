-- FORMAL EDUCATION PROGRAM FOR FOOD HANDLERS --
-- Food handlers formally educated from the target group --
SELECT '# Food handlers formally educated from the target group ' + MAX(r.DESCRIPTION) AS 'header', COUNT(*) AS header 
FROM HealthInspections.dbo.FORM_AddBuildingPlan i
INNER JOIN HealthInspections.dbo.LK_Approval r on r.PK_ID=i.Approved GROUP BY r.PK_ID
UNION
-- Targert Group Count --
SELECT '# Targert Group ' + MAX(r.EHPName)  AS 'header', COUNT(*) AS header
FROM HealthInspections.dbo.FORM_AddBuildingPlan i
INNER JOIN HealthInspections.dbo.FORM_EHP r on r.PK_ID=i.EHP GROUP BY r.PK_ID;