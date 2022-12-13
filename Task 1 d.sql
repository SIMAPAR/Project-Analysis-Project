

d) Display all the jobs available

select * from dbo.Job

select * from dbo.JobMedia



SELECT DISTINCT j.Id AS JobID
, j.PropertyId 
, j.OwnerId 
, j.JobDescription
, jm.IsActive
FROM Job AS j
INNER JOIN JobMedia AS jm ON j.Id=jm.JobId
WHERE jm.IsActive=1