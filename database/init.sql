--set up initial database schema related to Seismic Event 

--create new database for seismic data analysis
--CREATE DATABASE seismic_data_analysis; 

----------------------------- CREATE TABLES SEISMIC EVENT ------------------------------

-- location table for each seismic event
CREATE TABLE Location (
    id SERIAL PRIMARY KEY, 
    latitude FLOAT,
    longitude FLOAT,
    location_name TEXT
);

-- depth category: stores fixed depth category values 
CREATE TABLE DepthCategory (
    id SERIAL PRIMARY KEY, 
    category_name TEXT, 
    min_depth FLOAT, 
    max_depth FLOAT
);

-- initialize depth category values 
INSERT INTO DepthCategory (category_name, min_depth, max_depth)
VALUES 
('Shallow', 0, 70), 
('Intermediate', 70, 300), 
('Deep', 300, 700); 

-- depth table: depth value and reference to depth category 
CREATE TABLE Depth (
    id SERIAL PRIMARY KEY, 
    value FLOAT NOT NULL, 
    depth_category_id INTEGER REFERENCES DepthCategory(id)
);

-- SeismicData table that contains all relevant data associated to one seismic event
CREATE TABLE SeismicData (
    id SERIAL PRIMARY KEY, 
    timestamp TIMESTAMP,
    magnitude FLOAT,
    depth_id INTEGER REFERENCES Depth(id), 
    location_id INTEGER REFERENCES Location(id), 
    additional_metadata TEXT
); 

