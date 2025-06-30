CREATE DATABASE F1_Race_Analysis;
USE F1_Race_Analysis;

IF OBJECT_ID('dbo.normal_qualifying', 'U') IS NOT NULL
    DROP TABLE dbo.normal_qualifying;

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

-- Create normalized table with race results
IF OBJECT_ID('dbo.normal_races', 'U') IS NOT NULL
    DROP TABLE dbo.normal_races;

CREATE TABLE normal_races (
	race_id INT,
	race_year INT,
	round INT,
	circuit_id INT,
	race_name VARCHAR,
	race_date DATE,
	race_time TIME,
	race_url VARCHAR,
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

-- results from race
IF OBJECT_ID('dbo.normal_results', 'U') IS NOT NULL
    DROP TABLE dbo.normal_results;

CREATE TABLE normal_results (
	result_id INT,
	race_id INT,
	driver_id INT,
	constructor_id INT,
	number INT,
	grid INT,
	position INT,
	position_text VARCHAR(50),
	position_order INT,
	points FLOAT,
	laps INT,
	time VARCHAR(50),
	milliseconds INT,
	fastest_lap INT,
	rank INT,
	fastest_lap_time TIME,
	fastest_lap_speed FLOAT,
	status_id INT
	);
INSERT INTO normal_results
SELECT *
FROM results;
SELECT * FROM normal_results;

-- create table for individual driver results from races
SELECT * 
FROM normal_races
INNER JOIN normal_results ON normal_races.race_id=normal_results.race_id;

-- lap time table to get driver position for race
IF OBJECT_ID('dbo.normal_lap_times', 'U') IS NOT NULL
    DROP TABLE dbo.normal_lap_times;

CREATE TABLE normal_lap_times (
	race_id INT,
	driver_id INT,
	lap INT,
	position INT,
	lap_time TIME,
	milliseconds INT
	);
INSERT INTO normal_lap_times
SELECT *
FROM lap_times;

SELECT * FROM normal_lap_times;

-- drivers table
IF OBJECT_ID('dbo.normal_drivers', 'U') IS NOT NULL
    DROP TABLE dbo.normal_drivers;

CREATE TABLE normal_drivers (
	driver_id INT,
	car_number INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	dob DATE,
	nationality VARCHAR(50)
	);
INSERT INTO normal_drivers
SELECT driverId, 
	number,	
	forename, 
	surname, 
	dob, 
	nationality
FROM drivers;

SELECT * FROM normal_drivers
ORDER BY dob DESC;

DELETE FROM normal_drivers
WHERE car_number IS NULL;


-- circuits table
IF OBJECT_ID('dbo.normal_circuits', 'U') IS NOT NULL
    DROP TABLE dbo.normal_circuits;

CREATE TABLE normal_circuits (
	circuit_id INT,
	circuit_ref VARCHAR(255),
	circuit_name VARCHAR(255),
	location VARCHAR(50),
	country VARCHAR(50),
	lat FLOAT,
	lng FLOAT,
	alt INT,
	url VARCHAR(255)
	);
INSERT INTO normal_circuits
SELECT *
FROM circuits;
select * from normal_circuits;