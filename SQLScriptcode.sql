CREATE DATABASE [TABLES]
GO
CREATE TABLE [dbo].[TaskTypes](
[Id] [int] NOT NULL,
[Name] [nvarchar](MAX) NULL,
CONSTRAINT [PK_TaskTypes] PRIMARY KEY CLUSTERED
(
[Id] ASC
)
)ON [PRIMARY]
GO
CREATE TABLE [dbo].[Tasks](
[Id] [int] NOT NULL,
[Title] [nvarchar](256) NULL,
[OpportunityId] [int] NOT NULL,
[DueDate] [datetime] NOT NULL,
[Typeid] [int] NOT NULL,
[StatusId] [int] NULL,
CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED
(
[Id] ASC
)
constraint FK_OpportunityId FOREIGN KEY(OpportunityId)
	references Opportunities(Id),
constraint FK_StatusId FOREIGN KEY(StatusId)
	references TaskStatues(Id),
constraint FK_TypeId FOREIGN KEY(TypeId)
	references TaskTypes(Id)
)ON [PRIMARY]
GO
CREATE TABLE [dbo].[Opportunities](
[Id] [int] NOT NULL,
[Amount] [money] NOT NULL,
[UserId] [Nvarchar](450) NOT NULL,
[ContactId] [int] NOT NULL,
[StatusId] [int] NOT NULL,
[CloseDate] [datetime] NOT NULL,
[Name] [nvarchar](256) NOT NULL,
CONSTRAINT [PK_Opportunities] PRIMARY KEY CLUSTERED(
[Id] ASC
)
constraint FK_ContactId FOREIGN KEY(ContactId)
	references Contacts(Id),
	constraint FK_StatustId FOREIGN KEY(StatusId)
	references OpportunityStatues(Id)
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[OpportunityStatues](
[Id] [int] NOT NULL,
[Name] [nvarchar](MAX) NULL,
CONSTRAINT [PK_OpportunityStatues] PRIMARY KEY CLUSTERED(
[Id] ASC
)
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[TaskStatues](
[Id] [int] NOT NULL,
[Name] [nvarchar](256) NULL,
CONSTRAINT [PK_TaskStatues] PRIMARY KEY CLUSTERED(
[Id] ASC
)
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Contacts](
[Id] [int] NOT NULL,
[Email] [nvarchar](256) NOT NULL,
[Company] [nvarchar](256) NULL,
[LastName] [nvarchar](256) NULL,
[FirstName] [nvarchar](256) NULL,
[Phone] [nvarchar](256) NULL,
CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED(
[Id] ASC
)
)