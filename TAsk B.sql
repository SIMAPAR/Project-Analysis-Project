b)  Display the current home value for each property in question a).

SELECT Owner.ID, Owner.OWNERID, Owner.PropertyId, Prop.Name, Val.Value
FROM dbo.OwnerProperty AS Owner
INNER JOIN DBO.Property AS Prop
ON OWNER.PropertyId = PROP.Id
INNER JOIN dbo.PropertyHomeValue as Val
ON Owner.PropertyId = Val.PropertyId
WHERE Owner.OwnerId = '1426'
and Val.IsActive = '1' ;


