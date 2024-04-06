-- List all tables 
\dt 

-- Display the structure of each table
\d Location 
\d DepthCategory 
\d Depth 
\d SeismicData 

-- Check initial data in DepthCategory, return rows inserted 
SELECT * FROM DepthCategory; 

-- Insert test data into Location 
INSERT INTO Location (latitude, longitude, location_name) 
VALUES (40.7128, -74.0090, 'New York'); 

-- Retrieve Data 
SELECT * FROM Location; 

-- Test relationships
INSERT INTO Depth (value, depth_category_id) 
VALUES (50, 1); 

SELECT * FROM Depth; 

-- Query across table to ensure relaitonships
-- Join with location to retrieve seismic events and locations
INSERT INTO SeismicData (timestamp, magnitude, depth_id, location_id, additional_metadata) VALUES ('2023-01-01 00:00:00', 5.5, 1, 1, 'Sample data');
SELECT * FROM SeismicData JOIN Location ON SeismicData.location_id = Location.id;

-- Delete data
DELETE FROM SeismicData; 
DELETE FROM Depth; 
DELETE FROM Location; 

ALTER SEQUENCE location_id_seq RESTART WITH 1;
ALTER SEQUENCE depth_id_seq RESTART WITH 1;
ALTER SEQUENCE seismicdata_id_seq RESTART WITH 1;

-- Check data empty 
SELECT * FROM Location;
SELECT * FROM Depth;
SELECT * FROM DepthCategory;
SELECT * FROM SeismicData;
