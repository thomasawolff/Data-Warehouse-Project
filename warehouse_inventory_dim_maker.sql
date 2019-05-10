
use [Data Marts]

  SELECT s.[warehouse_ID] as 'Warehouse ID'
      ,[order_ID] as 'Order number'
	  ,t.product_num as 'Product number'
      ,t.quantities as 'Quantity Ordered'
      ,datediff(day,[date_received],[date_inspected]) as 'Time to inspected'
	  ,datediff(day,[date_inspected],[date_passed]) as 'Time to passed'
	  ,datediff(day,[date_passed],[authorized_to_sell]) as 'Time to authorized'
	  ,datediff(day,[authorized_to_sell],[product_boxed]) as 'Time to boxed'
	  ,datediff(day,[product_boxed],[placed_in_inventory]) as 'Time to inventory'
	  ,i.[product quantity] as [Product Quantity]
	  ,i.min_order_quantity as [Minimum Order Quantity] into warehouse_fact_table
  FROM [Data_Warehouse_Project].[dbo].[warehouse_order_status] s
  inner join [Data_Warehouse_Project].[dbo].order_product_quantity t
  on s.order_ID = t.order_num
  inner join [Data_Warehouse_Project].[dbo].product_table p
  on p.product_num = t.product_num
  inner join [Data_Warehouse_Project].[dbo].[warehouse_inventory] i
  on i.warehouse_ID = s.warehouse_ID
  and i.prod_num = p.product_num


  alter table [Data Marts].[dbo].[warehouse_fact_table_2]
  add primary key([warehouse ID],[order number],[product number])

