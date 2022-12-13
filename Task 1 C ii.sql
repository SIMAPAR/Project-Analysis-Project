
ii) Discuss the Yield.

SELECT TP.PropertyId,([Amount])/[CurrentHomeValue]*100 as Yield,
    CASE
         WHEN [PaymentFrequencyId] = '1' THEN (DATEDIFF(Week,TP.[StartDate],TP.[EndDate])*[PaymentAmount])
         WHEN [PaymentFrequencyId] = '2' THEN (DATEDIFF(Week,TP.[StartDate],TP.[EndDate])*[PaymentAmount]/2)
         WHEN [PaymentFrequencyId] = '3' THEN (DATEDIFF(Week,TP.[StartDate],TP.[EndDate])*12*[PaymentAmount]/52)
    END as TRP
FROM [dbo].[TenantProperty] as TP
INNER JOIN [dbo].[PropertyExpense] as PE ON TP.PropertyId = PE.PropertyId
INNER JOIN [dbo].[PropertyFinance] as PF ON PE.PropertyId = PF.PropertyId
WHERE TP.PropertyId IN ('5597', '5637', '5638')