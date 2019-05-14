select gp.GroupName,ss.Name,ss.IpAddress,ds.Name,ds.Pattern,ds.ServerPath,ds.LocalPath from dbo.Groups gp
JOIN dbo.Servers ss ON ss.Id = gp.ServerId
JOIN dbo.Documents ds ON ds.GroupId = gp.Id


select * from DocLog


alter table dbo.DocLog add IsSuccess bit default 0

alter table dbo.Servers add SftpFingerprint nvarchar (max), Login nvarchar (max)