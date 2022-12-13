select p.Id, p.Name,Op.Ownerid,OP.propertyid 
from OwnerProperty as OP, Property as p 
Where OP.Ownerid = 1426