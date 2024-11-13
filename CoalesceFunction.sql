-------------- COALESCE Function -------

/*
In T-SQL, COALESCE is a function that returns the first non-null expression from a list of expressions.
It's useful for handling NULL values by providing a default when encountering NULL.
*/

CREATE TABLE Vendors(
	VendorId int primary key,
	VendorName varchar(50),
	Yearly money,
	HalfYearly money,
	Quaterly money,
	Monthly money
)

INSERT INTO Vendors(VendorId,VendorName,Yearly,HalfYearly,Quaterly,Monthly)values
(1,'xyz company',20000,NULL,NULL,NULL),
(2,'abc express',NULL,10000,NULL,NULL),
(3,'door step delivery',NULL,NULL,6000,NULL),
(4,'tcl telecom',NULL,NULL,NULL,1200)

Select * From Vendors

Select coalesce(null,10)

Select coalesce(null,10,100)

Select VendorId, VendorName, Coalesce(Yearly,HalfYearly*2,Quaterly*4,Monthly*12) As Rate
From Vendors