DECLARE @sql nvarchar(max)

DECLARE rep_cursor CURSOR FOR
SELECT ReportQuery 
FROM [dbo].[FORM_CS_StaticticalReport]

OPEN rep_cursor
FETCH NEXT FROM rep_cursor INTO @sql

WHILE @@FETCH_STATUS = 0
BEGIN
	FETCH NEXT FROM rep_cursor INTO @sql
	
END

CLOSE rep_cursor
DEALLOCATE rep_cursor

EXEC sp_executesql @sql


/**********************************************************************************/

-- Declare variables
DECLARE @counter INT;
DECLARE @ri INT;
DECLARE @limit INT;

-- Initialize variables
SET @counter = 0;
SET @limit = 1;
SET @ri =  CAST((SELECT COUNT(*) FROM (SELECT PK_ID FROM [dbo].[FORM_CS_StaticticalReport]) AS Count) AS INT);

-- Repeat query of the ReportQuery column 5 times
WHILE @counter < 5
BEGIN
	--PRINT CONCAT('Test: ', @counter)
	SELECT [ReportQuery]
	FROM [dbo].[FORM_CS_StaticticalReport]
	WHERE PK_ID IN
	(SELECT PK_ID
	FROM [dbo].[FORM_CS_StaticticalReport] 
	GROUP BY PK_ID)
	ORDER BY [PK_ID]
	OFFSET @counter ROWS
	FETCH NEXT @limit ROWS ONLY
	SET @counter = @counter + 1;
END;





