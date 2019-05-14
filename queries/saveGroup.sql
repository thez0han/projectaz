SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Alter PROCEDURE saveGroup
(
    -- Add the parameters for the stored procedure here
   @Id int,
   @GroupName nvarchar(256),
   @Description nvarchar(MAX),
   @ServerId int
   
)
AS
BEGIN
	DECLARE @returnId int = 0;
	IF (@Id=0)
	BEGIN
			INSERT INTO [dbo].[Groups]
				   ([GroupName]
				   ,[Description]
				   ,[ServerId])
			VALUES
				   (
					@GroupName,
					@Description,
					@ServerId 
				   )
	set @returnId = @@IDENTITY
	End
	ELSE
	BEGIN 
		Update dbo.Groups
				set
					[GroupName] = @GroupName
					,[Description] = @Description
					,[ServerId] = @ServerId
					where Id = @Id
					set @returnId = @Id
					

	END

	select * from dbo.Groups where Id = @Id
END
GO


