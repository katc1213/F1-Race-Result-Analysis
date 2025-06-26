CREATE DATABASE F1_Race_Analysis;
USE F1_Race_Analysis;

-- Add clean qualifying table through server
SELECT *
FROM qualifying;

-- Create normalized table with quali results
CREATE TABLE normal_qualifying (
	quali_id INT,
	race_id INT,
	driver_id INT,
	constructor_id INT,
	car_number INT,
	position INT,
	q1 TIME,
	q2 TIME,
	q3 TIME
	);

INSERT INTO normal_qualifying
SELECT *
FROM qualifying;

SELECT * FROM normal_qualifying;

-- Add clean races table through server
SELECT *
FROM races;

-- Create normalized table with race results
CREATE TABLE normal_races (
	race_id INT,
	race_year INT,
	round INT,
	circuit_id INT,
	race_name VARCHAR(50),
	race_date DATE,
	race_time TIME,
	race_url VARCHAR(255),
	fp1_date DATE,
	fp1_time TIME, 
	fp2_date DATE, 
	fp2_time TIME, 
	fp3_date DATE,
	fp3_time TIME,
	quali_date DATE,
	quali_time TIME,
	sprint_date DATE,
	sprint_time TIME
);

INSERT INTO normal_races
SELECT *
FROM races;

ALTER TABLE normal_races
DROP COLUMN race_url;

-- Get races from only 2024 and 2025 while delete rest
DELETE FROM normal_races
WHERE race_year != 2025 AND race_year != 2024;
SELECT * FROM normal_races;

--DROP TABLE normal_races;

