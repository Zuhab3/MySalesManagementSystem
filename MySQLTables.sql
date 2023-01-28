CREATE DATABASE SALES 

USE [Sales]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Announcement_table](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [varchar](max) NULL,
	[datetime] [date] NULL,
	[CreatedUserId] [int] NULL,
 CONSTRAINT [PK_Announcement_table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Client_Table](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NULL,
	[CreatedUserId] [int] NULL,
	[timestamp] [datetime] NULL,
	[CType] [int] NULL,
	[ChanceToClose] [varchar](500) NULL,
	[EBudget] [varchar](500) NULL,
	[Duration] [varchar](500) NULL,
	[ContactName] [varchar](500) NULL,
	[ContactMobile] [varchar](500) NULL,
	[Description] [varchar](max) NULL,
	[Notes] [varchar](500) NULL,
 CONSTRAINT [PK_Client_Table] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OppType_Table](
	[OppId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NULL,
	[CreatedbyUserId] [int] NULL,
 CONSTRAINT [PK_OppType_Table] PRIMARY KEY CLUSTERED 
(
	[OppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project_Table](
	[ProjId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [varchar](500) NULL,
	[ProjectManager] [int] NULL,
	[timestamp] [datetime] NULL,
	[Amount] [real] NULL,
	[Revenue] [real] NULL,
	[Description] [varchar](max) NULL,
	[status] [bit] NULL CONSTRAINT [DF_Project_Table_status]  DEFAULT ((0)),
	[LaunchDate] [datetime] NULL,
	[Duration] [varchar](500) NULL,
	[ContactName] [varchar](500) NULL,
	[ContactMobile] [varchar](500) NULL,
	[Notes] [varchar](500) NULL,
 CONSTRAINT [PK_Project_Table] PRIMARY KEY CLUSTERED 
(
	[ProjId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proposal_Table](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NULL,
	[CreatedUserId] [int] NULL,
	[timestamp] [datetime] NULL,
	[ChanceToClose] [varchar](500) NULL,
	[EBudget] [varchar](500) NULL,
	[Duration] [varchar](500) NULL,
	[ContactName] [varchar](500) NULL,
	[ContactMobile] [varchar](500) NULL,
	[Description] [varchar](max) NULL,
	[Notes] [varchar](500) NULL,
	[Amount] [real] NULL,
	[Revenue] [real] NULL,
	[status] [bit] NULL CONSTRAINT [DF_proposals_table_status]  DEFAULT ((0)),
	[RejectionReason] [varchar](500) NULL,
 CONSTRAINT [PK_proposals_table] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users_Table](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](500) NULL,
	[Pwd] [varchar](500) NULL,
	[Role] [varchar](50) NULL,
	[CreatedUserId] [int] NULL CONSTRAINT [DF_Users_Table_CreatedUserId]  DEFAULT ((0)),
 CONSTRAINT [PK_Users_Table] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
CREATE FUNCTION [dbo].[fn_getType]
(
	@Typeid as int
)
RETURNS varchar(500)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @myval as varchar(500)

	-- Add the T-SQL statements to compute the return value here
	SELECT @myval=Name from [dbo].[OppType_Table] where oppid=@Typeid

	-- Return the result of the function
	RETURN @myval

END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_getUserName]
(
	@userid as int
)
RETURNS varchar(500)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @myname varchar(500)

	-- Add the T-SQL statements to compute the return value here
	SELECT @myname=[UserName] from Users_Table where Userid=@userid

	-- Return the result of the function
	RETURN @myname

END

GO
