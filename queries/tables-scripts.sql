USE [projectaz]
GO
ALTER TABLE [dbo].[Groups] DROP CONSTRAINT [FK_Server_Id]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [FK_Group_Id]
GO
ALTER TABLE [dbo].[DocLog] DROP CONSTRAINT [FK_DocLog_Group_Id]
GO
ALTER TABLE [dbo].[DocLog] DROP CONSTRAINT [FK_Doc_Id]
GO
ALTER TABLE [dbo].[DocCopies] DROP CONSTRAINT [FK_Doc_Copy]
GO
/****** Object:  Table [dbo].[Servers]    Script Date: 5/16/2018 10:20:10 PM ******/
DROP TABLE [dbo].[Servers]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 5/16/2018 10:20:10 PM ******/
DROP TABLE [dbo].[Groups]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 5/16/2018 10:20:10 PM ******/
DROP TABLE [dbo].[Documents]
GO
/****** Object:  Table [dbo].[DocLog]    Script Date: 5/16/2018 10:20:10 PM ******/
DROP TABLE [dbo].[DocLog]
GO
/****** Object:  Table [dbo].[DocCopies]    Script Date: 5/16/2018 10:20:10 PM ******/
DROP TABLE [dbo].[DocCopies]
GO
/****** Object:  Table [dbo].[DocCopies]    Script Date: 5/16/2018 10:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocCopies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocId] [int] NULL,
	[Path] [nvarchar](max) NULL,
 CONSTRAINT [PK_DocCopies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocLog]    Script Date: 5/16/2018 10:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocId] [int] NULL,
	[FileName] [nvarchar](max) NULL,
	[DownloadLocation] [nvarchar](max) NULL,
	[DownloadTime] [datetime] NULL,
	[FileType] [nvarchar](max) NULL,
	[GroupId] [int] NULL,
 CONSTRAINT [PK_DocLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 5/16/2018 10:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Pattern] [nvarchar](max) NULL,
	[CreatedTime] [datetime] NULL,
	[ServerPath] [nvarchar](max) NULL,
	[LocalPath] [nvarchar](256) NULL,
	[Comments] [nvarchar](max) NULL,
	[RetryCount] [int] NULL,
	[RetryInterval] [int] NULL,
	[Overwrite] [bit] NULL,
	[GroupId] [int] NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 5/16/2018 10:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](256) NULL,
	[Description] [nvarchar](max) NULL,
	[ServerId] [int] NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servers]    Script Date: 5/16/2018 10:20:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[IpAddress] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Comments] [nvarchar](256) NULL,
	[Type] [nvarchar](100) NULL,
 CONSTRAINT [PK_Servers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DocCopies]  WITH CHECK ADD  CONSTRAINT [FK_Doc_Copy] FOREIGN KEY([DocId])
REFERENCES [dbo].[Documents] ([Id])
GO
ALTER TABLE [dbo].[DocCopies] CHECK CONSTRAINT [FK_Doc_Copy]
GO
ALTER TABLE [dbo].[DocLog]  WITH CHECK ADD  CONSTRAINT [FK_Doc_Id] FOREIGN KEY([DocId])
REFERENCES [dbo].[Documents] ([Id])
GO
ALTER TABLE [dbo].[DocLog] CHECK CONSTRAINT [FK_Doc_Id]
GO
ALTER TABLE [dbo].[DocLog]  WITH CHECK ADD  CONSTRAINT [FK_DocLog_Group_Id] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[DocLog] CHECK CONSTRAINT [FK_DocLog_Group_Id]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Group_Id] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Group_Id]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK_Server_Id] FOREIGN KEY([ServerId])
REFERENCES [dbo].[Servers] ([Id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK_Server_Id]
GO
