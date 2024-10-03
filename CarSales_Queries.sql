/*
===============================================================================
Author: Emmanuel Cohen
SQL Software: Microsoft SQL Server Management Studio
Description: This SQL script analyzes car sales data by inspecting and cleaning
the data, manipulating and analyzing the data to answer key business questions,
and splitting the data into separate tables to support Tableau visualizations.
===============================================================================
*/

-- Initial view of the table to ensure all the columns were imported correctly
USE CarSales_PortfolioProject;
SELECT *
FROM CarSales;

/*
===============================================================================
I. DATA QUALITY REVIEW AND CLEANING
===============================================================================
*/

-- Create a new table to avoid modifying the original data (file also duplicated manually to introduce redundancy)
SELECT *
INTO CarSales_Modified
FROM CarSales;

-- Verify that the table loaded correctly with a full view and comparing row count
SELECT *
FROM CarSales_Modified;

SELECT COUNT(*) AS TotalRows
FROM CarSales;

SELECT COUNT(*) AS TotalRows
FROM CarSales_Modified;

-- View each columns data type
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CarSales_Modified';

-- Update column data types as needed (note: mmr represents estimated market value)
ALTER TABLE CarSales_Modified ALTER COLUMN year int;
ALTER TABLE CarSales_Modified ALTER COLUMN condition int;
ALTER TABLE CarSales_Modified ALTER COLUMN odometer int;
ALTER TABLE CarSales_Modified ALTER COLUMN mmr MONEY;
ALTER TABLE CarSales_Modified ALTER COLUMN sellingprice MONEY;
ALTER TABLE CarSales_Modified ALTER COLUMN saledate DATE;

-- The column 'saledate' produced an error; checking to see if any non-date values exist
SELECT saledate, COUNT(*) AS SaleDateCount
FROM CarSales_Modified
GROUP BY saledate
ORDER BY saledate ASC;

-- Identified 38 '#VALUE' cells that need to be removed
DELETE FROM CarSales_Modified
WHERE saledate = '#VALUE!';

-- Attempting to convert the 'saledate' to DATE once more (successful)
ALTER TABLE CarSales_Modified ALTER COLUMN saledate DATE;

-- Run data type check once more to verify that updates were successfully implemented 
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CarSales_Modified';

-- Count the number of empty cells in each column to understand if there are any large data gaps
SELECT 
	SUM(CASE WHEN year = '' THEN 1 ELSE 0 END) AS count_year,
	SUM(CASE WHEN make = '' THEN 1 ELSE 0 END) AS count_make,
	SUM(CASE WHEN model = '' THEN 1 ELSE 0 END) AS count_model,
	SUM(CASE WHEN trim = '' THEN 1 ELSE 0 END) AS count_trim,
	SUM(CASE WHEN body = '' THEN 1 ELSE 0 END) AS count_body,
	SUM(CASE WHEN transmission = '' THEN 1 ELSE 0 END) AS count_transmission,
	SUM(CASE WHEN vin = '' THEN 1 ELSE 0 END) AS count_vin,
	SUM(CASE WHEN state = '' THEN 1 ELSE 0 END) AS count_state,
	SUM(CASE WHEN condition = '' THEN 1 ELSE 0 END) AS count_condition,
	SUM(CASE WHEN odometer = '' THEN 1 ELSE 0 END) AS count_odometer,
	SUM(CASE WHEN color = '' THEN 1 ELSE 0 END) AS count_color,
	SUM(CASE WHEN interior = '' THEN 1 ELSE 0 END) AS count_interior,
	SUM(CASE WHEN seller = '' THEN 1 ELSE 0 END) AS count_seller,
	SUM(CASE WHEN mmr = '' THEN 1 ELSE 0 END) AS count_mmr,
	SUM(CASE WHEN sellingprice = '' THEN 1 ELSE 0 END) AS count_sellingprice,
	SUM(CASE WHEN saledate = '' THEN 1 ELSE 0 END) AS count_saledate
FROM CarSales_Modified;

/*
Transmission is missing a value in ~10% of cases. This is expected since some
makes/models will only be made with one option. These rows will remain within the table
to avoid significantly reducing the size of the dataset.

The other missing values add up to a small percentage of the data set and will be removed
to avoid skewing the final result.
*/

