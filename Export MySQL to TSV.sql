# Set the variables and run this query as many times as you have MediaTypes in Librarian’s Edge

SET @KohaItemType = 'BOOKS';	# The code for the Item Type you have (or plan to) created in Koha
SET @MediaTypeCode = 'Book';	# The existing MediaTypeCode in Librarian’s Edge
SET @Filename = "/books.txt";	# Filename of your export file
SET @OutputFile = CONCAT('/tmp/LibEdge/',@Filename); # Path to your export file

# Prepare the query
SET @Query = CONCAT("SELECT *,
	@KohaItemType as KohaItemType,
	# concatenates author names
	RTRIM(CONCAT(`AuthorLastName`, ', ', `AuthorFirstName`, ' ', `AuthorMiddleName`)) as AuthorFullName,
	# concatenates call number
	RTRIM(REPLACE(CONCAT_WS(' ',`CallNum1`, `CallNum2`, `CallNum3`, `CallNum4`, `CallNum5`),'  ',' ')) as CallNumFull
	INTO OUTFILE '",@Outputfile,"'
		FIELDS TERMINATED BY \'\t\' LINES TERMINATED BY \'\r\n\'
	FROM Media
	LEFT JOIN `MediaTypes` ON `Media`.`MediaTypeRefID` = `MediaTypes`.`MediaTypeRefID`
	WHERE `MediaTypeCode` LIKE @MediaTypeCode");

# Run the query
PREPARE QueryResult from @Query;
EXECUTE QueryResult;
DEALLOCATE PREPARE QueryResult;
