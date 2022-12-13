select Name, PropertyId, OwnerId FROM dbo.Property AS P
LEFT JOIN DBO.OwnerProperty AS OP ON p.Id = OP.Id
Where Ownerid = '1426'