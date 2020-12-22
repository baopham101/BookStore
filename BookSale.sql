CREATE TABLE tblRole (
	RoleID int PRIMARY KEY,
	RoleName nvarchar(50) NOT NULL
)

CREATE TABLE tblUsers (
	UserID nvarchar(50) PRIMARY KEY,
	Names nvarchar(50) NOT NULL,
	Adress nvarchar(50) NOT NULL,
	PhoneNumber nvarchar(50) NOT NULL,
	Email nvarchar(50) NOT NULL,
	Passwords nvarchar(255) NOT NULL,
	RoleID int FOREIGN KEY REFERENCES tblRole(RoleID)
)
CREATE TABLE tblProducts (
	ProductID int IDENTITY(1,1) PRIMARY KEY,
	ProductName nvarchar(50) NOT NULL,
	Images nvarchar(50) NOT NULL,
	Price float CHECK(Price >= 0) NOT NULL,
	Quantity int CHECK(Quantity >= 0) NOT NULL,
	Statuss bit,
	CreateDate date
)
CREATE TABLE tblOrder (
	OrderID int IDENTITY(1,1) PRIMARY KEY,
	Names nvarchar(50) NULL,
	Addresss nvarchar(100) NULL,
	PhoneNumber nvarchar(50) NULL,
	Email nvarchar(50) NULL,
	CreateDate datetime,
	TotalPrice float,
	UserID nvarchar(50) FOREIGN KEY REFERENCES tblUsers(UserID) NULL
)
CREATE TABLE tblOrderDetail (
	OrderDetailID int IDENTITY(1,1) PRIMARY KEY,
	Price float,
	Quantity int,
	OrderID int FOREIGN KEY REFERENCES tblOrder(OrderID),
	ProductID int FOREIGN KEY REFERENCES tblProducts(ProductID)
)

DROP TABLE tblOrderDetail, tblOrder

INSERT INTO dbo.tblRole
(
    RoleID,
    RoleName
)
VALUES
(
    2, -- RoleID - int
    N'user' -- RoleName - nvarchar
)

INSERT INTO dbo.tblRole
(
    RoleID,
    RoleName
)
VALUES
(
    1, -- RoleID - int
    N'admin' -- RoleName - nvarchar
)


INSERT INTO dbo.tblUsers
(
    UserID,
    [Names],
    Adress,
    PhoneNumber,
    Email,
    Passwords,
    RoleID
)
VALUES
(
    N'baopham', -- UserID - nvarchar
    N'Bao Pham', -- Names - nvarchar
    N'test', -- Adress - nvarchar
    N'0763936805', -- PhoneNumber - nvarchar
    N'baopham101@gmail.com', -- Email - nvarchar
    N'123', -- Passwords - nvarchar
    2 -- RoleID - int
)

INSERT INTO dbo.tblProducts
(
    --ProductID - column value is auto-generated
    ProductName,
    Images,
    Price,
    Quantity,
    Statuss,
    CreateDate
)
VALUES
(
    -- ProductID - int
    N'', -- ProductName - nvarchar
    N'', -- Images - nvarchar
    0.0, -- Price - float
    0, -- Quantity - int
    0, -- Statuss - bit
    NULL -- CreateDate - date
)
