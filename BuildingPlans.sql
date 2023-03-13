-- BUILDING PLANS --
--CREATE TABLE BuildingPlans AS 
-- Received Building Plans --
SELECT 'Building plans Received '  AS 'header', COUNT(*) AS header
FROM HealthInspections.dbo.FORM_AddBuildingPlan
UNION

-- Approved Building Plans --
SELECT 'Building plans ' + MAX(r.DESCRIPTION) AS 'header', COUNT(*) AS header 
FROM HealthInspections.dbo.FORM_AddBuildingPlan i
INNER JOIN HealthInspections.dbo.LK_Approval r on r.PK_ID=i.Approved GROUP BY r.PK_ID