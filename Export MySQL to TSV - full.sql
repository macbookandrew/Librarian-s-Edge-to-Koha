# Set the variables and run this query as many times as you have MediaTypes in Librarian’s Edge

SET @KohaItemType = 'BOOKS';		# The code for the Item Type you have (or plan to) created in Koha
SET @MediaTypeCode = 'Book';		# The existing MediaTypeCode in Librarian’s Edge
SET @Filename = "books.txt";		# Filename of your export file
SET @OutputFile = CONCAT('/tmp/LibEdge/',@Filename); # Path to your export file
SET @HomeBranch = 'MainLibrary';	# The name of your main (owning) library (see http://wiki.koha-community.org/wiki/Holdings_data_fields_(9xx))

SET @Query = CONCAT("SELECT '024$a','245$a','245$c','490$a','541$a','541$e','541$d','541$h','541$a1','541$a2','542$g','264$c','250$a','300$a','300$c','260$b','260$a','260$c','520$a','952$i','952$g','952$y','952$a','952$b','100$a','952$o','020$a','021$a'
UNION ALL
SELECT *,
	@KohaItemType as KohaItemType,
	@HomeBranch as HomeBranch,
	`MediaLocations`.`MediaLocationCode` as HoldingBranch,
	RTRIM(CONCAT(`AuthorLastName`, ', ', `AuthorFirstName`, ' ', `AuthorMiddleName`)) as AuthorFullName,				# concatenates author names
	RTRIM(REPLACE(CONCAT_WS(' ',`CallNum1`, `CallNum2`, `CallNum3`, `CallNum4`, `CallNum5`),'  ',' ')) as CallNumFull,	# concatenates call number
	REPLACE(`ISBN`,'-','') as ISBNFormatted,
	REPLACE(`LCCN`,'-','') as LCCNFormatted
	INTO OUTFILE '",@Outputfile,"'
		FIELDS TERMINATED BY \'\t\' OPTIONALLY ENCLOSED BY \'\"\'
		LINES TERMINATED BY \'\r\n\'
	FROM Media
	LEFT JOIN `MediaTypes` ON `Media`.`MediaTypeRefID` = `MediaTypes`.`MediaTypeRefID`
	LEFT JOIN `MediaLocations` ON `Media`.`LocationRefID` = `MediaLocations`.`MediaLocationRefID`
	WHERE `MediaTypeCode` LIKE @MediaTypeCode");

PREPARE QueryResult from @Query;
EXECUTE QueryResult;
DEALLOCATE PREPARE QueryResult;
