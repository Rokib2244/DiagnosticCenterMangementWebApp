USE [master]
GO
/****** Object:  Database [DiagonosticCenter]    Script Date: 22-May-17 6:33:32 PM ******/
CREATE DATABASE [DiagonosticCenter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DiagonosticCenter', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DiagonosticCenter.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DiagonosticCenter_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DiagonosticCenter_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DiagonosticCenter] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DiagonosticCenter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DiagonosticCenter] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DiagonosticCenter] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DiagonosticCenter] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DiagonosticCenter] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DiagonosticCenter] SET ARITHABORT OFF 
GO
ALTER DATABASE [DiagonosticCenter] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DiagonosticCenter] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DiagonosticCenter] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DiagonosticCenter] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DiagonosticCenter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DiagonosticCenter] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DiagonosticCenter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DiagonosticCenter] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DiagonosticCenter] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DiagonosticCenter] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DiagonosticCenter] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DiagonosticCenter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DiagonosticCenter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DiagonosticCenter] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DiagonosticCenter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DiagonosticCenter] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DiagonosticCenter] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DiagonosticCenter] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DiagonosticCenter] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DiagonosticCenter] SET  MULTI_USER 
GO
ALTER DATABASE [DiagonosticCenter] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DiagonosticCenter] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DiagonosticCenter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DiagonosticCenter] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DiagonosticCenter]
GO
/****** Object:  Table [dbo].[AllPatientEntries]    Script Date: 22-May-17 6:33:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllPatientEntries](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[patientID] [int] NOT NULL,
	[testNameID] [int] NOT NULL,
	[fee] [float] NOT NULL,
 CONSTRAINT [PK_AllPatientEntries] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patients]    Script Date: 22-May-17 6:33:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patients](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[birthDate] [date] NOT NULL,
	[phoneNumber] [varchar](50) NOT NULL,
	[totalFee] [float] NOT NULL,
	[billNo] [int] NOT NULL,
	[dueDate] [date] NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestName]    Script Date: 22-May-17 6:33:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestName](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[testTypeID] [int] NOT NULL,
	[testName] [varchar](200) NOT NULL,
	[fee] [float] NOT NULL,
 CONSTRAINT [PK_TestName] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestType]    Script Date: 22-May-17 6:33:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[testType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TestType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[TestNamesWithType]    Script Date: 22-May-17 6:33:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[TestNamesWithType]
AS
SELECT TestName.testName,TestName.fee,TestType.testType,TestName.ID FROM TestName
INNER JOIN TestType
ON TestName.testTypeID=TestType.ID




GO
/****** Object:  View [dbo].[TestWiseReport]    Script Date: 22-May-17 6:33:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TestWiseReport]
AS
SELECT p.dueDate,t.testName,a.fee FROM AllPatientEntries as a
INNER JOIN Patients as p
on a.patientID=p.ID
RIGHT JOIN TestName as t
on a.testNameID=t.ID
GO
SET IDENTITY_INSERT [dbo].[AllPatientEntries] ON 

INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (1, 8, 4, 550)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (2, 8, 3, 350)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (3, 8, 7, 300)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (4, 9, 7, 300)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (5, 9, 2, 450)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (6, 9, 1, 150)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (7, 10, 7, 300)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (8, 10, 2, 450)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (9, 11, 7, 300)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (10, 11, 3, 350)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (11, 11, 5, 1100)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (12, 11, 1, 150)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (13, 12, 7, 300)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (14, 12, 4, 550)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (15, 12, 3, 350)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (16, 13, 7, 300)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (17, 13, 2, 450)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (18, 13, 1, 150)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (19, 14, 7, 300)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (20, 14, 3, 350)
INSERT [dbo].[AllPatientEntries] ([ID], [patientID], [testNameID], [fee]) VALUES (21, 14, 5, 1100)
SET IDENTITY_INSERT [dbo].[AllPatientEntries] OFF
SET IDENTITY_INSERT [dbo].[Patients] ON 

INSERT [dbo].[Patients] ([ID], [name], [birthDate], [phoneNumber], [totalFee], [billNo], [dueDate]) VALUES (1, N'Shakhawat', CAST(0x9F1D0B00 AS Date), N'01832354598', 0, 557302, CAST(0xD43C0B00 AS Date))
INSERT [dbo].[Patients] ([ID], [name], [birthDate], [phoneNumber], [totalFee], [billNo], [dueDate]) VALUES (2, N'abid', CAST(0xFF300B00 AS Date), N'1233333333', 1450, 10346, CAST(0xD43C0B00 AS Date))
INSERT [dbo].[Patients] ([ID], [name], [birthDate], [phoneNumber], [totalFee], [billNo], [dueDate]) VALUES (3, N'masud', CAST(0xE0300B00 AS Date), N'3038044961', 0, 172510, CAST(0xD43C0B00 AS Date))
INSERT [dbo].[Patients] ([ID], [name], [birthDate], [phoneNumber], [totalFee], [billNo], [dueDate]) VALUES (4, N'Nahid', CAST(0x51260B00 AS Date), N'01521227636', 1250, 672804, CAST(0xD43C0B00 AS Date))
INSERT [dbo].[Patients] ([ID], [name], [birthDate], [phoneNumber], [totalFee], [billNo], [dueDate]) VALUES (5, N'Sowkat', CAST(0xC3330B00 AS Date), N'01521227637', 1100, 832992, CAST(0xD43C0B00 AS Date))
INSERT [dbo].[Patients] ([ID], [name], [birthDate], [phoneNumber], [totalFee], [billNo], [dueDate]) VALUES (6, N'Sufian', CAST(0x90320B00 AS Date), N'01832354591', 1650, 715691, CAST(0xD43C0B00 AS Date))
INSERT [dbo].[Patients] ([ID], [name], [birthDate], [phoneNumber], [totalFee], [billNo], [dueDate]) VALUES (7, N'Anupam', CAST(0x24310B00 AS Date), N'01832354578', 1000, 943487, CAST(0xD43C0B00 AS Date))
INSERT [dbo].[Patients] ([ID], [name], [birthDate], [phoneNumber], [totalFee], [billNo], [dueDate]) VALUES (8, N'Mehedi', CAST(0xFC2C0B00 AS Date), N'01832354599', 1200, 404657, CAST(0xD43C0B00 AS Date))
INSERT [dbo].[Patients] ([ID], [name], [birthDate], [phoneNumber], [totalFee], [billNo], [dueDate]) VALUES (9, N'Shoaib', CAST(0x64330B00 AS Date), N'01832354595', 0, 911996, CAST(0xD43C0B00 AS Date))
INSERT [dbo].[Patients] ([ID], [name], [birthDate], [phoneNumber], [totalFee], [billNo], [dueDate]) VALUES (10, N'Sazzad', CAST(0x111D0B00 AS Date), N'01836598785', 750, 503770, CAST(0xD53C0B00 AS Date))
INSERT [dbo].[Patients] ([ID], [name], [birthDate], [phoneNumber], [totalFee], [billNo], [dueDate]) VALUES (11, N'Iqbal', CAST(0xA5180B00 AS Date), N'01832986312', 1900, 99037, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Patients] ([ID], [name], [birthDate], [phoneNumber], [totalFee], [billNo], [dueDate]) VALUES (12, N'Sohag', CAST(0xE4290B00 AS Date), N'01829668149', 0, 9127, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Patients] ([ID], [name], [birthDate], [phoneNumber], [totalFee], [billNo], [dueDate]) VALUES (13, N'Munir', CAST(0x303C0B00 AS Date), N'01521227639', 900, 598688, CAST(0xD63C0B00 AS Date))
INSERT [dbo].[Patients] ([ID], [name], [birthDate], [phoneNumber], [totalFee], [billNo], [dueDate]) VALUES (14, N'Abidullah', CAST(0xD63C0B00 AS Date), N'01553998895', 1750, 84556, CAST(0xD63C0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Patients] OFF
SET IDENTITY_INSERT [dbo].[TestName] ON 

INSERT [dbo].[TestName] ([ID], [testTypeID], [testName], [fee]) VALUES (1, 4, N'RBS', 150)
INSERT [dbo].[TestName] ([ID], [testTypeID], [testName], [fee]) VALUES (2, 4, N'Lipid profile', 450)
INSERT [dbo].[TestName] ([ID], [testTypeID], [testName], [fee]) VALUES (3, 4, N'S. Creatinine', 350)
INSERT [dbo].[TestName] ([ID], [testTypeID], [testName], [fee]) VALUES (4, 12, N'Lower Abdomen', 550)
INSERT [dbo].[TestName] ([ID], [testTypeID], [testName], [fee]) VALUES (5, 13, N'LS Spine', 1100)
INSERT [dbo].[TestName] ([ID], [testTypeID], [testName], [fee]) VALUES (6, 13, N'Hand X-ray', 200)
INSERT [dbo].[TestName] ([ID], [testTypeID], [testName], [fee]) VALUES (7, 13, N'Feet X-ray', 300)
SET IDENTITY_INSERT [dbo].[TestName] OFF
SET IDENTITY_INSERT [dbo].[TestType] ON 

INSERT [dbo].[TestType] ([ID], [testType]) VALUES (3, N'blood')
INSERT [dbo].[TestType] ([ID], [testType]) VALUES (4, N'Blood')
INSERT [dbo].[TestType] ([ID], [testType]) VALUES (5, N'Hair')
INSERT [dbo].[TestType] ([ID], [testType]) VALUES (6, N'Ear')
INSERT [dbo].[TestType] ([ID], [testType]) VALUES (7, N'leg')
INSERT [dbo].[TestType] ([ID], [testType]) VALUES (8, N'hand')
INSERT [dbo].[TestType] ([ID], [testType]) VALUES (9, N'teeth')
INSERT [dbo].[TestType] ([ID], [testType]) VALUES (10, N'nail')
INSERT [dbo].[TestType] ([ID], [testType]) VALUES (11, N'SAP')
INSERT [dbo].[TestType] ([ID], [testType]) VALUES (12, N'USG')
INSERT [dbo].[TestType] ([ID], [testType]) VALUES (13, N'X-Ray')
INSERT [dbo].[TestType] ([ID], [testType]) VALUES (14, N'jjjjjj')
INSERT [dbo].[TestType] ([ID], [testType]) VALUES (15, N'Blood')
INSERT [dbo].[TestType] ([ID], [testType]) VALUES (16, N'Urine')
INSERT [dbo].[TestType] ([ID], [testType]) VALUES (17, N'eye')
SET IDENTITY_INSERT [dbo].[TestType] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Patients]    Script Date: 22-May-17 6:33:34 PM ******/
ALTER TABLE [dbo].[Patients] ADD  CONSTRAINT [IX_Patients] UNIQUE NONCLUSTERED 
(
	[phoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patients_1]    Script Date: 22-May-17 6:33:34 PM ******/
ALTER TABLE [dbo].[Patients] ADD  CONSTRAINT [IX_Patients_1] UNIQUE NONCLUSTERED 
(
	[billNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AllPatientEntries]  WITH CHECK ADD  CONSTRAINT [FK_AllPatientEntries_TestName] FOREIGN KEY([testNameID])
REFERENCES [dbo].[TestName] ([ID])
GO
ALTER TABLE [dbo].[AllPatientEntries] CHECK CONSTRAINT [FK_AllPatientEntries_TestName]
GO
ALTER TABLE [dbo].[Patients]  WITH CHECK ADD  CONSTRAINT [FK_Patients_Patients] FOREIGN KEY([ID])
REFERENCES [dbo].[Patients] ([ID])
GO
ALTER TABLE [dbo].[Patients] CHECK CONSTRAINT [FK_Patients_Patients]
GO
USE [master]
GO
ALTER DATABASE [DiagonosticCenter] SET  READ_WRITE 
GO