-- Removing missing values
DELETE FROM CarSales_Modified
WHERE make = ''
	OR model = '' 
	OR trim = '' 
	OR body = '' 
	OR condition = '' 
	OR odometer = '' 
	OR color = ''
	OR interior = '';

-- Re-run to confirm that now only transmission has missing values
SELECT 
	SUM(CASE WHEN year = '' THEN 1 ELSE 0 END) AS count_year,
	SUM(CASE WHEN make = '' THEN 1 ELSE 0 END) AS count_make,
	SUM(CASE WHEN model = '' THEN 1 ELSE 0 END) AS count_model,
	SUM(CASE WHEN trim = '' THEN 1 ELSE 0 END) AS count_trim,
	SUM(CASE WHEN body = '' THEN 1 ELSE 0 END) AS count_body,
	SUM(CASE WHEN transmission = '' THEN 1 ELSE 0 END) AS count_transmission,
	SUM(CASE WHEN vin = '' THEN 1 ELSE 0 END) AS count_vin,
	SUM(CASE WHEN state = '' THEN 1 ELSE 0 END) AS count_state,
	SUM(CASE WHEN condition = '' THEN 1 ELSE 0 END) AS count_condition,
	SUM(CASE WHEN odometer = '' THEN 1 ELSE 0 END) AS count_odometer,
	SUM(CASE WHEN color = '' THEN 1 ELSE 0 END) AS count_color,
	SUM(CASE WHEN interior = '' THEN 1 ELSE 0 END) AS count_interior,
	SUM(CASE WHEN seller = '' THEN 1 ELSE 0 END) AS count_seller,
	SUM(CASE WHEN mmr = '' THEN 1 ELSE 0 END) AS count_mmr,
	SUM(CASE WHEN sellingprice = '' THEN 1 ELSE 0 END) AS count_sellingprice,
	SUM(CASE WHEN saledate = '' THEN 1 ELSE 0 END) AS count_saledate
FROM CarSales_Modified;

-- Check the categories for outliers; re-run for each column by adjusting 'year' to the next column name
SELECT year, COUNT(*) AS year_count
FROM CarSales_Modified
GROUP BY year
ORDER BY year DESC;

-- Updates to identified fields from prior query to normalize categories
UPDATE CarSales_Modified
SET	body = REPLACE(body, 'regular-cab', 'Regular Cab'), 
	state = UPPER(state),
	color = REPLACE(color, '—', ''),
	interior = REPLACE(interior, '—', ''),
	seller = REPLACE(seller, 'nissan infiniti lt', 'nissan-infiniti lt');

/*
===============================================================================
II. NEW COLUMNS AND CALCULATIONS FOR FURTHER ANALYSIS
===============================================================================
*/

-- Add profit margin calculation column
ALTER TABLE CarSales_Modified
ADD profit_margin AS (sellingprice - mmr) PERSISTED;

-- Add profit margin % calculation column
ALTER TABLE CarSales_Modified
ADD profit_margin_pct AS ((sellingprice - mmr) / mmr * 100) PERSISTED;

-- Add make/model column to more easily identify in later steps
ALTER TABLE CarSales_Modified
ADD make_model AS (make + ' ' + model) PERSISTED;

-- View updated table to confirm the new columns contain the expected data
SELECT *
FROM CarSales_Modified;

-- Verify new column data types are correct
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CarSales_Modified';

/*
===============================================================================
III. CREATING SPECIFIC TABLE VIEWS TO ADDRESS BUSINESS QUESTIONS

A calculation for avg_profit_margin_pct has been added to normalize the profit 
to the market price in each. Each query will dig deeper into a specific variable
and see which factors play the biggest role in profits.
===============================================================================
*/

-- Create a view comparing the make of the car to profit margin
CREATE VIEW TopMakes AS
SELECT TOP 20 make, -- Filtered to show only the top 20 to avoid low volume brands
	COUNT(make) AS count_make,
	AVG(sellingprice) AS avg_sellingprice,
	AVG(mmr) AS avg_mmr,
	AVG(profit_margin) AS avg_profit_margin,
	AVG(profit_margin) / AVG(mmr) * 100 AS avg_profit_margin_pct
