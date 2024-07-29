-- Database Adminstration --
                             -- MID COURSE PROJECT -- 
-- By: Dana Robinson 7/27/24

### QUESTIONS ###

/* 1) Take a look at the mavenmoviesminischema. 
What do you notice about it? 
How many tables are there? 
What does the data represent? What do you think about the current schema?

-- Answer-- 
The table isn't normalized and can be optized. The store information could go on a seperate table, 
film information could go into a seperate table and the store information could have a seperate table. 
The stores could be DISTINCT. There is only one table. The data reprsents movie inventory and store infomration.
*/


SELECT 
    *
FROM
    inventory_non_normalized;
    
/* 2) If you wanted to break out the data from the inventory_non_normalizedtable into multiple tables, 
how many tables do you think would be ideal? What would you name those tables?

--Answer--
-- Here is how the new tables could be structured:
-- inventory table (inventory_id, film_id, store_id)
-- film (film_id, title, decsription, release year, rental_rate, rating)
-- store (store_id, store_manager_first_name, store_manager_last_name, store_address, store_city, store_district)
*/

SELECT DISTINCT
    store
FROM
    inventory_non_normalized;


/*3) Based on your answer from question #2, create a new schema with the tables you think will best serve this data set. 
You can use SQL code or Workbench’s UI tools (whichever you feel more comfortable with).
*/

CREATE SCHEMA mavenmoviesmini_normalized;
-- 1) Created the inventory table
-- 2) Created the film table 
-- 3) Created a store table
-- 4) Setup Foreign keys in the inventory table 

/*4) Next, use the data from the original schema to populate the tables in your newly optimized schema
*/
-- Copied data from the original table into the new one
INSERT INTO inventory (inventory_id, film_id, store_id)
SELECT DISTINCT inventory_id, film_id, store_id
FROM mavenmoviesmini.inventory_non_normalized;

SELECT 
    *
FROM
    inventory;

-- Copied data from the original table into the new one
INSERT INTO film (film_id, title, description, release_year, rental_rate, rating)
select distinct film_id, title, description, release_year, rental_rate, rating
from mavenmoviesmini.inventory_non_normalized;


SELECT 
    *
FROM
    film;

-- Copied data from the original table into the new one
INSERT INTO store (store_id, store_manager_first_name, store_manager_last_name, store_address, store_city, store_district)
select distinct store_id, store_manager_first_name, store_manager_last_name, store_address, store_city, store_district
from mavenmoviesmini.inventory_non_normalized;

SELECT 
    *
FROM
    store;

/*5) Make sure your new tables have the proper primary keys defined and that applicable foreign keys are added.
Add any constraints you think should apply to the data as well (unique, non-NULL, etc.)

-- Answer --
Everything was covered in the previous steps. Checked all the tables again and everything looked fine.
*/

SELECT 
    *
FROM
    film;
SELECT 
    *
FROM
    inventory;
SELECT 
    *
FROM
    store; 

SELECT 
    *
FROM
    inventory_non_normalized;






/*6) Finally, after doing all of this technical work, write a brief summary of what you have done, in a way that your non-technical client can understand. 
Communicate what you did, and why your new schema design is better.

-- Answer --
# Project Summary: Database Normalization and Optimization

## Overview

In this project, I reorganized the structure of the database to improve its efficiency and manageability. 
The initial design stored all data in a single table, which included movies, store locations, and inventory information. 
This setup made it challenging to update or retrieve specific data and could lead to inconsistencies and errors.

## Actions Taken

1. **Data Segmentation**
   - Created three separate tables to better organize the data:
     - **`inventory`**: Contains inventory data, indicating which movies are available at which stores.
     - **`film`**: Stores details about movies, including titles, descriptions, release years, rental rates, and ratings.
     - **`store`**: Holds information about stores, such as manager names, addresses, cities, and districts.

2. **Establishment of Primary and Foreign Keys**
   - Defined primary keys in each table for unique identification of records.
   - Set up foreign keys to maintain relationships between tables, ensuring referential integrity.

3. **Data Integrity and Optimization**
   - Implemented constraints like `UNIQUE` and `NOT NULL` to ensure data consistency and accuracy.
   - The new structure minimizes data redundancy, storing each piece of information only once.

## Benefits

- **Improved Data Organization**: The new schema makes it easier to manage and update data. 
For example, changes to a movie's information only need to be made in one place.
- **Increased Efficiency**: Queries are faster and more efficient, as they can target specific tables rather than searching through a large, unstructured dataset.
- **Enhanced Data Integrity**: The improved structure reduces the risk of errors and ensures that the data remains accurate and reliable.
- **Scalability**: The database design now supports easy expansion, allowing new data (like movies or stores) to be added without major structural changes.

These enhancements make the database more efficient, reliable, and user-friendly, 
which is crucial for supporting business operations and decision-making processes.

## SQL Implementation Notes

The changes involved using SQL commands to create new tables, establish primary and foreign keys, 
and transfer data from the original schema. For those interested in the technical details, 
here is a high-level overview of the SQL operations performed:
*/


