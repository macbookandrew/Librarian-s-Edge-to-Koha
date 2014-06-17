# Set the variables and run this query as many times as you have MediaTypes in Librarian’s Edge

SET @KohaItemType	=	'BOOKS';							# The code for the Item Type you have (or plan to) created in Koha
SET @MediaTypeCode	=	'Book';								# The existing MediaTypeCode in Librarian’s Edge
SET @Filename		=	"books.txt";						# Filename of your export file
SET @OutputFile		=	CONCAT('/tmp/LibEdge/',@Filename);	# Path to your export file
SET @HomeBranch		=	'MainLibrary';						# The name of your main (owning) library (see http://wiki.koha-community.org/wiki/Holdings_data_fields_(9xx))

SET @Query = CONCAT("SELECT 
	MediaRefID as 024$a,
	Title as 245$a,
	StmtOfResponsibility as 245$c,
	Series as 490$a,
	Source as 541$a,
	AccessionNum as 541$e,
	DateAcquired as 541$d,
	Cost as 541$h,
	Donatedby as 541$a1,
	InHonorOf as 541$a2,
	CopyrightDate as 542$g,
	Copyrightdate as 264$c,
	Edition as 250$a,
	TechnicalDesc as 300$a,
	Dimension as 300$c,
	Publisher as 260$b,
	PublisherLocation as 260$a,
	PublicationDate as 260$c,
	SummaryText as 520$a,
	MediaRefID as 952$i,
	Cost as 952$g,
	@KohaItemType as 952$y,
	@HomeBranch as 952$a,
	`MediaLocations`.`MediaLocationCode` as 952$b,
	RTRIM(CONCAT(`AuthorLastName`, ', ', `AuthorFirstName`, ' ', `AuthorMiddleName`)) as 100$a,				# concatenates author names
	RTRIM(REPLACE(CONCAT_WS(' ',`CallNum1`, `CallNum2`, `CallNum3`, `CallNum4`, `CallNum5`),'  ',' ')) as 952$o,	# concatenates call number
	REPLACE(`ISBN`,'-','') as 020$a,
	REPLACE(`LCCN`,'-','') as 021$a
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
