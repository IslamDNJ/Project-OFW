USE [master]
GO
/****** Object:  Database [OFW]    Script Date: 06.06.2023 13:34:18 ******/
CREATE DATABASE [OFW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OFW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\OFW.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OFW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\OFW_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OFW] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OFW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OFW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OFW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OFW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OFW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OFW] SET ARITHABORT OFF 
GO
ALTER DATABASE [OFW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OFW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OFW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OFW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OFW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OFW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OFW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OFW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OFW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OFW] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OFW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OFW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OFW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OFW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OFW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OFW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OFW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OFW] SET RECOVERY FULL 
GO
ALTER DATABASE [OFW] SET  MULTI_USER 
GO
ALTER DATABASE [OFW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OFW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OFW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OFW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OFW] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OFW] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'OFW', N'ON'
GO
ALTER DATABASE [OFW] SET QUERY_STORE = ON
GO
ALTER DATABASE [OFW] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OFW]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 06.06.2023 13:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StartID] [int] NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document]    Script Date: 06.06.2023 13:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameDocument] [nvarchar](50) NULL,
	[DateCreation] [date] NULL,
	[DataLastChange] [date] NULL,
	[Completed] [bit] NULL,
	[DescriptionDocument] [nvarchar](50) NULL,
	[DocumentSaveID] [int] NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentSave]    Script Date: 06.06.2023 13:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentSave](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentDate] [nvarchar](200) NULL,
 CONSTRAINT [PK_DocumentSave] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 06.06.2023 13:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StartID] [int] NULL,
	[SectionID] [int] NULL,
	[PositionID] [int] NULL,
	[DocumentID] [int] NULL,
	[NameMember] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 06.06.2023 13:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 06.06.2023 13:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Section]    Script Date: 06.06.2023 13:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Start]    Script Date: 06.06.2023 13:34:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Start](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Start] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([ID], [StartID], [Name]) VALUES (1, 1, N'Сулейманов Ислам')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Document] ON 

INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (2, N'Закупка бумаги', CAST(N'2023-03-06' AS Date), CAST(N'2023-03-09' AS Date), 1, N'Выполнено', 1)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (3, N'Отвечать на звонки', CAST(N'2023-04-20' AS Date), CAST(N'2023-05-26' AS Date), 1, N'Выполняется', 2)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (4, N'Ввести нового сотрудника в базу данных', CAST(N'2023-05-02' AS Date), CAST(N'2023-05-06' AS Date), 1, N'Передано', 3)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (5, N'Вписать сотрудника в выдачу ЗП', CAST(N'2023-05-06' AS Date), CAST(N'2023-05-07' AS Date), 1, N'Выполнено', 4)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (6, N'Выдать зароботную плату', CAST(N'2023-05-15' AS Date), CAST(N'2023-05-16' AS Date), 1, N'Выполнено', 5)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (8, NULL, CAST(N'2023-06-02' AS Date), CAST(N'2023-06-05' AS Date), 0, N'Прокерка', 1002)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (1008, NULL, CAST(N'2023-06-02' AS Date), CAST(N'2023-06-05' AS Date), 0, N'Выполнено', 1003)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (1024, NULL, CAST(N'2023-06-04' AS Date), CAST(N'2023-06-05' AS Date), 0, N'Передано', 1005)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (1025, NULL, CAST(N'2023-06-04' AS Date), CAST(N'2023-06-05' AS Date), 0, N'Исправлено', 1006)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (1026, NULL, CAST(N'2023-06-04' AS Date), CAST(N'2023-06-05' AS Date), NULL, N'Любой текст', 1007)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (2025, NULL, CAST(N'2023-06-04' AS Date), CAST(N'2023-06-05' AS Date), 0, N'Что угодно', 2005)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (2026, NULL, CAST(N'2023-06-04' AS Date), CAST(N'2023-06-05' AS Date), NULL, N'LF', NULL)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (2027, NULL, CAST(N'2023-06-04' AS Date), CAST(N'2023-06-04' AS Date), NULL, N'11', NULL)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (2028, NULL, CAST(N'2023-06-04' AS Date), CAST(N'2023-06-04' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (2029, NULL, CAST(N'2023-06-04' AS Date), CAST(N'2023-06-04' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (2030, NULL, NULL, NULL, NULL, N'', NULL)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (2031, NULL, CAST(N'2023-06-04' AS Date), CAST(N'2023-06-05' AS Date), NULL, N'weqwe', NULL)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (2032, NULL, CAST(N'2023-06-04' AS Date), CAST(N'2023-06-05' AS Date), NULL, N'123121', NULL)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (2033, NULL, CAST(N'2023-06-04' AS Date), NULL, NULL, NULL, NULL)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (2034, NULL, CAST(N'2023-06-05' AS Date), CAST(N'2023-06-06' AS Date), NULL, N'ewqew', NULL)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (2035, NULL, CAST(N'2023-06-05' AS Date), CAST(N'2023-06-06' AS Date), NULL, N'ewqee', NULL)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (3025, NULL, CAST(N'2023-03-04' AS Date), CAST(N'2023-03-09' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (3026, NULL, CAST(N'2023-03-04' AS Date), CAST(N'2023-03-09' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (3027, NULL, CAST(N'2023-03-04' AS Date), CAST(N'2023-03-09' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (3028, NULL, CAST(N'2023-03-04' AS Date), CAST(N'2023-03-09' AS Date), NULL, NULL, NULL)
INSERT [dbo].[Document] ([ID], [NameDocument], [DateCreation], [DataLastChange], [Completed], [DescriptionDocument], [DocumentSaveID]) VALUES (3029, NULL, CAST(N'2023-03-04' AS Date), CAST(N'2023-03-09' AS Date), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Document] OFF
GO
SET IDENTITY_INSERT [dbo].[DocumentSave] ON 

INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (1, N'C:\Users\Admin\Desktop\ADS_FinalVersion.sql')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (2, N'F:\(Сулеманов) Отчет по производственной практике 2023.docx')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (3, N'C:\Users\Admin\Desktop\(Сулеманов) Отчет по производственной практике 2023.docx')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (4, N'C:\Users\Admin\Desktop\(Сулеманов) Отчет по производственной практике 2023.docx')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (5, N'C:\Users\Admin\Desktop\(Сулеманов) Отчет по производственной практике 2023.docx')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (6, N'C:\Users\Admin\Desktop\(Сулеманов) Отчет по производственной практике 2023.docx')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (7, N'C:\Users\Admin\Desktop\10 Роль личности в истории Великой войны.docx')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (8, N'C:\Users\Admin\Desktop\10 Роль личности в истории Великой войны.docx')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (9, N'F:\Опыт работы.docx')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (10, N'F:\Дипломная работа\Документация Диплом.docx')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (11, N'C:\Users\Admin\Desktop\ADS.rar')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (1002, N'C:\Users\Admin\Desktop\FinalVersionOFW.sql')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (1003, N'C:\Users\Admin\Desktop\Охранная Организация (попытка 3)\Охранная Организация (попытка 3).sln')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (1004, N'F:\Capability Maturity Model.docx')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (1005, N'F:\Сертификат Прохождение.pdf')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (1006, N'F:\Сертификат Оператор.pdf')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (1007, N'F:\Сертификат Оператор.pdf')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (2005, N'C:\Users\Admin\Desktop\10 Роль личности в истории Великой войны.docx')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (2006, N'C:\Users\Ислам\Documents\Диплом хоть что-то.docx')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (2007, N'C:\Users\Ислам\Documents\Диплом хоть что-то.docx')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (2008, N'C:\Users\Ислам\Documents\Диплом хоть что-то.docx')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (2009, NULL)
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (2010, NULL)
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (2011, NULL)
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (2012, N'C:\Users\Ислам\Documents\Диплом хоть что-то.docx')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (2013, NULL)
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (2014, NULL)
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (2015, NULL)
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (2016, N'C:\Users\Ислам\Documents\Диплом хоть что-то.docx')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (2017, NULL)
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (2018, N'C:\Users\Ислам\Documents\Диплом хоть что-то.docx')
INSERT [dbo].[DocumentSave] ([ID], [DocumentDate]) VALUES (2019, NULL)
SET IDENTITY_INSERT [dbo].[DocumentSave] OFF
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([ID], [StartID], [SectionID], [PositionID], [DocumentID], [NameMember]) VALUES (2, 3, 2, 2, 2, N'Ахмед')
INSERT [dbo].[Member] ([ID], [StartID], [SectionID], [PositionID], [DocumentID], [NameMember]) VALUES (3, 4, 3, 2, 3, N'Виктор')
INSERT [dbo].[Member] ([ID], [StartID], [SectionID], [PositionID], [DocumentID], [NameMember]) VALUES (4, 5, 4, 2, 4, N'Никита')
INSERT [dbo].[Member] ([ID], [StartID], [SectionID], [PositionID], [DocumentID], [NameMember]) VALUES (5, 6, 5, 2, 5, N'Сергей')
INSERT [dbo].[Member] ([ID], [StartID], [SectionID], [PositionID], [DocumentID], [NameMember]) VALUES (6, 7, 5, 1, 6, N'Иван')
INSERT [dbo].[Member] ([ID], [StartID], [SectionID], [PositionID], [DocumentID], [NameMember]) VALUES (4042, 4012, 2, 2, 8, N'Магомед')
INSERT [dbo].[Member] ([ID], [StartID], [SectionID], [PositionID], [DocumentID], [NameMember]) VALUES (4043, 4013, 3, 2, 1008, N'Никита')
INSERT [dbo].[Member] ([ID], [StartID], [SectionID], [PositionID], [DocumentID], [NameMember]) VALUES (4044, 4014, 2, 1, 1024, N'Хаджимурад')
INSERT [dbo].[Member] ([ID], [StartID], [SectionID], [PositionID], [DocumentID], [NameMember]) VALUES (4045, 4015, 4, 1, 1025, N'Шамиль')
INSERT [dbo].[Member] ([ID], [StartID], [SectionID], [PositionID], [DocumentID], [NameMember]) VALUES (4046, 4016, 3, 2, 2025, N'Марат')
INSERT [dbo].[Member] ([ID], [StartID], [SectionID], [PositionID], [DocumentID], [NameMember]) VALUES (4052, 4017, 1, 1, NULL, N'qwertyu')
INSERT [dbo].[Member] ([ID], [StartID], [SectionID], [PositionID], [DocumentID], [NameMember]) VALUES (4053, 4018, 2, 2, NULL, N'Проверка')
SET IDENTITY_INSERT [dbo].[Member] OFF
GO
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([ID], [Name]) VALUES (1, N'Новичок')
INSERT [dbo].[Position] ([ID], [Name]) VALUES (2, N'Старший')
SET IDENTITY_INSERT [dbo].[Position] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Title]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([ID], [Title]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Section] ON 

INSERT [dbo].[Section] ([ID], [Name]) VALUES (1, N'Архив и документация')
INSERT [dbo].[Section] ([ID], [Name]) VALUES (2, N'Закупки и снабжение')
INSERT [dbo].[Section] ([ID], [Name]) VALUES (3, N'Техническая поддержка')
INSERT [dbo].[Section] ([ID], [Name]) VALUES (4, N'Отдел кадров')
INSERT [dbo].[Section] ([ID], [Name]) VALUES (5, N'Отдел финансов и бухгалтерии')
INSERT [dbo].[Section] ([ID], [Name]) VALUES (6, N'Управляющий состав')
SET IDENTITY_INSERT [dbo].[Section] OFF
GO
SET IDENTITY_INSERT [dbo].[Start] ON 

INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (1, 1, N'1', N'1')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (2, 2, N'2', N'2')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (3, 2, N'3', N'3')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (4, 2, N'4', N'4')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (5, 2, N'5', N'5')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (6, 2, N'6', N'6')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (7, 2, N'7', N'7')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (8, 2, N'123123', N'123123')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (1008, 2, N'12', N'12')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (1009, 2, N'123', N'123')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (1010, 2, N'123123', N'123')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (2008, 2, N'123123', N'123123')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (2009, 2, N'134', N'134')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (2010, 2, N'12', N'12')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (2011, 2, N'123', N'123')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (2012, 2, N'1', N'123123')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (2013, 2, N'1234', N'123123123')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (2014, 2, N'321', N'321')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (3011, 2, N'321321', N'321321')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (3012, 2, N'121212', N'121212')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (3013, 2, N'45', N'45')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (3014, 2, N'123123', N'123123')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (3015, 2, N'уцйу', N'уцйу')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (3016, 2, N'ewq', N'ewq')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (3017, 2, N'ewq', N'ewq')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (3018, 2, N'123123', N'123123')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (4011, 2, N'', N'')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (4012, 2, N'456456', N'456456')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (4013, 2, N'789789', N'789789')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (4014, 2, N'147', N'147')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (4015, 2, N'789', N'789')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (4016, 2, N'963', N'963')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (4017, 2, N'123123123', N'123123123')
INSERT [dbo].[Start] ([ID], [RoleID], [Login], [Password]) VALUES (4018, 2, N'102', N'102')
SET IDENTITY_INSERT [dbo].[Start] OFF
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Start] FOREIGN KEY([StartID])
REFERENCES [dbo].[Start] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Start]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_DocumentSave] FOREIGN KEY([DocumentSaveID])
REFERENCES [dbo].[DocumentSave] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_DocumentSave]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_Document] FOREIGN KEY([DocumentID])
REFERENCES [dbo].[Document] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_Document]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_Position] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Position] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_Position]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_Section] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Section] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_Section]
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_Start] FOREIGN KEY([StartID])
REFERENCES [dbo].[Start] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_Start]
GO
ALTER TABLE [dbo].[Start]  WITH CHECK ADD  CONSTRAINT [FK_Start_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Start] CHECK CONSTRAINT [FK_Start_Role]
GO
USE [master]
GO
ALTER DATABASE [OFW] SET  READ_WRITE 
GO
