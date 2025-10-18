--1. How many total records exist in the dataset?
select count(*) as Total_Records
from AirQuality


--2. What is the time period covered by the dataset (first and last date)?
select max(Time) as Start_Period, min(Time) as End_Period
from AirQuality


--3. How many measurements were recorded each day?
select Date, count(*) as Num_of_Measurements
from AirQuality
group by Date
order by Date


--4. What is the average carbon monoxide (CO) level by hour of the day?
select datepart(hour,Time) AS Hours, avg(CO_GT) as Avg_CO_GT
from AirQuality
group by datepart(hour,Time)
order by Hours


--5. What is the average nitrogen oxides (NOx) level by day period (morning, afternoon, evening, night)?
select case
      when datepart(hour,Time) between 6 and 11 then 'Morning'
	  when datepart(hour,Time) between 12 and 17 then 'Afternoon'
	  when datepart(hour,Time) between 18 and 23 then 'Evening'
	  Else 'Night'
	  end as DayPeriod,
	  AVG(NOx_GT) AS Avg_NOx
from AirQuality
group by case 
         when datepart(hour,Time) between 6 and 11 then 'Morning'
	     when datepart(hour,Time) between 12 and 17 then 'Afternoon'
	     when datepart(hour,Time) between 18 and 23 then 'Evening'
	     Else 'Night'
         END
order by Avg_NOx desc


--6. At what hour of the day is nitrogen dioxide (NO₂) at its highest?
select top 1 datepart(hour,Time) as Hours, max(NO2_GT) as Highest_NO2_GT
from AirQuality
group by datepart(hour,Time)
order by max(NO2_GT) desc
--OR--
select datepart(hour,Time) as Hours, NO2_GT
from AirQuality
where NO2_GT = (select max(NO2_GT) from AirQuality)


--Temperature & Humidity Queries
--7. What is the average ozone (O₃) level at different temperature ranges?
select avg(PT08_S5_O3) as Avg_O3, round(T,0) as Temperature
from AirQuality
group by round(T,0)
having round(T,0)is not null
order by Avg_O3 desc


--8. What is the average carbon monoxide (CO) level at different humidity levels?
select avg(CO_GT) as Avg_CO_GT, round(RH,0) as Humidity
from AirQuality
group by round(RH,0)
order by Avg_CO_GT desc


--9. Which 5 days had the highest average temperature, and what was the average ozone on those days?
select top 5 Date, avg(T) as Temperature, avg(PT08_S5_O3) as Avg_O3
from AirQuality
group by Date
order by Avg_O3 desc


--Gas-Specific Queries
--10. What are the average benzene (C6H6) levels across the hours of the day?
select datepart(hour,Time) as Hours, avg(C6H6_GT) as Avg_C6H6_GT
from AirQuality
group by datepart(hour,Time)
order by Avg_C6H6_GT desc


--11. What are the average ozone (O₃) levels across the hours of the day?
select datepart(hour,Time) as Hours, avg(PT08_S5_O3) as Avg_O3
from AirQuality
group by datepart(hour,Time)
order by Avg_O3 desc


--12. Which 3 days had the highest average CO levels?
select top 3 Date, avg(CO_GT) as Avg_CO_GT
from AirQuality
group by Date
order by Avg_CO_GT desc


--13. Which 3 days had the lowest average NOx levels?
select top 3 Date, avg(NOx_GT) as Avg_NOx_GT
from AirQuality
group by Date
having avg(NOx_GT) is not null
order by Avg_NOx_GT


--Comparative / Insight Queries
--14. How do benzene (C6H6) levels in the morning (7–9 AM) compare to the evening (7–9 PM)?
select 'Morning' as Period, 
       avg(C6H6_GT) as Avg_Benzene
from AirQuality
where datepart(hour, Time) BETWEEN 7 AND 9
UNION ALL
select 'Evening' AS Period, 
       avg(C6H6_GT) as Avg_Benzene
from AirQuality
where datepart(hour, Time) BETWEEN 19 AND 21


--15. What is the relationship between temperature and the main pollutants (CO, NOx, O₃)?
select ROUND(T,0) AS Temperature, 
       avg(CO_GT) AS Avg_CO,
       avg(NOx_GT) AS Avg_NOx,
       avg(PT08_S5_O3) AS Avg_Ozone
from AirQuality
group by ROUND(T,0)
order by Temperature