-- =======================================================
-- Create Stored Procedure Template for Azure SQL Database
-- =======================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE saveServerInfo
(
    -- Add the parameters for the stored procedure here
   @Id int,
   @Name nvarchar(100),
   @ServerAddress nvarchar(256),
   @Password nvarchar(100),
   @Comments nvarchar(256),
   @Type nvarchar(100),
   @SftpFingerprint nvarchar(max),
   @Login nvarchar(max)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON


	DECLARE @returnId int = 0;
    -- Insert statements for procedure here
   IF (@Id=0)  
   BEGIN
		   INSERT INTO [dbo].[Servers]
				   ([Name]
				   ,[ServerAddress]
				   ,[Password]
				   ,[Comments]
				   ,[Type]
				   ,[SftpFingerprint]
				   ,[Login])
			 VALUES
				 (  @Name
				   ,@ServerAddress
				   ,@Password
				   ,@Comments
				   ,@Type
				   ,@SftpFingerprint
				   ,@Login
				   )
		set @returnId = @@IDENTITY
     END

ELSE
BEGIN

		Update dbo.Servers 

				set
					[Name] = @Name
					,[ServerAddress] = @ServerAddress
					,[Password] = @Password
					,[Comments] = @Comments
					,[Type] = @Type
					,[SftpFingerprint] = @SftpFingerprint
					,[Login] = @Login

				   where  Id = @Id
		set @returnId = @Id

END

select * from dbo.Servers where Id = @Id

END
GO
