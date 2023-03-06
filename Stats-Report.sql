/****** Display Table tag in HTML

******/


/****** Display Table tag in HTML from multi-row subquery
DECLARE 
	@i INT = 1,
	@ID INT;

SELECT @ID = PK_ID 
FROM [dbo].[FORM_CS_StaticticalReport]

WHILE @i < 3 
	BEGIN
		SELECT [ReportQuery]
		FROM [dbo].[FORM_CS_StaticticalReport]
		WHERE PK_ID = @i;
		SET @i += 1 ;
	END;
***********************************************/



/****** Display Table tag in HTML from multi-row subquery ****************************
DECLARE 
	@final_result TABLE(ReportName varchar(125), Report varchar(125));

DECLARE 
	@i INT = 0,
	@id INT,
	@reportQuery VARCHAR(MAX),
	@reportLabel VARCHAR(MAX);
	

DECLARE db_cursor CURSOR FOR 
SELECT ReportQuery,  ReportLabel
FROM [HealthInspections].[dbo].[FORM_CS_StaticticalReport]
WHERE ReportCategory = 4
;
OPEN db_cursor
FETCH NEXT FROM db_cursor INTO @reportQuery,@reportLabel
WHILE @@FETCH_STATUS=0
	BEGIN
		


		
		if(@reportLabel !='')
			INSERT INTO @final_result (ReportName) VALUES ('<h4>' +  @reportLabel + '</h4>')
		INSERT INTO @final_result
		EXEC (@reportQuery);


FETCH NEXT FROM db_cursor INTO @reportQuery,@reportLabel
	END;

--SELECT * FROM @final_result;


SELECT 'output', '<table class="table  table-hover general-table">
					<thead>
						<tr>
							<th>Report</th>
							<th>Count</th>
						</tr>
					</thead>
	<tbody>' + 
	(
		SELECT
			(SELECT ReportName AS 'td' FOR XML PATH(''), TYPE),
			(SELECT Report   AS 'td' FOR XML PATH(''), TYPE)
		FROM @final_result 

		FOR XML PATH('tr')
	) + '</tbody></table>'


	
CLOSE db_cursor
DEALLOCATE db_cursor
****************************************************************/


/****** Display select tag in HTML ****************************
SELECT 'output', '<div>' + (
 SELECT       
       [select/@class]='form-control m-bot15',
	   [select/@cntrl]='SGOFFICE',
       [select]=(
       SELECT 
			[option/@value] = [PK_ID], 
			[option]=[DESCRIPTION]
       FROM 
              -- sample data
				[SGCadasterSystem].[dbo].[LK_SGOfficeCodes] 
            
       FOR XML PATH(''), TYPE
       )
FOR XML PATH('') 
  ) + '</div>'
  ****************************************************************/