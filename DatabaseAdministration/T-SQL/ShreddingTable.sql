DECLARE @x1 XML, @x2 XML;

SET @x1 = '<Shopping ShopperName="Phillip Burton">  
<ShoppingTrip ShoppingTripID="L1">  
  <Item Cost="5">Bananas</Item>  
  <Item Cost="4">Apples</Item>  
  <Item Cost="3">Cherries</Item>
</ShoppingTrip></Shopping>';

SET @x2 = '<Shopping ShopperName="Phillip Burton">
<ShoppingTrip ShoppingTripID="L2">  
  <Item>Emeralds</Item>  
  <Item>Diamonds</Item>  
  <Item>Furniture</Item>  
</ShoppingTrip>  
</Shopping>';

IF OBJECT_ID('tempdb..#tblXML') IS NOT NULL
    DROP TABLE #tblXML;

CREATE TABLE #tblXML (
    pkXML INT PRIMARY KEY,
    xmlCol XML
);

INSERT INTO #tblXML(pkXML, xmlCol) VALUES (1, @x1), (2, @x2);

-- Read from XML and extract Cost if exists
SELECT 
    T.pkXML,
    tbl.col.value('.', 'VARCHAR(100)') AS ItemName,
    tbl.col.value('@Cost','VARCHAR(50)') AS ItemCost
FROM #tblXML AS T
CROSS APPLY xmlCol.nodes('/Shopping/ShoppingTrip/Item') AS tbl(col);