FROM CarSales_Modified
GROUP BY make
ORDER BY count_make DESC;

-- Create a view comparing the make and model to profit margin
CREATE VIEW TopModels AS
SELECT TOP 50 make_model, -- Filtered to show only the top 50 to avoid low volume models
	make,
	model,
	COUNT(make_model) AS count_make_model,
	AVG(sellingprice) AS avg_sellingprice,
	AVG(mmr) AS avg_mmr,
	AVG(profit_margin) AS avg_profit_margin,
	AVG(profit_margin) / AVG(mmr) * 100 AS avg_profit_margin_pct
FROM CarSales_Modified
GROUP BY make_model, make, model
ORDER BY count_make_model DESC;

-- Create a view comparing the condition to profit margin
CREATE VIEW Condition AS
SELECT condition,
	AVG(sellingprice) AS avg_sellingprice,
	AVG(mmr) AS avg_mmr,
	AVG(profit_margin) AS avg_profit_margin,
	AVG(profit_margin) / AVG(mmr) * 100 AS avg_profit_margin_pct
FROM CarSales_Modified
GROUP BY condition;

-- Create a view comparing the odometer to profit margin
CREATE VIEW Odometer AS
SELECT odometer,
	AVG(sellingprice) AS avg_sellingprice,
	AVG(mmr) AS avg_mmr,
	AVG(profit_margin) AS avg_profit_margin,
	AVG(profit_margin) / AVG(mmr) * 100 AS avg_profit_margin_pct
FROM CarSales_Modified
GROUP BY odometer;

-- Comparing transaction quantity per state to identify any regional market trends
CREATE VIEW States AS
SELECT state,
	COUNT(state) AS transaction_qty,
	AVG(sellingprice) AS avg_sellingprice,
	AVG(mmr) AS avg_mmr,
	AVG(profit_margin) AS avg_profit_margin,
	AVG(profit_margin) / AVG(mmr) * 100 AS avg_profit_margin_pct
FROM CarSales_Modified
GROUP BY state;

-- Calculated seller estimate profit margin %, revenue and gross profit to evaluate competition and potential acquisition opportunities
CREATE VIEW Companies AS
SELECT seller,
    COUNT(seller) AS transaction_qty,
    AVG(sellingprice) AS avg_sellingprice,
    AVG(mmr) AS avg_mmr,
    AVG(profit_margin) AS avg_profit_margin,
	AVG(profit_margin) / AVG(mmr) * 100 AS avg_profit_margin_pct,
	AVG(sellingprice) * COUNT(seller) AS estimated_revenue,
	AVG(profit_margin) * COUNT(seller) AS estimated_gross_profit
FROM CarSales_Modified
GROUP BY seller
HAVING COUNT(seller) > 5000; -- Filtered to only include those with over 5000 in sales volume to focus on established sellers

-- Isolating just the sale date to see if any seasonal/annual trends emerge
CREATE VIEW SaleDates AS
SELECT saledate,
	COUNT(saledate) AS transaction_qty
FROM CarSales_Modified
GROUP BY saledate

/*
===============================================================================
IV. SPLITTING DATA INTO SEPARATE TABLES

Improves performance, flexibility and scalability as the dataset is updated.
These will later be organized using an  Entity Relationship Diagram (ERD).
===============================================================================
*/

-- Create a table for car data
SELECT vin,
		year,
		make,
		model,
		trim,
		body,
		transmission,
		condition,
		odometer,
		color,
		interior,
		mmr
INTO cars
FROM CarSales_Modified

-- Create a table for transaction data
SELECT vin,
		state,
		seller,
		sellingprice,
		saledate,
		profit_margin_pct
INTO transactions
FROM CarSales_Modified

-- Create a table for regional data; rejoin will be joined from another table in tableau
SELECT vin,
		state
INTO geo_lookup
FROM CarSales_Modified
GROUP BY vin, state

/*
Please see project write-up found on https://github.com/CohenEmmanuel/Data-Driven-Auto-Portfolio-Project/blob/main/README.md for Tableau dashboard and additional details/resources.
*/
