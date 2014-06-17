SET @OutputPath = CONCAT('/tmp/LibEdge/XML/');	# Path to your export files

DROP PROCEDURE IF EXISTS extractXML;
DELIMITER ;;

CREATE PROCEDURE extractXML()
BEGIN
	DECLARE n INT DEFAULT 0;					# declare variable for count of all rows
	DECLARE i INT DEFAULT 0;					# declare variable for counter
	SELECT COUNT(*) FROM biblioitems INTO n;	# get number of items in the table
	SET i=0;
	
	WHILE i < n DO
		SELECT `biblionumber`, `marcxml` INTO @biblionumber, @marcxml FROM biblioitems LIMIT i, 1;				# get the current record
		SET @SaveFileQuery = CONCAT("SELECT @marcxml INTO OUTFILE '",@OutputPath,@biblionumber,".xml';");		# prepared statement: save to an XML file with only this row’s XML
		PREPARE SaveFileResult FROM @SaveFileQuery; EXECUTE SaveFileResult; DEALLOCATE PREPARE SaveFileResult;	# execute the save-to-XML prepared statement
		SET i = i+1;							# increment the counter
	END WHILE;
END;
;;
DELIMITER ;										# reset the delimiter

CALL extractXML();								# run the procedure
