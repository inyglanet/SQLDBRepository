
SELECT Firstname,Lastname, Email FROM Customers;


SELECT c.Firstname , c.Lastname , o.OrderDate FROM Customers c JOIN Orders o ON o.Customer_id = c.Customer_id;


INSERT INTO Customers(Customer_id,Firstname,Lastname,Email,Phone,Address) VALUES
(110,'Mathew','Bing','mathewbing@gmail.com','901234567','53,Krishna Nagar,Chennai');
 SELECT * FROM Customers;

UPDATE Products SET Price= Price *1.10;
SELECT Price FROM Products;


DELETE FROM OrderDetails WHERE Order_id=3;
DELETE FROM Orders WHERE Order_id=3;

SELECT * FROM Orders ;
SELECT * FROM OrderDetails ;


INSERT INTO Orders(Order_id,Customer_id,OrderDate,TotalAmount) VALUES
(11,110,GETDATE(),3000);
SELECT * FROM Orders;


UPDATE Customers SET Email= 'adam2miller@gmail.com', Address='62,King street ,Chennai' WHERE Customer_id=80;
SELECT * FROM Customers;



DELETE FROM OrderDetails WHERE Order_id in (SELECT Order_id FROM Orders where Customer_id=50);
DELETE FROM Orders WHERE Customer_id=50;
SELECT * FROM Orders ;
SELECT * FROM OrderDetails ;

INSERT INTO Products(Product_id,ProductName,Description,Price) VALUES
(420,'Polaroid Camera','Instant memory on physical firm',5000);
SELECT * FROM Products;
