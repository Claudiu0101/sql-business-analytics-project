/*
----- Database Exploration -----

Script Purpose:
    - Explore the database structure
    - Identify available tables and their columns
*/

-- Explore all objects in the database
SELECT * 
FROM INFORMATION_SCHEMA.TABLES;

-- Explore all columns in the database
SELECT * 
FROM INFORMATION_SCHEMA.COLUMNS;