create database TransportManagementSystems;

-- Create Vehicles Table
CREATE TABLE Vehicles (
    VehicleID INT IDENTITY(1,1) PRIMARY KEY,
    Model VARCHAR(255),
    Capacity DECIMAL(10, 2),
    Type VARCHAR(50),  -- (Truck, Van, Bus)
    Status VARCHAR(50) -- (Available, On Trip, Maintenance)
);

-- Create Routes Table
CREATE TABLE Routes (
    RouteID INT IDENTITY(1,1) PRIMARY KEY,
    StartDestination VARCHAR(255),
    EndDestination VARCHAR(255),
    Distance DECIMAL(10, 2)
);

-- Create Passengers Table
CREATE TABLE Passengers (
    PassengerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(255),
    Gender VARCHAR(50),
    Age INT,
    Email VARCHAR(255) UNIQUE,
    PhoneNumber VARCHAR(50)
);

-- Create Drivers Table
CREATE TABLE Drivers (
    DriverID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    LicenseNumber VARCHAR(255) UNIQUE,
    PhoneNumber VARCHAR(50),
    Status VARCHAR(50)  -- (Available, On Trip, Inactive)
);

-- Create Trips Table
CREATE TABLE Trips (
    TripID INT IDENTITY(1,1) PRIMARY KEY,
    VehicleID INT FOREIGN KEY REFERENCES Vehicles(VehicleID),
    RouteID INT FOREIGN KEY REFERENCES Routes(RouteID),
    DepartureDate DATETIME,
    ArrivalDate DATETIME,
    Status VARCHAR(50),  -- (Scheduled, In Progress, Completed, Cancelled)
    TripType VARCHAR(50) DEFAULT 'Freight',  -- (Freight, Passenger)
    MaxPassengers INT
);

-- Create TripDrivers Table
CREATE TABLE TripDrivers (
    TripID INT,
    DriverID INT,
    PRIMARY KEY (TripID, DriverID),
    FOREIGN KEY (TripID) REFERENCES Trips(TripID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

-- Create Bookings Table
CREATE TABLE Bookings (
    BookingID INT IDENTITY(1,1) PRIMARY KEY,
    TripID INT FOREIGN KEY REFERENCES Trips(TripID),
    PassengerID INT FOREIGN KEY REFERENCES Passengers(PassengerID),
    BookingDate DATETIME DEFAULT GETDATE(),
    Status VARCHAR(50)  -- (Confirmed, Cancelled, Completed)
);

-- 1. Add a New Vehicle
INSERT INTO Vehicles (Model, Capacity, Type, Status) 
VALUES ('ModelX', 20.0, 'Bus', 'Available');

-- 2. Add a Route
INSERT INTO Routes (StartDestination, EndDestination, Distance)
VALUES ('City A', 'City B', 150.0); -- Add a route for the trip

-- 3. Add a Passenger
INSERT INTO Passengers (FirstName, Gender, Age, Email, PhoneNumber)
VALUES ('John', 'Male', 30, 'john@example.com', '1234567890'); -- Add a passenger

-- 4. Add a Driver
INSERT INTO Drivers (FirstName, LastName, LicenseNumber, PhoneNumber, Status)
VALUES ('Alice', 'Smith', 'L123456', '0987654321', 'Available'); -- Add a driver

-- 5. Schedule a Trip
INSERT INTO Trips (VehicleID, RouteID, DepartureDate, ArrivalDate, Status, TripType, MaxPassengers)
VALUES (1, 1, '2024-09-30 09:00:00', '2024-09-30 12:00:00', 'Scheduled', 'Freight', 10);

-- 6. Book a Trip
INSERT INTO Bookings (TripID, PassengerID, BookingDate, Status)
VALUES (1, 1, GETDATE(), 'Confirmed');  -- Example values

-- 7. If needed, you can allocate a driver to a trip after confirming the trip
INSERT INTO TripDrivers (TripID, DriverID)
VALUES (1, 1);  -- Allocate DriverID 1 to TripID 1

-- 8. Optionally, you can check the current state of the tables
-- Get Bookings by Passenger
SELECT *
FROM Bookings;

-- Get Bookings by Trip
SELECT *
FROM Bookings WHERE TripID = 1;

-- Get Available Drivers
SELECT *
FROM Drivers
WHERE DriverID NOT IN (SELECT DriverID FROM TripDrivers);  -- Retrieve drivers not allocated to any trip
-- Get Available Drivers
SELECT * FROM Drivers
WHERE Status = 'Available';