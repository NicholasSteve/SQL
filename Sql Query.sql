--- Maximun Quantity Sold
select 
max(Quantity)
, count(*)
from orderdetails;

--- Unique products in all the transaction
select distinct
ProductID, Quantity
from orderdetails
where Quantity = 3
order by ProductID asc, Quantity desc;

--- Unique Properties
select distinct
PropertyID
from orderdetails;

--- product catagory that has maximum products
select
ProductCategory
, count(*) as COUNT
from products
group by ProductCategory
order by 2 desc;

--- The Location of the most stores
select
PropertyState
, count(*) as COUNT
from propertyinfo
group by PropertyState
order by 2 desc;

--- top 10 product id that did maximum sales
select 
ProductID
, sum(Quantity) as Total_Quantity
from orderdetails
group by ProductID
order by 2 desc
limit 10;


--- top 10 property id that did maximum quantity
select 
 PropertyID
, sum(Quantity) as Total_Quantity
from orderdetails
group by PropertyID
order by 2 desc
limit 10;

--- top 10 product names that did maximum sales in Quantity
select 
o.*
, p.ProductName
, p.ProductCategory
, p.Price
from orderdetails as o
left join products as p on o.ProductID = p.ProductID;


select 
p.ProductName
, sum(Quantity) as Total_Quantity
from orderdetails as o
left join products as p on o.ProductID = p.ProductID
group by p.ProductName
order by 2 desc
limit 10;

--- top 5 products that did maximum sales
select
p.ProductName
, sum(o.Quantity * p.Price) as Sale
from orderdetails as o
left join products as p on o.ProductID = p.ProductID
group by ProductName
order by 2 desc
limit 5;

--- Top 5 cities that have maximum sales
select 
 pi.PropertyCity
, sum(o.Quantity * p.Price) as Sales 
from orderdetails as o
left join products as p on o.ProductID = p.ProductID
left join propertyinfo as pi on o.PropertyID = pi.`Prop ID`
group by pi.PropertyCity
order by Sales desc
LIMIT 5;

--- Top 5 products in each of the cities
--- 'Arlington'
select 
 pi.PropertyCity
, ProductName
, sum(o.Quantity * p.Price) as Sales 
from orderdetails as o
left join products as p on o.ProductID = p.ProductID
left join propertyinfo as pi on o.PropertyID = pi.`Prop ID`
where pi.PropertyCity = 'Arlington'
group by pi.PropertyCity, ProductName
order by Sales desc
limit 5;


