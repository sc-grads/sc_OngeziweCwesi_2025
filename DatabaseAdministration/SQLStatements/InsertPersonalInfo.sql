USE [OurFirstDatabase]
GO

INSERT INTO [dbo].[personalinfo]
           ([firstName], [lastName], [dob], [ID])
     VALUES
           ('Ongeziwe', 'Cwesi', '2003-07-25', 202125676)
GO

select * from [dbo].[personalinfo]
GO
