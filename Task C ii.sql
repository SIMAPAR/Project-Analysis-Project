C ii)Display the yield
SELECT p.Id PropertyId, p.Name PropertyName,
CASE  
	WHEN (pr.FrequencyType=1)
		THEN DATEDIFF(ww,tp.StartDate,tp.EndDate)*pr.Amount
	WHEN(pr.FrequencyType=2)
		THEN (DATEDIFF(WW,tp.StartDate,tp.EndDate)/2)*pr.Amount
	WHEN(pr.FrequencyType=3)
		THEN (DATEDIFF(DD,tp.StartDate,tp.EndDate)/30)*pr.Amount
END AS TotalRentalPaidPA,

((CASE
	WHEN (pr.FrequencyType=1)
		THEN DATEDIFF(ww,tp.StartDate,tp.EndDate)*pr.Amount
	WHEN (pr.FrequencyType=2)
		THEN (DATEDIFF(WW,tp.StartDate,tp.EndDate)/2)*pr.Amount
	WHEN(pr.FrequencyType=3)
		THEN (DATEDIFF(DD,tp.StartDate,tp.EndDate)/30)*pr.Amount
END)- pe.Amount)/pf.CurrentHomeValue*100 AS Yield

 
FROM Property AS p
INNER JOIN OwnerProperty AS op ON p.Id=op.PropertyId
INNER JOIn PropertyHomeValue AS ph ON p.Id=ph.PropertyId
INNER JOIN PropertyRentalPayment AS pr ON p.Id=pr.PropertyId
INNER JOIN TenantProperty AS tp ON p.Id=tp.PropertyId
INNER JOIN PropertyFinance AS pf ON p.Id=pf.PropertyId
INNER JOIN PropertyExpense AS pe ON p.Id=pe.PropertyId
WHERE op.OwnerId=1426