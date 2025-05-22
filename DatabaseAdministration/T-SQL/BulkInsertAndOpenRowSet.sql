drop table #tblXML
go
create table #tblXML(XmlCol xml)
go
bulk insert #tblXML from 'C:\Users\OngeziweCwesi\Downloads\SampleDataBulkInsert.txt'
select * from #tblXML

drop table #tblXML
go
create table #tblXML(IntCol int, XmlCol xml)
go
insert into #tblXML(XmlCol)
select * from
openrowset(BULK 'C:\Users\OngeziweCwesi\Downloads\SampleDataOpenRowset.txt', SINGLE_BLOB) AS x
select * from #tblXML
