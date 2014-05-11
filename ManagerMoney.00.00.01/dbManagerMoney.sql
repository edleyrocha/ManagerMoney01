CREATE DATABASE moneyManagerDB
GO
USE moneyManagerDB
-- drop database  moneyManagerDB
GO
-- TABLE USER

GO
CREATE TABLE tblGroup(
	groupID INT IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(200)
)
GO
INSERT INTO tblGroup VALUES('tdt')
GO
CREATE TABLE tblUser(
	userID INT IDENTITY(1,1) PRIMARY KEY,
	groupID INT NULL,
	name NVARCHAR(100) NOT NULL,
	username VARCHAR(20) UNIQUE NOT NULL,
	pwd VARCHAR(100) NOT NULL,
	permission BIT DEFAULT 0,
	CONSTRAINT FK_USER_GROUP FOREIGN KEY (groupID) REFERENCES tblGroup(groupID)
)
GO
INSERT INTO tblUser VALUES(1,'Hoang Anh Tuan','ad', 'asd',1)
INSERT INTO tblUser VALUES(1,'Dao Kien Cuong','cuongdk', 'asd',0)
INSERT INTO tblUser VALUES(1,'Tran Duc Tung','tungtd', 'asd',0)
select * from tblUser
GO
--TABLE CATEGORIZE product
CREATE TABLE tblCategorize(
	cateID INT IDENTITY(1,1) PRIMARY KEY,
	cateName VARCHAR(100) NOT NULL,
	cateDes NTEXT NULL,
)
GO
INSERT INTO tblCategorize VALUES('rau','')
INSERT INTO tblCategorize VALUES('cu','')
INSERT INTO tblCategorize VALUES('qua','')
INSERT INTO tblCategorize VALUES('thit','')
INSERT INTO tblCategorize VALUES('nuoc ngot','')
GO
--TABLE PRODUCT
CREATE TABLE tblProduct(
	productID INT IDENTITY PRIMARY KEY,
	productName NVARCHAR(100) NOT NULL,
	cateID INT default 1 NULL,
	productDes NTEXT NULL,
	CONSTRAINT FK_product_cateorize FOREIGN KEY (cateID) REFERENCES tblCategorize(cateID)
)
GO
insert into tblProduct values('rau muong',2,'')
insert into tblProduct values('khoai tay',2,'')
insert into tblProduct values('ca chua',3,'')
insert into tblProduct values('thit ga',4,'')
GO
--TABLE TOTAL AMOUNT DETAIL
CREATE TABLE tblBillDetail(
	bill_detail_ID INT IDENTITY(1,1) PRIMARY KEY,
	productID INT NOT NULL,
	userID INT NOT NULL,
	productUnit VARCHAR(100) NOT NULL,
	price FLOAT NOT NULL,
	dateBuy DATETIME NOT NULL,
	CONSTRAINT FK_TOTAL_PPRODUCT FOREIGN KEY (productID) REFERENCES tblProduct(productID),
	CONSTRAINT FK_TOTAL_USER  FOREIGN KEY (userID) REFERENCES tblUser(userID)
)
GO
insert into tblBillDetail values(1,1,'1',5000,GETDATE())
GO
-- TABLE TOTAL AMOUNT / MOTH

CREATE TABLE tblBill(
	bill_ID INT IDENTITY(1,1) PRIMARY KEY,
	bill_detail_ID INT NOT NULL,
	totalAmount FLOAT NOT NULL,
	CONSTRAINT FK_TOTAL_DETAIL FOREIGN KEY (bill_ID) REFERENCES tblBillDetail(bill_detail_ID)
)
GO
-- proc
CREATE PROC checkLogin(@user VARCHAR(50), @pass VARCHAR(100))
AS
BEGIN
	SELECT * FROM tblUser WHERE username = @user AND pwd=@pass
END
GO
--drop proc viewProductPurchased
create proc viewProductPurchased
as
begin
	select tblUser.userID, tblUser.name, tblProduct.cateID,  
	tblCategorize.cateName, tblProduct.productID, tblProduct.productName, 
	tblProduct.productDes, tblBillDetail.bill_detail_ID, tblBillDetail.productUnit, tblBillDetail.price, tblBillDetail.DATEBUY
	from tblUser, tblCategorize, tblProduct, tblBillDetail
	 where tblCategorize.cateID = tblProduct.cateID 
	 and tblBillDetail.productID = tblProduct.productID
	and tblUser.userID = tblBillDetail.userID
end
GO
-- drop proc addBill 
create proc addBill(
@userID int, @productID int,
 @unit varchar(50), @price float
 )
 as
 begin
 insert into tblBillDetail values(@productID, @userID, @unit, @price,GETDATE() )
 end
 go
 exec addBill 1,1,'11',500
 go

 select * from tblBillDetail