
# Get all duplicate records
SELECT GROUP_CONCAT(biblionumber SEPARATOR ', ') AS biblionumbers, title, author 
FROM biblio 
GROUP BY CONCAT(title,"/",author) HAVING COUNT(CONCAT(title,"/",author))>1
INTO OUTFILE '/tmp/MySQL/duplicates.csv'
  FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
  LINES TERMINATED BY '\n';
