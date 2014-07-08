# Gets all "Bibliotheca Sacra" items
SELECT biblioitemnumber, biblio.biblionumber, 
	ExtractValue(`marcxml`, '//datafield[@tag="490"]/subfield[@code="a"]') AS issue_date_1,
	REPLACE(ExtractValue(`marcxml`, '//datafield[@tag="520"]/subfield[@code="a"]'), 'A Theological Quarterly Published by Dallas Theological Seminary.  ', '') AS issue_date_2,
	marcxml
FROM biblioitems
LEFT JOIN biblio ON biblioitems.biblionumber = biblio.biblionumber
WHERE biblio.title LIKE 'Bibliotheca Sacra';
