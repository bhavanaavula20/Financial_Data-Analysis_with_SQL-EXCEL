
/*Using my SQL workbench for  Data Analysis project*/


create database projects;
use projects;

/*retrive all columns*/

select * from projects.financialdata;

/*retrive specific columns*/

select distinct segment from projects.financialdata;
select distinct country from projects.financialdata;
select distinct Product from projects.financialdata;
select distinct monthname from projects.financialdata;
select segment,country,Product,ManufacturingPrice,monthname,Year from projects.financialdata;

/*Filter data*/

select *from projects.financialdata
where Country="Canada";

select * from projects.financialdata
where segment="Government";

/*Sort data*/

select * from projects.financialdata
order by UnitsSold desc;

/*Limit data*/

select * from projects.financialdata
limit 10;

/*Group data*/

select country ,SUM(UnitsSold) as Totalunits from projects.financialdata
group by country;

/*Filter grouped data*/

select country ,SUM(UnitsSold) as Totalunits from projects.financialdata
group by country
having sum(UnitsSold)<220000;

/*Use subqueries*/

select * from projects.financialdata
where UnitsSold>(select AVG(UnitsSold) from projects.financialdata);
select unitssold from projects.financialdata;

/*Use window functions*/

select *, Row_number()over(order by UnitsSold desc)as RowNUM from projects.financialdata;

/*calculate total sales by country*/

SELECT Country, SUM(GrossSales) AS TotalSales
FROM projects.financialdata
GROUP BY Country
ORDER BY TotalSales DESC;

/*Find Top 5 products by sales*/

SELECT Product, SUM(GrossSales) AS TotalSales
FROM projects.financialdata
GROUP BY Product
ORDER BY TotalSales DESC
LIMIT 5;

/*calculate average discount by month*/

SELECT monthname, AVG(Discounts) AS AvgDiscount
FROM projects.financialdata
GROUP BY monthname
ORDER BY AvgDiscount DESC;

/*Find countries with Highest profit margin*/

SELECT Country, SUM(Profit) / SUM(GrossSales)*100 AS ProfitMargin
FROM projects.financialdata
GROUP BY Country
ORDER BY ProfitMargin DESC
LIMIT 5;

/*Calculate Total COGS by year*/

SELECT Year, SUM(COGS) AS TotalCOGS
FROM projects.financialdata
GROUP BY Year
ORDER BY TotalCOGS DESC;

/*Find products with Highest sales in Each country*/

SELECT Country, Product, SUM(GrossSales) AS TotalSales
FROM projects.financialdata
GROUP BY Country, Product
ORDER BY Country, TotalSales DESC;

/*calculate Average sales by month and Year*/


SELECT monthname, Year, AVG(GrossSales) AS AvgSales
FROM projects.financialdata
GROUP BY monthname, Year
ORDER BY monthname, Year;

/*Find Top 3 countries by sales in each region*/

SELECT segment, Country, SUM(GrossSales) AS TotalSales
FROM projects.financialdata
GROUP BY segment, Country
ORDER BY segment, TotalSales DESC
LIMIT 3;





