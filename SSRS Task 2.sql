select p.name as PropertyName,
	   CONCAT(A.Number, ' ', A.Street,' ',A.Suburb, ' ', A.City,' ', A.Region,' ', A.Postcode) as PropertyAddress,
	   CONCAT(P.Bedroom, 'Bedrooms',P.Bathroom,'Bathroom') as PropertyDetails,
	   Person.FirstName as Currentowner,
	   CONCAT('$' , PRP.AMOUNT, 'per', TPF.Code ) AS Rentalpayment,
	   PE.PropertyId as PropertyID,
	   PE.Amount as Amount,
	   format(PE.date,'dd-mmm-yyyy') as Date,
	   PE.Description as Expense
from dbo.Property as P
INNER JOIN dbo.Address as A ON A.addressid = P.addressID
INNER JOIN dbo.OwnerProperty as OP ON OP.PropertyID = P.Id
INNER JOIN dbo.person as Person ON Person.Id = OP.OwnerId
INNER JOIN dbo.PropertyRentalPayment as PRP ON PRP.PropertyId = P.Id
INNER JOIN dbo.TenantPaymentFrequencies as TPF ON TPF.Id = PRP.FrequencyType
INNER JOIN dbo.PropertyExpense as PE ON PE.PropertyId = p.Id
where p.Name = 'Property A'
		