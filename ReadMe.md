#Goal
Export existing library data from Librarian’s Edge to [Koha](http://koha-community.org/).

#Process
Note: these steps assume you’re working on Mac OS X (MySQL, command line) and Windows 7 Pro (MarcEdit). You may need to adjust based on your operating systems.

##1. Getting the Data
1. Connect to MSSQL server containing Librarian’s Edge data, using [Navicat](http://www.navicat.com/products/navicat-for-sqlserver) or another MSSQL client.
2. Export at least the `Media`, `MediaTypes`, and `MediaLocations` tables as CSV, preferably with column headings.
3. Create a MySQL database, use the [Media table syntax](Media table syntax.sql) SQL file to set up the tables, then import the CSV files to those tables.

##2. Tweaking the Data
1. Set up the [item types](http://manual.koha-community.org/3.6/en/basicparams.html) in your Koha installation and make note of the item type codes.
2. Note the media types in your Librarian’s Edge installation and tweak the [export queries](Export MySQL to TSV.sql) file as needed.
3. Export using queries in the [Export MySQL to TSV](Export MySQL to TSV.sql) file.

##3. Converting the Data
1. Using [MarcEdit’s](http://marcedit.reeset.net) Delimited Text Translator tool, convert the `.txt` files to MRK format, using the [MarcEdit template](MarcEdit template.mrd) for field mappings.
2. Using [MarcEdit’s](http://marcedit.reeset.net) MarcMaker tool, convert the `.mrk` files to MRC format.
3. Set up the categories in [Koha](http://koha-community.org/) and import the `.mrc` files.

##4. Importing the Data
1. Import to Koha

#Reference
- For information on MARC codes and formatting, see [this site](http://www.loc.gov/marc/bibliographic/bdsummary.html).
- For a list of codes used in the template, refer to [this file](MARC mappings.md).
