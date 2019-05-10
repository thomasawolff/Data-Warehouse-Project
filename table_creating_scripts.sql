CREATE TABLE [dbo].[order_product_quantity](
	[order_ID] [float] NOT NULL,
	[product_num] [nvarchar](255) NOT NULL,
	[quantity_ordered] [float] NULL)

	alter table order_product_quantity
	alter column order_ID float not null
	add primary key(order_ID)

	alter table order_product_quantity
	add constraint product_order_fk_2 
	foreign key(product_num) 
	references product_table(product_num)

	alter table order_product_quantity
	add constraint warehouse_order_fk2 
	foreign key(warehouse_ID) 
	references warehouse_order_status(warehouse_ID)

CREATE TABLE [dbo].[product_table](
	[product_num] [nvarchar](255) NOT NULL,
	[vendor_num] [nvarchar](255) NULL,
	[product_type] [nvarchar](255) NULL,
	[description] [nvarchar](255) NULL)

	alter table product_table
	alter column product_num nvarchar(255) not null
	add primary key(product_num)

CREATE TABLE [dbo].[retail_Inventory](
	[store_num] [float] NOT NULL,
	[prod_num] [nvarchar](255) NOT NULL,
	[prod_quantity] [float] NULL,
	[min_order_quantity] [float] NULL)

	alter table retail_inventory
	alter column store_num float not null
	alter column prod_num nvarchar(255) not null
	add primary key(store_num,prod_num)

	alter table retail inventory
	add constraint inventory_product_fk 
	foreign key (prod_num) 
	references product_table(prod_num)

	alter table retail_inventory
	add constraint retail_inventory_fk
	foreign key (store_num)
	references retail_store(store_num)


CREATE TABLE [dbo].[retail_order_quantity](
	[product_num] [nvarchar](255) NULL,
	[quantity] [float] NULL,
	[retail_order_ID] [int] IDENTITY(1,1) NOT NULL)

	alter table retail_order_quantity
	alter column product_num nvarchar(255) not null
	alter column retail_order_ID int not null
	add primary key (product_num, retail_order_ID)

	alter table retail_order_quantity
	add constraint retail_order_fk 
	foreign key (retail_order_ID)
	references retail_product_order(retail_order_ID)

	alter table retail_order_quantity
	add constraint vendor_order_fk2 
	foreign key (product_num)
	references product_table(product_num)

CREATE TABLE [dbo].[retail_order_shipping](
	[Shipping_ID] [int] NOT NULL,
	[retail_order_ID] [int] NULL,
	[warehouse_ID] [float] NULL,
	[product shipped] [datetime] NULL)

	alter table retail_order_shipping
	alter column shipping_ID int not null
	add primary key(shipping_ID)

	alter table retail_order_shipping
	add constraint retail_product_fk
	foreign key (retail_order_ID)
	references retail_product_order(retail_order_ID)

CREATE TABLE [dbo].[retail_product_order](
	[retail_order_ID] [int] NOT NULL,
	[store_num] [float] NULL,
	[warehouse_ID] [float] NULL,
	[date_of_order] [datetime] NULL)

	alter table retail_product_order
	alter column retail_order_ID int not null
	add primary key retail_order_id

	alter table retail_product_order
	add constraint store_num_fk
	foreign key (store_num)
	references retail_store(store_num)

	alter table retail_product_order
	add constraint warehouse_fk_4
	foreign key (warehouse_ID)
	references warehouse(warehouse_ID)

CREATE TABLE [dbo].[retail_store](
	[store_num] [float] NOT NULL,
	[phone_num] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[state] [nvarchar](255) NULL,
	[region] [varchar](255) NULL)

	alter table retail_store
	alter column store_num float not null
	add primary key(store_num)

CREATE TABLE [dbo].[shop_order](
	[order_num] [int] NOT NULL,
	[shopper_num] [float] NOT NULL,
	[store_num] [float] NOT NULL)

	alter table shop_order
	alter column order_num int not null
	alter column shopper_num float not null
	alter column store_num float not null
	add primary key (order_num,shopper_num,store_num)

	alter table shop_order
	add constraint orders_foreign_key2
	foreign key (order_num)
	references shopper_product_quantity(order_num)

	alter table shop_order
	add constraint shoppers_foreign_key2
	foreign key (shopper_num)
	references shoppers(shopper_num)

	alter table shop_order
	add constraint store_num
	foreign key (store_num)
	references retail_store(store_num)

CREATE TABLE [dbo].[shopper_product_quantity](
	[order_num] [int] NOT NULL,
	[product_num] [nvarchar](255) NULL,
	[quantity_bought] [float] NULL)

	alter table shopper_product_quantity
	alter table order_num int not null
	add primary key (order_num)

	alter table shopper_product_quantity
	add constraint shopper_product_fk
	foreign key (product_num)
	references product_table(product_num)

CREATE TABLE [dbo].[shoppers](
	[shopper_num] [float] NOT NULL)

	alter table shoppers
	alter column shopper_num float not null
	add primary key (shopper_num)

CREATE TABLE [dbo].[warehouse_inventory](
	[warehouse_ID] [float] NOT NULL,
	[prod_num] [nvarchar](255) NOT NULL,
	[product quantity] [float] NULL,
	[min_order_quantity] [float] NULL)

	alter table warehouse_inventory
	alter column warehouse_ID float not null
	alter column prod_num nvarchar(255) not null
	add primary key (warehouse_ID, prod_num)

	alter table warehouse_inventory
	add constraint product_num3
	foreign key (prod_num)
	references product_table(product_num)

	alter table warehouse_inventory
	add constraint warehouse_ID_fk3
	foreign key (warehouse_ID)
	references warehouse(warehouse_ID)

CREATE TABLE [dbo].[warehouse_order_status](
	[order_ID] [float] NOT NULL,
	[warehouse_ID] [float] NULL,
	[date_received] [datetime] NULL,
	[date_inspected] [datetime] NULL,
	[date_passed] [datetime] NULL,
	[authorized_to_sell] [datetime] NULL,
	[product_boxed] [datetime] NULL
	[placed_in_inventory] [datetime] NULL)

	alter table warehouse_order_status
	alter column order_ID float not null
	add primary key (order_ID)

	alter table warehouse_order_status
	add constraint warehouse_ID_fk_5
	foreign key (warehouse_ID)
	references warehouse(warehouse_ID)











