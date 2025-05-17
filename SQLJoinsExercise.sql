/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT P.Name AS Product, C.Name AS Category
FROM bestbuy.products AS P
INNER JOIN bestbuy.categories AS C ON P.CategoryID = C.CategoryID
WHERE C.Name = 'Computers';

-- I changed 'as' to 'AS'because words like SELECT, FROM, INNER JOING, WHERE and AS are SQL reserved keywords"
-- Acording to lord google, this makes your SQL code easier to read, and is "industry standar" 

 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

/* joins: find the name of the department, and the name of the category for Appliances and Games */

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
