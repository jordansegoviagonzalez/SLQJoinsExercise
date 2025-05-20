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
-- Only rows where ethe caterogy name is 'Computers' will be included in the output of this 1sr query

 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT P.Name AS ProductName, P.Price, R.Rating
-- 'SELECT' is a keyword from SQL that allows us to pick columns we want to show
-- 'P.Name' is the Name of the column from  the 'pruducts' table (aliased as P).
-- 'AS ProductName' renames the output columns for better readability.
-- 'P.Price' is the Price column from the 'products' table.
-- 'R.Rating' is the Rating column from the 'reviews' table (aliased as R).
FROM bestbuy.products AS P
-- 'FROM' specifies the main table we query from, which is 'products' in the 'bestbuy' schema.
--  'AS P' creates an alias for 'production' (keyword AS) so we can refer to it as 'P' throughtout the query. 
INNER JOIN bestbuy.reviews AS R ON R.ProductID = P.ProductID
-- 'INNER JOING' combines rows from both tables where the ProductID matches.
-- 'AS R' creates an alias for 'reviews' to keep the query clean.
WHERE R.Rating = 5;
-- 'WHERE' filters the results to include only products that have a rating of 5.


 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS EmployeeName,
-- CONCAT() is a funtion used to join two or more strings together into one combined string 
-- 'E.FirstName' gets the first name from the 'employees' table
-- 'E.LastName' gets the last name from the 'employees' table
-- 'AS EmployeeName' renames the output column for better readability
SUM(S.Quantity) AS TotalQuantitySold
-- SUM() is a funtion that adds up the values in a numeric column and returns the total
-- in this case SUM(S.Quality) adds up the quantities each emplooyee sold.
-- 'S.Quality comes from the 'sales' table (using alias 'S')
-- 'AS TotalQualitySold' gives clear name to the sum result.
FROM bestbuy.employees AS E
-- 'FROM' defines the main table we're querying from , which is 'emplooyees' in the 'bestbuy' shema
INNER JOIN bestbuy.sales AS S ON E.EmployeeID = S.EmployeeID
-- 'INNER JOIN' connects the 'employees' and 'sales' tables.
-- It only includes rows where 'EmployeeID' matches in both tables
-- 'AS S' set an alis for the 'sales' table
GROUP BY E.EmployeeID
-- 'GROUP BY' groups the restults by eachg employee.
-- This lets us use 'SUM()' to calculate totals per employee.
ORDER BY TotalQuantitySold DESC;
-- 'ORDER BY' sorts the resutls in DESC mode means highest to lowest




/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT D.Name AS DepartmentName, C.Name AS CategoryName
-- 'SELECT'chooses the columns to show the result
-- 'D.Name' is the Name columns from Departrments table (aliased as D)
-- 'C.Name' is the Name columns in the output for clarity
FROM bestbuy.departments AS D
-- 'FROM' specifies the main table, Departments, with alias D
INNER JOIN bestbuy.categories AS C ON D.DepartmentID = C.DepartmentID
-- 'INNER JOIN' connects Departments and Categories where their DeparmentID matches
-- 'AS C' aliases Categories as C for cleaner reference
WHERE C.Name IN ('Appliances', 'Games');
-- 'WHER' filters to inclide only categories made 'Appliances' or Games'

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT 
  P.Name AS ProductName,
-- S: Select the product name

  SUM(S.Quantity) AS TotalQuantitySold,
-- S: Select the total number sold

  SUM(P.Price * S.Quantity) AS TotalPriceSold
-- S: Select the total price sold (price × quantity)

FROM bestbuy.products AS P
-- T: Table = products (alias P)

INNER JOIN bestbuy.sales AS S
-- A: Attach = sales (alias S)
  ON S.ProductID = P.ProductID
-- O: On = matching ProductID between sales and products

WHERE P.Name = 'Eagles: Hotel California'
-- T: Target = filter to only “Eagles: Hotel California”

GROUP BY P.Name;
-- T: Take = group by product name so SUM() aggregates per product
-- STAOTT ✅ 



/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT P.Name, R.Reviewer, R.Rating, R.Comment
-- S: Select product name, reviewer name, rating, and comment

FROM bestbuy.products AS P
-- T: Table = products (alias P)

INNER JOIN bestbuy.reviews AS R
-- A: Attach = reviews (alias R)
ON R.ProductID = P.ProductID
-- O: On = matching ProductID between reviews and products

WHERE P.ProductID = 857
-- T: Target = filter to only product with ID 857 (Visio TV)

AND R.Rating = 1;
-- T: Target = filter to only reviews with rating of 1 (lowest rating)



-- ------------------------------------------ Extra - May be difficult
SELECT 
  E.EmployeeID, 
  -- S: Select the employee's ID

  E.FirstName, 
  -- S: Select the employee's first name

  E.LastName, 
  -- S: Select the employee's last name

  P.Name AS ProductName, 
  -- S: Select the product name (alias ProductName)

  SUM(S.Quantity) AS QuantitySold
  -- S: Select total quantity sold (sum of sales quantity)

FROM bestbuy.employees AS E
-- T: Table = employees (alias E)

INNER JOIN bestbuy.sales AS S ON E.EmployeeID = S.EmployeeID
-- A: Attach sales (alias S)
-- O: On matching EmployeeID between employees and sales

INNER JOIN bestbuy.products AS P ON S.ProductID = P.ProductID
-- A: Attach products (alias P)
-- O: On matching ProductID between sales and products

GROUP BY E.EmployeeID, P.Name;
-- T: Take = group results by employee and product to sum quantities sold
-- STAOTT ✅

