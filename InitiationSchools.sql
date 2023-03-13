-- INITIATION SCHOOLS --
-- Initiation Schools count --
SELECT '# Initiation Schools ' AS 'header', COUNT(*) AS header
FROM HealthInspections.dbo.FORM_InitiationSchool 
UNION

-- Inspections count --
SELECT '# of Inspected ' AS 'header', COUNT(Date_of_Inspection) AS header
FROM HealthInspections.dbo.FORM_InitiationSchool  
UNION

-- Certificates issued --
SELECT '# Certificates issued ' AS 'header', COUNT(*) AS header
FROM HealthInspections.dbo.FORM_InitiationSchool i
INNER JOIN HealthInspections.dbo.LK_CertComp r on r.PK_ID=i.Health_Cert_Compliant 
WHERE r.PK_ID = 1
GROUP BY r.PK_ID