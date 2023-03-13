-- NOISE COMPLAINTS --
-- Noise complaints received --
SELECT '# Noise complaints received ' AS 'header', COUNT(*) AS header 
FROM HealthInspections.dbo.FORM_Complaints i
INNER JOIN HealthInspections.dbo.LK_YesNo r on r.PK_ID=i.ComplainantNotified 
WHERE i.ComplainantNotified = 1 AND i.ComplaintCategory = 6
GROUP BY r.PK_ID
UNION

-- Noise complaints resolved --
SELECT '# Noise complaints resolve ' AS 'header', COUNT(*) AS header
FROM HealthInspections.dbo.FORM_Complaints i
INNER JOIN HealthInspections.dbo.LK_YesNo r on r.PK_ID=i.ComplaintResolved 
WHERE i.ComplaintResolved = 1 AND i.ComplaintCategory = 6
GROUP BY r.PK_ID;