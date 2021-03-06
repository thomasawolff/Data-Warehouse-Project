/****** Script for SelectTopNRows command from SSMS  ******/
use [Data Marts]

select w.[Store number],dt.Region,(dt.levels) as [Low levels],
f.[Product number],p.[Product type],p.[Description]
from [retail store dimension] w
inner join (SELECT min([Product inventory]-[Minimum order quantity]) as levels,t.Region
			  FROM [Data Marts].[dbo].[retail inventory fact table] s
			  inner join [retail store dimension] t
			  on s.[Store number] = t.[Store number]
			  group by t.Region) dt
  on w.Region = dt.Region 
  inner join [retail inventory fact table] f
  on f.[Store number] = w.[Store number]
  and (f.[Product inventory]-f.[Minimum order quantity]) = dt.levels
  inner join [product dimension] p
  on p.[Product number] = f.[Product number]
  group by w.[store number],dt.Region,dt.levels,
  f.[Product number],p.[Product type],p.[Description]
  order by 2