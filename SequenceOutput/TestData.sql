CREATE TABLE [dbo].[tbl_SalesData](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[DailySales] [int] NULL,
	[Region] [varchar](50) NULL
) ON [PRIMARY]
GO

--------------------------------------------------------------------------------------------------------------------------------

INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'11-06-23',5), 5000, 'Brazil')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'31-05-23',5), 3500, 'India')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'01-06-23',5), 4000, 'UK')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'10-06-23',5), 1000, 'UK')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'03-06-23',5), 2000, 'Australia')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'06-06-23',5), 7000, 'USA')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'03-06-23',5), 500, 'UK')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'10-06-23',5), 1500, 'UK')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'04-06-23',5), 6500, 'USA')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'05-06-23',5), 5000, 'Australia')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'07-06-23',5), 8000, 'India')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'04-06-23',5), 2000, 'Canada')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'31-05-23',5), 2000, 'Brazil')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'30-05-23',5), 5000, 'India')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'30-05-23',5), 6000, 'Australia')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'26-05-23',5), 2600, 'India')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'26-05-23',5), 2200, 'USA')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'26-05-23',5), 3700, 'India')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'31-05-23',5), 8800, 'Brazil')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'21-05-23',5), 2100, 'UK')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'23-05-23',5), 6800, 'Australia')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'23-05-23',5), 4400, 'India')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'22-05-23',5), 5000, 'USA')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'01-06-23',5), 5300, 'India')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'11-06-23',5), 3300, 'UK')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'10-06-23',5), 3800, 'Brazil')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'06-06-23',5), 5000, 'Canada')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'09-06-23',5), 9000, 'Australia')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'01-06-23',5), 900, 'India')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'05-06-23',5), 4000, 'India')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'04-06-23',5), 7000, 'Brazil')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'03-06-23',5), 3000, 'UK')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'02-06-23',5), 2000, 'Australia')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'10-06-23',5), 2800, 'India')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'10-06-23',5), 8700, 'Canada')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'24-05-23',5), 2900, 'USA')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'31-05-23',5), 5400, 'India')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'26-05-23',5), 1000, 'Australia')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'29-05-23',5), 2000, 'Brazil')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'10-05-23',5), 2800, 'India')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'10-05-23',5), 8700, 'Canada')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'04-05-23',5), 2900, 'USA')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'01-05-23',5), 5400, 'India')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'06-05-23',5), 1000, 'Australia')
INSERT INTO tbl_SalesData([Date], DailySales, Region) VALUES(convert(datetime,'09-05-23',5), 2000, 'Brazil')

-------------------------------------------------------------------------------------------------------------------------

SELECT * FROM (SELECT t.region AS Region,t.revenue AS Revenue,RANK() OVER(ORDER BY t.revenue DESC) Rank 
FROM 
(
	SELECT DISTINCT sum(dailysales) OVER (PARTITION BY region) AS revenue,region FROM tbl_SalesData WHERE DATE> DATEADD(day, -28, GETDATE())
) t) t1
WHERE t1.Rank = 5;