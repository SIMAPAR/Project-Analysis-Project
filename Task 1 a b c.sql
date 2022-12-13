C)  For each property in question a), return the following:  
   i)Using rental payment amount, rental payment frequency, tenant start date and
     tenant end date to write a query that returns the sum of all payments from start date 
	 to end date.
	 
SELECT PRP.Amount as RentalAmount, Owner.OwnerId, TenantProp.StartDate,
       TenantProp.EndDate, PRP.FrequencyType AS RentPayFrequencyID,
	   TPF.Code AS RentalPayFrequency, Owner.PropertyId,

CASE
  WHEN (PRP.FrequencyType = 1)
   THEN DATEDIFF(WW,TenantProp.StartDate, TenantProp.EndDate)* PRP.Amount
  WHEN (PRP.FrequencyType = 2)
   THEN DATEDIFF(WW,TenantProp.StartDate,Tenantprop.EndDate) *PRP.Amount*1/2
  WHEN (PRP.FrequencyType = 3)
   THEN (DATEDIFF(MM,TenantProp.StartDate, TenantProp.EndDate)+1)*PRP.Amount
  END AS TotalPayment

FROM dbo.PropertyRentalPayment PRP
LEFT JOIN dbo.Ownerproperty AS OWNER ON PRP.propertyid = Owner.PropertyId
LEFT JOIN dbo.TenantProperty AS TenantProp ON Owner.PropertyId = TenantProp.PropertyId
LEFT JOIN dbo.TenantPaymentFrequencies AS TPF ON PRP.FrequencyType = TPF.Id
WHERE OwnerID = '1426'





	