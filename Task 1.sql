--Task 1
--a)Display a list of all property names and their property id’s for Owner Id: 1426. 

SELECT Owner.ID, Owner.OWNERID, Owner.PropertyId, Prop.Name
FROM dbo.OwnerProperty AS Owner
INNER JOIN dbo.Property AS Prop
ON Owner.PropertyID = Prop.Id
WHERE Owner.OwnerID ='1426'



















    









