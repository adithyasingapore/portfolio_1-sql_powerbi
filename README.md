# Portfolio Project 1 - SQL and PowerBI - AdventureWorks

Welcome to my first portfolio project. In this data analysis project, I clean the AdventureWorks dataset with SQL, then visualise it as an interactive dashboard with PowerBI and also export a static version of the dashboard as a PDF.

**Project Files**

There are 3 project files (1 SQL, 1 PowerBI and 1 PDF) and 5 data table files (4 CSVs and 1 Excel Worksheet) in this repository.

I am unable to upload the full "AdventureWorks Data Warehouse version 2019" file (99 MB) here on GitHub due to file size limit of 25 MB. Here is the link to the original dataset: https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2019.bak 

**Project Guide**

The 4 CSV data tables are the output of the SQL queries, where I clean the tables by sorting and exporting only those columns which are needed for visualisation in PowerBI. 

Once the cleaned data tables have been exported as CSVs, I import the 4 CSVs and the Excel worksheet into PowerBI, where I link the tables together in the "Model" side tab.

I then further process the data in Power Query ("Transform data" on the Home tab), renaming columns, changing columns' data type etc. and bring the columns into a format suitable for visualisation.

Finally, after visualising the data as an interactive dashboard in PowerBI, I also export a static version of the dashboard as a PDF.

**Future Project Aim**

I have started learning Python. Once I improve my Python knowledge sufficiently, I aim to set up and automate this process as a system, where data is pulled from a database, cleaned and organised into a format suitable for visualisation, visualised in a dashboard, the dashboard is exported as a PDF and the PDF is emailed to concerned stakeholders automatically.

The entire process should be autonomous and require almost zero human attention, with the exception of regular checks to verify the proper functioning of the process and the accuracy of the results.

Statement to self - New Year's Resolution: As of January 2023, I intend to achieve this level of proficiency in Python (and if possible, complete this full project and upload here to GitHub) at most within the end of 2023, allowing for unforeseen constraints, though I hope to achieve it sooner.
