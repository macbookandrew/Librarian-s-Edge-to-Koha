# Tweak as needed for your `MediaTypeRefID` values

# Books
SELECT * INTO OUTFILE '/tmp/LibEdge/books.txt'
FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\r\n'
FROM `Media` WHERE `MediaTypeRefID` LIKE '1';

# Audio cassettes/CDs
SELECT * INTO OUTFILE '/tmp/LibEdge/audio.txt'
FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\r\n'
FROM `Media` WHERE `MediaTypeRefID` LIKE '3';

# CDs
SELECT * INTO OUTFILE '/tmp/LibEdge/CDs.txt'
FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\r\n'
FROM `Media` WHERE `MediaTypeRefID` LIKE '5';

# Flannelgraph
SELECT * INTO OUTFILE '/tmp/LibEdge/flannelgraph.txt'
FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\r\n'
FROM `Media` WHERE `MediaTypeRefID` LIKE '4';

# Flashcards
SELECT * INTO OUTFILE '/tmp/LibEdge/flashcards.txt'
FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\r\n'
FROM `Media` WHERE `MediaTypeRefID` LIKE '6';

# Videos
SELECT * INTO OUTFILE '/tmp/LibEdge/videos.txt'
FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\r\n'
FROM `Media` WHERE `MediaTypeRefID` LIKE '7';

# Periodicals
SELECT * INTO OUTFILE '/tmp/LibEdge/periodicals.txt'
FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\r\n'
FROM `Media` WHERE `MediaTypeRefID` LIKE '9';

# Archives
SELECT * INTO OUTFILE '/tmp/LibEdge/archives.txt'
FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\r\n'
FROM `Media` WHERE `MediaTypeRefID` LIKE '12';

# Pamphlets
SELECT * INTO OUTFILE '/tmp/LibEdge/pamphlets.txt'
FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\r\n'
FROM `Media` WHERE `MediaTypeRefID` LIKE '13';

# Missionary Stories
SELECT * INTO OUTFILE '/tmp/LibEdge/missionary stories.txt'
FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\r\n'
FROM `Media` WHERE `MediaTypeRefID` LIKE '14';


# Donated books
SELECT * INTO OUTFILE '/tmp/LibEdge/donated-John Larrabee.txt'
FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\r\n'
FROM `Media` WHERE `MediaTypeRefID` LIKE '15';
SELECT * INTO OUTFILE '/tmp/LibEdge/donated-TD Nichols.txt'
FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\r\n'
FROM `Media` WHERE `MediaTypeRefID` LIKE '8';


# Reserves
SELECT * INTO OUTFILE '/tmp/LibEdge/reserve-checkout.txt'
FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\r\n'
FROM `Media` WHERE `MediaTypeRefID` LIKE '10';
# Missionary Stories
SELECT * INTO OUTFILE '/tmp/LibEdge/reserve-non-checkout.txt'
FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\r\n'
FROM `Media` WHERE `MediaTypeRefID` LIKE '11';