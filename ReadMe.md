#Goal
Export existing library data from Librarian’s Edge to [Koha](http://koha-community.org/).

#Process
Note: these steps assume you’re working on Mac OS X (MySQL, command line) and Windows 7 Pro (MarcEdit). You may need to adjust based on your operating systems.

1. Connect to MSSQL server containing Librarian’s Edge data, using [Navicat](http://www.navicat.com/products/navicat-for-sqlserver) or another MSSQL client.
2. Export at least the `Media` and `MediaTypes` tables as CSV, preferably with column headings.
3. Import to MySQL, first using the [Media table syntax](Media table syntax.sql) file to set up the tables.
4. Check the media types and tweak the export queries as needed.
5. Export using queries in the [Export MySQL to TSV](Export MySQL to TSV.sql) file.
6. Using [MarcEdit’s](http://marcedit.reeset.net) Delimited Text Translator tool, convert the `.txt` files to MRK format, using the [MarcEdit template](MarcEdit template.mrd) for field mappings.
7. Using a text editor, open the `.mrk` files, search using the regex `\=100  1#\$a(?:(.*?)\$a)(?:(.*?)\$a)?`, and replace with `=100  1#$a$1$2` to fix the author’s name (I didn’t have time to put together a shell script).
8. Using [MarcEdit’s](http://marcedit.reeset.net) MarcMaker tool, convert the `.mrk` files to MRC format.
9. Set up the categories in [Koha](http://koha-community.org/) and import the `.mrc` files.