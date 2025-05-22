-- Declare the XML variable
DECLARE @x XML

-- Set it with some XML content
SET @x = 
'<Shopping ShopperName="Phillip Burton" Weather="Nice">
  <ShoppingTrip ShoppingTripID="L1">
      <Item Cost="5">Bananas</Item>
      <Item Cost="4">Apples</Item>
      <Item Cost="3">Cherries</Item>
  </ShoppingTrip>
  <ShoppingTrip ShoppingTripID="L2">
      <Item>Emeralds</Item>
      <Item>Diamonds</Item>
      <Item>Furniture</Item>
  </ShoppingTrip>
</Shopping>'

-- Update the Cost attribute of the 3rd Item in the first ShoppingTrip
SET @x.modify('replace value of (/Shopping/ShoppingTrip[1]/Item[3]/@Cost)[1]
               with "6.0"')

-- Insert a new item into the 2nd ShoppingTrip
SET @x.modify('insert <Item Cost="5">New Food</Item>
               into (/Shopping/ShoppingTrip)[2]')

-- Output the final XML
SELECT @x AS UpdatedXML





