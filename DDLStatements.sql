USE [master]
GO
/****** Object:  Database [scsg2]    Script Date: 4/3/2024 10:33:34 AM ******/
CREATE DATABASE [scsg2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'scsg2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\scsg2.mdf' , SIZE = 9024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'scsg2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\scsg2_log.ldf' , SIZE = 18240KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [scsg2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [scsg2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [scsg2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [scsg2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [scsg2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [scsg2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [scsg2] SET ARITHABORT OFF 
GO
ALTER DATABASE [scsg2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [scsg2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [scsg2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [scsg2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [scsg2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [scsg2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [scsg2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [scsg2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [scsg2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [scsg2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [scsg2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [scsg2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [scsg2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [scsg2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [scsg2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [scsg2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [scsg2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [scsg2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [scsg2] SET  MULTI_USER 
GO
ALTER DATABASE [scsg2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [scsg2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [scsg2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [scsg2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [scsg2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [scsg2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'scsg2', N'ON'
GO
ALTER DATABASE [scsg2] SET QUERY_STORE = ON
GO
ALTER DATABASE [scsg2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [scsg2]
GO
/****** Object:  Table [dbo].[RECOMMENDATION]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RECOMMENDATION](
	[NID] [int] NOT NULL,
	[UID] [int] NOT NULL,
	[MID] [int] NOT NULL,
	[validPeriod] [datetime] NULL,
	[dateIssued] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER_ACCOUNT]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER_ACCOUNT](
	[UID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[DOB] [date] NULL,
	[Gender] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MALL]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MALL](
	[MID] [int] NOT NULL,
	[Address] [varchar](100) NULL,
	[NumShops] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[RecommendationAssociationView]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RecommendationAssociationView] AS
SELECT
    r.NID AS RecommendationID,
    ua.UID AS UserID,
    m.MID AS MallID
FROM
    RECOMMENDATION r
CROSS JOIN
    USER_ACCOUNT ua
CROSS JOIN
    MALL m;


GO
/****** Object:  Table [dbo].[COMPLAINT]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPLAINT](
	[CID] [int] NOT NULL,
	[UID] [int] NULL,
	[Status] [varchar](50) NULL,
	[Text] [varchar](200) NULL,
	[filedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPLAINTS_ON_RESTAURANT]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPLAINTS_ON_RESTAURANT](
	[CID] [int] NOT NULL,
	[UID] [int] NULL,
	[Status] [varchar](50) NULL,
	[Text] [varchar](200) NULL,
	[OID] [int] NULL,
	[filedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPLAINTS_ON_SHOP]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPLAINTS_ON_SHOP](
	[CID] [int] NOT NULL,
	[SID] [int] NULL,
	[UID] [int] NULL,
	[Status] [varchar](50) NULL,
	[Text] [varchar](200) NULL,
	[filedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DAY_PACKAGE]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DAY_PACKAGE](
	[DID] [int] NOT NULL,
	[Description] [varchar](200) NULL,
	[UID] [int] NOT NULL,
	[VID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DID] ASC,
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DAYPACKAGE_HAS_RESTAURANTOUTLET]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DAYPACKAGE_HAS_RESTAURANTOUTLET](
	[DID] [int] NOT NULL,
	[OID] [int] NOT NULL,
	[UID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DID] ASC,
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DINE_VOUCHER]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DINE_VOUCHER](
	[VID] [int] NOT NULL,
	[cashDiscount] [int] NOT NULL,
	[dateTime] [datetime] NULL,
	[UID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GROUP_VOUCHER]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GROUP_VOUCHER](
	[VID] [int] NOT NULL,
	[groupSize] [int] NOT NULL,
	[groupDiscount] [int] NOT NULL,
	[dateTime] [datetime] NULL,
	[UID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MALL_HAS_DAYPACKAGE]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MALL_HAS_DAYPACKAGE](
	[DID] [int] NOT NULL,
	[MID] [int] NOT NULL,
	[UID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DID] ASC,
	[MID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MALL_MGMT_COMPANY]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MALL_MGMT_COMPANY](
	[MMCID] [int] NOT NULL,
	[Address] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MMCID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PACKAGE_VOUCHER]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PACKAGE_VOUCHER](
	[VID] [int] NOT NULL,
	[packageDiscount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PURCHASE_VOUCHER]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PURCHASE_VOUCHER](
	[VID] [int] NOT NULL,
	[purchaseDiscount] [int] NOT NULL,
	[dateTime] [datetime] NULL,
	[UID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RELATED]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RELATED](
	[Person1_UID] [int] NOT NULL,
	[Person2_UID] [int] NOT NULL,
	[Type] [varchar](50) NULL,
	[family_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Person1_UID] ASC,
	[Person2_UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESTAURANT_CHAIN]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESTAURANT_CHAIN](
	[RID] [int] NOT NULL,
	[Address] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[RID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESTAURANT_OUTLET]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESTAURANT_OUTLET](
	[OID] [int] NOT NULL,
	[MID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SHOP]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHOP](
	[SID] [int] NOT NULL,
	[Type] [varchar](50) NULL,
	[MID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERDINE]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERDINE](
	[OID] [int] NOT NULL,
	[UID] [int] NOT NULL,
	[amountSpent] [decimal](18, 2) NULL,
	[dateTimeIn] [datetime] NULL,
	[dateTimeOut] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OID] ASC,
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERSHOP]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERSHOP](
	[SID] [int] NOT NULL,
	[UID] [int] NOT NULL,
	[amountSpent] [decimal](18, 2) NULL,
	[dateTimeIn] [datetime] NULL,
	[dateTimeOut] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SID] ASC,
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VOUCHER]    Script Date: 4/3/2024 10:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VOUCHER](
	[VID] [int] NOT NULL,
	[Status] [varchar](50) NULL,
	[expiryDate] [datetime] NULL,
	[dateIssued] [datetime] NULL,
	[Description] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COMPLAINT]  WITH CHECK ADD FOREIGN KEY([UID])
REFERENCES [dbo].[USER_ACCOUNT] ([UID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[COMPLAINTS_ON_RESTAURANT]  WITH CHECK ADD FOREIGN KEY([CID])
REFERENCES [dbo].[COMPLAINT] ([CID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[COMPLAINTS_ON_SHOP]  WITH CHECK ADD FOREIGN KEY([CID])
REFERENCES [dbo].[COMPLAINT] ([CID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DAY_PACKAGE]  WITH CHECK ADD FOREIGN KEY([UID])
REFERENCES [dbo].[USER_ACCOUNT] ([UID])
GO
ALTER TABLE [dbo].[DAY_PACKAGE]  WITH CHECK ADD FOREIGN KEY([VID])
REFERENCES [dbo].[PACKAGE_VOUCHER] ([VID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DAYPACKAGE_HAS_RESTAURANTOUTLET]  WITH CHECK ADD FOREIGN KEY([OID])
REFERENCES [dbo].[RESTAURANT_OUTLET] ([OID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DAYPACKAGE_HAS_RESTAURANTOUTLET]  WITH CHECK ADD FOREIGN KEY([DID], [UID])
REFERENCES [dbo].[DAY_PACKAGE] ([DID], [UID])
GO
ALTER TABLE [dbo].[DINE_VOUCHER]  WITH CHECK ADD FOREIGN KEY([UID])
REFERENCES [dbo].[USER_ACCOUNT] ([UID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DINE_VOUCHER]  WITH CHECK ADD FOREIGN KEY([VID])
REFERENCES [dbo].[VOUCHER] ([VID])
GO
ALTER TABLE [dbo].[GROUP_VOUCHER]  WITH CHECK ADD FOREIGN KEY([UID])
REFERENCES [dbo].[USER_ACCOUNT] ([UID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GROUP_VOUCHER]  WITH CHECK ADD FOREIGN KEY([VID])
REFERENCES [dbo].[VOUCHER] ([VID])
GO
ALTER TABLE [dbo].[MALL_HAS_DAYPACKAGE]  WITH CHECK ADD FOREIGN KEY([MID])
REFERENCES [dbo].[MALL] ([MID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[MALL_HAS_DAYPACKAGE]  WITH CHECK ADD FOREIGN KEY([DID], [UID])
REFERENCES [dbo].[DAY_PACKAGE] ([DID], [UID])
GO
ALTER TABLE [dbo].[PACKAGE_VOUCHER]  WITH CHECK ADD FOREIGN KEY([VID])
REFERENCES [dbo].[VOUCHER] ([VID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PURCHASE_VOUCHER]  WITH CHECK ADD FOREIGN KEY([UID])
REFERENCES [dbo].[USER_ACCOUNT] ([UID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PURCHASE_VOUCHER]  WITH CHECK ADD FOREIGN KEY([VID])
REFERENCES [dbo].[VOUCHER] ([VID])
GO
ALTER TABLE [dbo].[RECOMMENDATION]  WITH CHECK ADD FOREIGN KEY([MID])
REFERENCES [dbo].[MALL] ([MID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RECOMMENDATION]  WITH CHECK ADD FOREIGN KEY([UID])
REFERENCES [dbo].[USER_ACCOUNT] ([UID])
GO
ALTER TABLE [dbo].[RELATED]  WITH CHECK ADD FOREIGN KEY([Person1_UID])
REFERENCES [dbo].[USER_ACCOUNT] ([UID])
GO
ALTER TABLE [dbo].[RELATED]  WITH CHECK ADD FOREIGN KEY([Person2_UID])
REFERENCES [dbo].[USER_ACCOUNT] ([UID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[RESTAURANT_OUTLET]  WITH CHECK ADD FOREIGN KEY([MID])
REFERENCES [dbo].[MALL] ([MID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SHOP]  WITH CHECK ADD FOREIGN KEY([MID])
REFERENCES [dbo].[MALL] ([MID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[USERDINE]  WITH CHECK ADD FOREIGN KEY([OID])
REFERENCES [dbo].[RESTAURANT_OUTLET] ([OID])
GO
ALTER TABLE [dbo].[USERDINE]  WITH CHECK ADD FOREIGN KEY([UID])
REFERENCES [dbo].[USER_ACCOUNT] ([UID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[USERSHOP]  WITH CHECK ADD FOREIGN KEY([SID])
REFERENCES [dbo].[SHOP] ([SID])
GO
ALTER TABLE [dbo].[USERSHOP]  WITH CHECK ADD FOREIGN KEY([UID])
REFERENCES [dbo].[USER_ACCOUNT] ([UID])
ON UPDATE CASCADE
GO
USE [master]
GO
ALTER DATABASE [scsg2] SET  READ_WRITE 
GO
