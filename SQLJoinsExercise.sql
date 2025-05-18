/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT P.Name AS ProductList, C.Name AS CategoryList
-- 1
-- 'SELECT' specifies the colums we want to retrieve in the result.
-- 'P.Name' refers to the Name column from 'the' 'products' table (using alias 'P')
-- 'C.Name' refers to the Name column from the 'catergories' table (using alias 'C')
-- AS is a SQL keyword that make an alias
-- 'ProductsList' and 'CategoryList' rename the output columns for readability 
FROM bestbuy.products AS P
-- 'FROM' is a keyword from SQL its purpose it to define the main table we are querying from, which is 'products' in the 'bestbuy' schema
-- 'AS' is a keyword to make the alias happen
-- 'AS P' creates an alias so we can refer to 'products' as 'P' thoughtout the query
INNER JOIN bestbuy.categories AS C ON P.CategoryID = C.CategoryID
-- 'INNER JOIN' combines rows from both tables wher there is a match
-- We are matching rows where 'CategoryID' in 'product' equals 'CategoryID' in 'caterogies'  
-- AS C' sets an alias for the 'categories' table to keep the query cleaner
WHERE C.Name = 'Computers';
-- WHERE' filters the resutls.
-- Only rows where ethe caterogy name is 'Computers' will be included in the output

 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */


 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

/* joins: find the name of the department, and the name of the category for Appliances and Games */

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
