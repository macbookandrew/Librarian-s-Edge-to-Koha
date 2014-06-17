This repository contains instructions, scripts, and templates to help export existing library data from Librarian’s Edge to [Koha](http://koha-community.org/).

Process
=======
Note: these steps assume you’re working on Mac OS X (MySQL, command line) and Windows 7 Pro (MarcEdit). You may need to adjust based on your operating systems.

1. Getting the Data
-------------------
1. Connect to MSSQL server containing Librarian’s Edge data, using [Navicat](http://www.navicat.com/products/navicat-for-sqlserver) or another MSSQL client.
2. Export at least the `Media`, `MediaTypes`, and `MediaLocations` tables as CSV, preferably with column headings.
3. Create a MySQL database, use the [Media table syntax](Media table syntax.sql) SQL file to set up the tables, then import the CSV files to those tables.

2. Tweaking the Data
-------------------
1. Set up the [item types](http://manual.koha-community.org/3.6/en/basicparams.html) in your Koha installation and make note of the item type codes.
2. Make a list of the media types in your Librarian’s Edge installation and the corresponding item types in your new Koha library.
3. Export the data from MySQL to tab-separated text files by setting variables and running the query in the [Export MySQL to TSV](Export MySQL to TSV.sql) file as many times as you have MediaTypes in Librarian’s Edge.

3. Converting the Data
---------------------
1. Using [MarcEdit’s](http://marcedit.reeset.net) Delimited Text Translator tool, open the `.txt` files one at a time, set the “Text Qualifier” field to a double quote mark, and convert the `.txt` files to MRK format using the [MarcEdit template](MarcEdit template.mrd) for field mappings.
2. Using [MarcEdit’s](http://marcedit.reeset.net) MarcMaker tool, convert the `.mrk` files to MRC format.

4. Importing the Data
--------------------
1. Navigate to the Koha “Stage MARC records for import” tool.
2. Upload the compiled `.mrc` file into the resevoir.
3. Navigate to the “Staged MARC management” tool, click on the file name of the batch(es) you imported, set preferences as desired, and import them to the library.

5. Adding Items to Koha
----------------------
1. Once you have added all the items to Koha, export the `biblio` and `biblioitems` tables and import them to your local MySQL instance.
2. Set the parameters and run the [Build holdings table](Build holdings table.sql) SQL queries as many times as you have distinct `MediaTypes` in Librarian’s Edge.
3. Import the `.csv` files into Koha, using the first line to match field names.

Reference
=========
- For information on MARC codes and formatting, see [the official MARC21 format site](http://www.loc.gov/marc/bibliographic/bdsummary.html) and the [Koha-specific fields](http://goo.gl/QR4SnT).
- For information on the Librarian’s Edge fields to MARC21 mappings, refer to [this file](MARC mappings.md).
