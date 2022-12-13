
e) Display all property names, current tenants first and last names and rental payments per week/ fortnight/month
   for the properties in question a). 

   SELECT p.[Name] AS PropertyName
, Person.FirstName AS TenantFirstName
, Person.LastName AS TenantLastName
, prp.Amount AS RentalPaymentAmount
, trt.[Name] AS RentalPaymentFrequency
FROM OwnerProperty AS op
INNER JOIN Property AS p ON op.PropertyId=p.Id
INNER JOIN TenantProperty AS tp ON p.Id=tp.PropertyId
INNER JOIN Tenant AS t ON tp.TenantId=t.Id
INNER JOIN Person ON t.Id=Person.Id
INNER JOIN PropertyRentalPayment AS prp ON p.Id=prp.PropertyId
INNER JOIN TargetRentType AS trt ON prp.FrequencyType=trt.Id
Where Op.OwnerId = 1426;
