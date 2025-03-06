use Blinkit
select * from blinkit_data
select count(*) as total from blinkit_data

update blinkit_data
set Item_Fat_Content =
case when Item_Fat_Content in('LF','low fat') then 'Low fat'
when Item_Fat_Content ='reg' then 'Regular' else Item_Fat_Content end

select distinct Item_Fat_Content from blinkit_data

select sum(Total_Sales) as Total_sales from blinkit_data

select cast(sum(Total_Sales/1000000) as decimal(10,2)) as  total_sales_millions from blinkit_data


select cast(avg(Total_sales) as decimal(10,0)) as Avg_sales from blinkit_data

select count(Item_Type) as 'No.items' from blinkit_data

select cast(sum(Total_Sales/1000000) as decimal(10,2)) as  Low_fat from blinkit_data
where Item_Fat_Content='Low fat'

select count(*) as Est_in_2022 from blinkit_data
where Outlet_Establishment_Year=2022

select cast(avg(Rating) as decimal(10,2)) as avg_rating from blinkit_data

select Item_Fat_Content, 

cast(sum(Total_Sales/1000000) as decimal(10,2)) as  total_sales_millions,
cast(avg(Total_sales) as decimal(10,0)) as Avg_sales,
sum(Total_Sales) as Total_sales,
count(Item_Type) as 'No.items'

from blinkit_data 
group by Item_Fat_Content

select Item_Type, 
cast(sum(Total_Sales) as decimal(10,2)) as  total_sales,
cast(avg(Total_sales) as decimal(10,1)) as Avg_sales,
count(Item_Type) as 'No.items',
cast(avg(Rating) as decimal(10,2)) as avg_rating 

from blinkit_data 
group by Item_Type
order by avg_rating desc

select Item_Fat_Content,Outlet_Location_Type,
cast(sum(Total_Sales) as decimal(10,2)) as  total_sales


from blinkit_data 
group by  Item_Fat_Content,Outlet_Location_Type

select Outlet_Establishment_Year,
cast(sum(Total_Sales) as decimal(10,2)) as  total_sales


from blinkit_data 
group by Outlet_Establishment_Year
order by Outlet_Establishment_Year asc

SELECT 
    Outlet_Size, 
    CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
    CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;



SELECT Outlet_Location_Type, CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC

SELECT Outlet_Type, 
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG(Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
		COUNT(*) AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating
		
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC

