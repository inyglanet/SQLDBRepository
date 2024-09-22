CREATE DATABASE techshop;

CREATE TABLE Customers(
Customer_id INT PRIMARY KEY,
Firstname VARCHAR(40),
Lastname VARCHAR(40),
Email VARCHAR(30),
Phone BIGINT,
Address VARCHAR(40),
);

CREATE TABLE Products(
Product_id INT PRIMARY KEY,
ProductName VARCHAR(30),
Description VARCHAR(50),
Price BIGINT,
);

CREATE TABLE Orders(
Order_id INT PRIMARY KEY,
Customer_id INT,
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id),
OrderDate DATETIME,
TotalAmount BIGINT,
);

CREATE TABLE OrderDetails(
OrderDetailId INT PRIMARY KEY,
Order_id INT,
FOREIGN KEY (Order_id) REFERENCES Orders(Order_id),
Product_id INT,
FOREIGN KEY (Product_id) REFERENCES Products(Product_id),
Quantity Int, 
);

CREATE TABLE Inventory(
Inventory_id INT PRIMARY KEY,
Product_id INT,
FOREIGN KEY (Product_id) REFERENCES Products(Product_id),
QuantityInStock INT,
LastStockUpdated DATETIME,
);


INSERT INTO Customers (Customer_id,Firstname,Lastname,Email,Phone,Address) VALUES
(10,'John','Smith','johnsmith@gmail.com','94514683365','10A,Princep street,Kolkatta'),
(20 ,'Mary','Brown','marybron@gmail.com','9123876451','1,RamaKrishna Nagar,Mumbai'),
(30,'James','Davis','jamesdavis@gmail.com','9812345672','7,Hill Erest,Mumbai'),
(40,'Nancy','Davis','nancydavis@gmail.com','9871234563','7,Hill Road,Mumbai'),
(50,'Sarah','Jones','sarahjones@gmail.com','9876123454','9B,Sharma Complex,Bangalore'),
(60,'Thomas','Williams','thomasilliams@gmail.com','9876512345','6/a,Lala road,Chennai'),
(70,'Jane','Clark','janeclark@gmail.com','9876541236','109,Kazhi street,Chennai'),
(80,'Adam','Miller','adammiller@gmail.com','9876543127','unit no 105b,Andheri,Maharastra'),
(90,'Charles','Wilson','charleswilson@gmail.com','9876543218','804,Gandhi street,Hydrabad'),
(100,'Monica','Geller','monicageller@gmail.com','9876543210','5,Greems road,Chennai');

INSERT INTO Products(Product_id,ProductName,Description,Price) VALUES
(410,'Fitness Tracker','Monitors activity,heart rate',500),
(411,'Earbuds','Bluetooth enabled earphones',1200),
(412,'Powerbank','Compact charger for on-the-go devices',900),
(413,'Camera','Captures moments',4500),
(414,'Digital photo frame','Display rotating photos',700),
(415,'VR Headset','Reality gaming experrience',35000),
(416,'Alexa','Central control for smart devices',2000),
(417,'Smart termostat','Ajust home tempatature for energy saving',859),
(418,'Laptop','On-the-go compact computer',47000),
(419,'Mini projector','Theatre experience at home',7000);
 

INSERT INTO Orders(Order_id,Customer_id,OrderDate,TotalAmount) VALUES 
(1,10,GETDATE(),1500),
(2,20,GETDATE(),2400),
(3,30,GETDATE(),2700),
(4,40,GETDATE(),4500),
(5,50,GETDATE(),2100),
(6,60,GETDATE(),35000),
(7,70,GETDATE(),10000),
(8,80,GETDATE(),1718),
(9,90,GETDATE(),47000),
(10,100,GETDATE(),21000);


INSERT INTO OrderDetails(OrderDetailId,Order_id,Product_id,Quantity) VALUES
(3002,1,410,3),
(3003,2,411,2),
(3004,3,412,4),
(3005,4,413,1),
(3006,5,414,3),
(3007,6,415,1),
(3008,7,416,5),
(3009,8,417,2),
(3010,9,418,1),
(3011,10,419,3);


INSERT INTO Inventory(Inventory_id,Product_id,QuantityInStock,LastStockUpdated) VALUES
(100801,410,8,GETDATE()),
(100802,411,9,GETDATE()),
(100803,412,7,GETDATE()),
(100804,413,4,GETDATE()),
(100805,414,10,GETDATE()),
(100806,415,16,GETDATE()),
(100807,416,30,GETDATE()),
(100808,417,21,GETDATE()),
(100809,418,2,GETDATE()),
(100810,419,5,GETDATE());

SELECT * FROM Customers;
SELECT* FROM Products;
SELECT* FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Inventory;

