# Set the variables and run this query as many times as you have MediaTypes in Librarian’s Edge

SET @itype			=	'BOOKS';										# The code for the Item Type you have (or plan to) created in Koha
SET @MediaTypeCode	=	'Book';											# The existing MediaTypeCode in Librarian’s Edge
SET @HomeBranch		=	'MainLibrary';									# The name of your main (owning) library (see http://wiki.koha-community.org/wiki/Holdings_data_fields_(9xx))
SET @HoldingBranch	=	'HoldingBranch';								# The name of your holding library (see http://wiki.koha-community.org/wiki/Holdings_data_fields_(9xx))
SET @OutputSQLFile	=	CONCAT('/tmp/LibEdge/holdings-',@itype,'.csv');	# The path and filename of the SQL file to generate

# Get MediaRefID from marcxml column
DROP TEMPORARY TABLE IF EXISTS biblio_holdings_info;
CREATE TEMPORARY TABLE biblio_holdings_info
SELECT biblioitemnumber, biblionumber, SUBSTRING_INDEX(
		ExtractValue(`marcxml`, '//datafield/subfield')
	, ' ', 1) as MARCMediaRefID
FROM biblioitems;

# Build a temporary table with all the info needed
SET @SQLExport = CONCAT("SELECT 'biblioitemnumber','biblionumber','stocknumber','dateaccessioned','itemcallnumber','homebranch','holdingbranch','price','replacementpricedate','datelastseen','notforloan','damaged','itemlost','withdrawn','timestamp','cn_source','itype'
UNION ALL
SELECT
	`biblio_holdings_info`.`biblioitemnumber`,
	`biblio_holdings_info`.`biblionumber`,
	`Media`.`MediaRefID` as stocknumber,
	CURDATE() as dateaccessioned,
	RTRIM(REPLACE(CONCAT_WS(' ',`CallNum1`, `CallNum2`, `CallNum3`, `CallNum4`, `CallNum5`),'  ',' ')) as itemcallnumber,	# concatenates call number
	@HomeBranch as homebranch,
	@HoldingBranch as holdingbranch,
	IF(`Media`.`cost` IS NULL or `Media`.`cost` = \'\', \"0\", `Media`.`cost`) as price,										# fill with 0 if no prices is present
	CURDATE() as replacementpricedate,
	CURDATE() as datelastseen,
	\"0\" as notforloan,
	\"0\" as damaged,
	\"0\" as itemlost,
	\"0\" as withdrawn,
	NOW() as timestamp,
	\"ddc\" as cn_source,
	'",@itype,"' as itype
INTO OUTFILE '",@OutputSQLFile,"'
	FIELDS TERMINATED BY \',\' OPTIONALLY ENCLOSED BY \'\"\'
	LINES TERMINATED BY \'\r\n\'
FROM biblio_holdings_info
LEFT JOIN `Media` ON `MARCMediaRefID` = `Media`.`MediaRefID`
LEFT JOIN `MediaTypes` ON `Media`.`MediaTypeRefID` = `MediaTypes`.`MediaTypeRefID`
WHERE `MediaTypes`.`MediaTypeCode` LIKE @MediaTypeCode;");

PREPARE SQLExportResults FROM @SQLExport;
EXECUTE SQLExportResults;
DEALLOCATE PREPARE SQLExportResults;
