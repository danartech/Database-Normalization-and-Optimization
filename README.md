# Project Summary: Database Normalization and Optimization

## Overview

In this project, I reorganized the structure of the database to improve its efficiency and manageability. The initial design stored all data in a single table, which included movies, store locations, and inventory information. This setup made it challenging to update or retrieve specific data and could lead to inconsistencies and errors.

![Original Data](https://github.com/danartech/Database-Normalization-and-Optimization/blob/main/Screenshot%202024-07-28%20002717.png)

## Actions Taken

1. **Data Segmentation**
   - Created three separate tables to better organize the data:
     - **`inventory`**: Contains inventory data, indicating which movies are available at which stores.
     - **`film`**: Stores details about movies, including titles, descriptions, release years, rental rates, and ratings.
     - **`store`**: Holds information about stores, such as manager names, addresses, cities, and districts.
    
![Normalized](https://github.com/danartech/Database-Normalization-and-Optimization/blob/main/Screenshot%202024-07-28%20005319.png)

2. **Establishment of Primary and Foreign Keys**
   - Defined primary keys in each table for unique identification of records.
   - Set up foreign keys to maintain relationships between tables, ensuring referential integrity.

3. **Data Integrity and Optimization**
   - Implemented constraints like `UNIQUE` and `NOT NULL` to ensure data consistency and accuracy.
   - The new structure minimizes data redundancy, storing each piece of information only once.

## Benefits

- **Improved Data Organization**: The new schema makes it easier to manage and update data. For example, changes to a movie's information only need to be made in one place.
- **Increased Efficiency**: Queries are faster and more efficient, as they can target specific tables rather than searching through a large, unstructured dataset.
- **Enhanced Data Integrity**: The improved structure reduces the risk of errors and ensures that the data remains accurate and reliable.
- **Scalability**: The database design now supports easy expansion, allowing new data (like movies or stores) to be added without major structural changes.

These enhancements make the database more efficient, reliable, and user-friendly, which is crucial for supporting business operations and decision-making processes.

## SQL Implementation Notes

The changes involved using SQL commands to create new tables, establish primary and foreign keys, and transfer data from the original schema. For those interested in the technical details, here is a high-level overview of the SQL operations performed:

1. **Creating Tables:**
   ```sql
   CREATE TABLE inventory (
       inventory_id INT PRIMARY KEY,
       film_id INT,
       store_id INT,
       FOREIGN KEY (film_id) REFERENCES film(film_id),
       FOREIGN KEY (store_id) REFERENCES store(store_id)
   );

   CREATE TABLE film (
       film_id INT PRIMARY KEY,
       title VARCHAR(255),
       description TEXT,
       release_year YEAR,
       rental_rate DECIMAL(4,2),
       rating VARCHAR(10)
   );

   CREATE TABLE store (
       store_id INT PRIMARY KEY,
       store_manager_first_name VARCHAR(255),
       store_manager_last_name VARCHAR(255),
       store_address VARCHAR(255),
       store_city VARCHAR(255),
       store_district VARCHAR(255)
   );

## Appendices

- **Inventory Table**: [Inventory Table](https://github.com/danartech/Database-Normalization-and-Optimization/blob/main/inventory%20table.csv)
- **Film Table**: [Film Table](https://github.com/danartech/Database-Normalization-and-Optimization/blob/main/film%20table.csv)
- **Store Table**: [Store Table](https://github.com/danartech/Database-Normalization-and-Optimization/blob/main/store%20table.csv)
- **Non-Normalized Table**: [Non-Normalized Table](https://github.com/danartech/Database-Normalization-and-Optimization/blob/main/inventory_non_normalized_original%20schema%20table.csv)
