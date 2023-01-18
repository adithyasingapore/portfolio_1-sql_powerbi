/*
AdventureWorks - Sales Analysis with SQL

Dataset: "AdventureWorksDW2019.bak" (Data Warehouse version 2019)
Source Link: https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15&tabs=ssms

This is a Microsoft Learn dataset made available for Microsoft SQL Server.
Three types and many years are available. I have chosen the Data Warehouse version 2019.
*/



-- Lines before and after the query which start with double-hyphen "--" are explanatory comments.
-- Lines within the query which start with "--" are to exclude those table columns from the query.



-- Cleaned DimDate table to improve readability and usability
-- Data filtered for only the last 2 years, as that is what our project requires
SELECT
	[DateKey],
	[FullDateAlternateKey] AS Date,
--		[DayNumberOfWeek],
	[EnglishDayNameOfWeek] AS Day,
--		[SpanishDayNameOfWeek],
--		[FrenchDayNameOfWeek],
--		[DayNumberOfMonth],
--		[DayNumberOfYear],
--		[WeekNumberOfYear],
	[EnglishMonthName] AS Month,
	LEFT([EnglishMonthName], 3) AS MonthShort, -- useful for visualizations later
--		[SpanishMonthName],
--		[FrenchMonthName],
	[MonthNumberOfYear] AS MonthNo,
	[CalendarQuarter] AS Quarter,
	[CalendarYear] AS Year
--		[CalendarSemester],
--		[FiscalQuarter],
--		[FiscalYear],
--		[FiscalSemester]
FROM [AdventureWorksDW2019].[dbo].[DimDate]
WHERE CalendarYear >= 2020
ORDER BY Date;



-- Cleaned DimCustomer table to improve readability and usability
-- Joining DimGeography table to view Customer City along with DimCustomer data
SELECT
	cust.[CustomerKey] AS CustomerKey,
--		[GeographyKey],
--      	[CustomerAlternateKey],
--      	[Title],
	cust.[FirstName] AS FirstName,
--		[MiddleName],
	cust.[LastName] AS LastName,
	cust.[FirstName] + ' ' + [LastName] AS [FullName],
--		[NameStyle],
--      	[BirthDate],
--      	[MaritalStatus],
--      	[Suffix],
	CASE cust.[Gender] WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS [Gender],
--      	[EmailAddress],
--      	[YearlyIncome],
--      	[TotalChildren],
--      	[NumberChildrenAtHome],
--      	[EnglishEducation],
--      	[SpanishEducation],
--      	[FrenchEducation],
--      	[EnglishOccupation],
--      	[SpanishOccupation],
--      	[FrenchOccupation],
--      	[HouseOwnerFlag],
--      	[NumberCarsOwned],
--      	[AddressLine1],
--      	[AddressLine2],
--      	[Phone],
	cust.[DateFirstPurchase] AS DateFirstPurchase,
--      	[CommuteDistance],
	geo.[City] AS [Customer City]
FROM [AdventureWorksDW2019].[dbo].[DimCustomer] AS cust
	LEFT JOIN [AdventureWorksDW2019].[dbo].[DimGeography] AS geo ON geo.GeographyKey = cust.GeographyKey
ORDER BY CustomerKey;



-- Cleaned DimProduct table to improve readability and usability
-- Joined Product Category and Product Subcategory Keys
SELECT
	pro.[ProductKey],
	pro.[ProductAlternateKey],
--		[ProductSubcategoryKey]
--		[WeightUnitMeasureCode]
--		[SizeUnitMeasureCode]
	pro.[EnglishProductName] AS [ProductName],
	prosub.[EnglishProductSubcategoryName] AS [Product Subcategory],
	procat.[EnglishProductCategoryName] AS [Product Category],
--		[SpanishProductName]
--		[FrenchProductName]
--		[StandardCost]
--		[FinishedGoodsFlag]
	pro.[Color] AS [Product Color],
--		[SafetyStockLevel]
--		[ReorderPoint]
--		[ListPrice]
	pro.[Size] AS [Product Size],
--		[SizeRange]
--		[Weight]
--		[DaysToManufacture]
	pro.[ProductLine] AS [Product Line],
--		[DealerPrice]
--		[Class]
--		[Style]
	pro.[ModelName] AS [Product Model Name],
--		[LargePhoto]
	pro.[EnglishDescription] AS [Product Description],
--		[FrenchDescription]
--		[ChineseDescription]
--		[ArabicDescription]
--		[HebrewDescription]
--		[ThaiDescription]
--		[GermanDescription]
--		[JapaneseDescription]
--		[TurkishDescription]
--		[StartDate]
--		[EndDate]
	ISNULL (pro.[Status], 'Outdated') AS [Product Status]
FROM [AdventureWorksDW2019].[dbo].[DimProduct] AS pro
	LEFT JOIN [AdventureWorksDW2019].[dbo].[DimProductSubcategory] AS prosub ON prosub.[ProductSubcategoryKey] = pro.[ProductSubcategoryKey]
	LEFT JOIN [AdventureWorksDW2019].[dbo].[DimProductCategory] AS procat ON prosub.[ProductCategoryKey] = procat.[ProductCategoryKey]
ORDER BY pro.[ProductKey];

/* NOTE:
The 'Status' column lists those products which are 'Current'. Those which are not current are NULLs.
So, I have added ISNULL to tell SQL to display NULLs in that column as 'Outdated', i.e. they are not current.
*/



-- Cleaned FactInternetSales table to improve readability and usability
-- Data filtered for only the last 2 years, as that is what our project requires
SELECT
	[ProductKey],
	[OrderDateKey],
	[DueDateKey],
	[ShipDateKey],
	[CustomerKey],
--		[PromotionKey],
--		[CurrencyKey],
--		[SalesTerritoryKey],
	[SalesOrderNumber],
--		[SalesOrderLineNumber],
--		[RevisionNumber],
--		[OrderQuantity],
--		[UnitPrice],
--		[ExtendedAmount],
--		[UnitPriceDiscountPct],
--		[DiscountAmount],
--		[ProductStandardCost],
--		[TotalProductCost],
	[SalesAmount]
--		[TaxAmt],
--		[Freight],
--		[CarrierTrackingNumber],
--		[CustomerPONumber],
--		[OrderDate],
--		[DueDate],
--		[ShipDate]
FROM [AdventureWorksDW2019].[dbo].[FactInternetSales]
WHERE LEFT (OrderDateKey, 4) >= YEAR(GETDATE()) -2
ORDER BY OrderDateKey;

/* NOTE:
The OrderDateKey column's first 4 digits are the year.
The YEAR(GETDATE()) fetches the current year automatically.
Our project requires data of the prior 2 years, so we add '-2'.
Using the above function will allow us to only filter the data for the last 2 years.
*/

-- END
