These mappings refer to files exported using the full [MySQL export query](Export MySQL to TSV - full.sql), rather than the [limited export query](Export MySQL to TSV.sql), which exports only the fields needed for Koha.

#MARC Mappings
- Field 0 (MediaRefID): mapped to **[024$a](http://www.loc.gov/marc/bibliographic/bd024.html)** with indicators **8a**
- Field 8 (Title): mapped to **[245$a](http://www.loc.gov/marc/bibliographic/bd245.html)** with indicators **00**, *combined with field 42*
	- Field 42 (StmtOfResponsibility): mapped to **[245$c](http://www.loc.gov/marc/bibliographic/bd245.html)** with indicators 00, *combined with field 8*
- Field 9 (MediaTypeRefID): not directly mapped, but keyed to `MediaTypes.MediaTypeRefID` and used to create `KohaItemType`
- Fields 12–14 (author names): not directly mapped, but used in a MySQL `CONCAT` statement to produce `AuthorFullName` field
- Field 17 (Series): mapped to **[490$a](http://www.loc.gov/marc/bibliographic/bd490.html)** with indicators **0#**
- Field 18 (IBSN): not directly mapped, but used in a MySQL `REPLACE` statement to produce `ISBNFormatted` field
- Field 19 (LCCN): not directly mapped, but used in a MySQL `REPLACE` statement to produce `LCCNFormatted` field
- Field 22–26 (call numbers): not directly mapped, but used in a MySQL `CONCAT_WS` statement to produce `CallNumFull` field
- Field 28 (LocationRefID): not directly mapped, but keyed to `MediaLocations.MediaLocationRefID` and used to create `HoldingBranch`
- Field 29 (Source): mapped to **[541$a](http://www.loc.gov/marc/bibliographic/bd541.html)** with indicators **##**, *combined with Fields 6, 30–31*
	- Field 6 (AccessionNum): mapped to **[541$e](http://www.loc.gov/marc/bibliographic/bd541.html)**, *combined with Fields 29–31, 54–55*
	- Field 30 (DateAcquired): mapped to **[541$d](http://www.loc.gov/marc/bibliographic/bd541.html)**, *combined with Fields 6, 29, 31, 54–55*
	- Field 31 (Cost): mapped to **[541$h](http://www.loc.gov/marc/bibliographic/concise/bd541.html)**, *combined with Fields 6, 29–30, 54–55*
	- Field 54 (DonatedBy): mapped to **[541$a](http://www.loc.gov/marc/bibliographic/bd541.html)**, *combined with fields 6, 29–31, 55*
	- Field 55 (InHonorOf): mapped to **[541$a](http://www.loc.gov/marc/bibliographic/bd541.html)**, *combined with fields 6, 29–31, 54*
- Field 32 (CopyrightDate)
	- Mapped to **[542$g](http://www.loc.gov/marc/bibliographic/bd542.html)** with indicators **##**
	- Mapped to **[264$c](http://www.loc.gov/marc/bibliographic/bd264.html)** with indicators **#1**
- Field 33 (Edition): mapped to **[250$a](http://www.loc.gov/marc/bibliographic/bd250.html)** with indicators **##**
- Field 34 (TechnicalDesc): mapped to **[300$a](http://www.loc.gov/marc/bibliographic/bd300.html)** with indicators **##**, *combined with field 35*
	- Field 35 (Dimension): mapped to **[300$c](http://www.loc.gov/marc/bibliographic/bd300.html)**, *combined with field 34*
- Field 36 (Publisher): mapped to **[260$b](http://www.loc.gov/marc/bibliographic/bd260.html)** with indicators **##**, *combined with fields 37–38*
	- Field 37 (PublisherLocation): mapped to **[260$a](http://www.loc.gov/marc/bibliographic/bd260.html)**, *combined with fields 36, 38*
	- Field 38 (PublicationDate): mapped to **[260$c](http://www.loc.gov/marc/bibliographic/bd260.html)**, *combined with fields 36–37*
- Field 43 (SummaryText): mapped to **[520$a](http://www.loc.gov/marc/bibliographic/bd520.html)** with indicators **##**
- Field 72 (AuthorFullName): mapped to **[100$a](http://www.loc.gov/marc/bibliographic/bd100.html)** with indicators **1#**
- Field 73 (ISBNFormatted): mapped to **[020$a](http://www.loc.gov/marc/bibliographic/bd020.html)** with indicators **##**
- Field 74 (LCCNFormatted): mapped to **[021$a](http://www.loc.gov/marc/bibliographic/bd020.html)** with indicators **##**

#Koha-Specific Field Mappings

Koha holdings fields, *all combined with each other:*

- Field 0 (MediaRefID): mapped to **[952$i](http://goo.gl/QR4SnT)**
- Field 31 (Cost): mapped to **[952$g](http://goo.gl/QR4SnT)**
- Field 69 (KohaItemType): mapped to **[952$y](http://goo.gl/QR4SnT)**
- Field 70 (HomeBranch): mapped to **[952$a](http://goo.gl/QR4SnT)**
- Field 71 (HoldingBranch): mapped to **[952$b](http://goo.gl/QR4SnT)**
- Field 73 (CallNumFull): mapped to **[952$o](http://goo.gl/QR4SnT)**
