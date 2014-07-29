# Generate barcode numbers from ISBN numbers
UPDATE items, biblioitems
SET `items`.`barcode` = `biblioitems`.`isbn`
WHERE `items`.`biblioitemnumber` = `biblioitems`.`biblioitemnumber`;

# Generate barcode numbers from biblioitemnumber if ISBN is missing
UPDATE items, biblioitems
SET `items`.`barcode` = `biblioitems`.`biblioitemnumber`
WHERE `items`.`biblioitemnumber` = `biblioitems`.`biblioitemnumber`
AND `biblioitems`.`isbn` IS NULL;
