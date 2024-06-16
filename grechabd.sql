USE [master]
GO
/****** Object:  Database [tyr]    Script Date: 16.06.2024 22:18:53 ******/
CREATE DATABASE [tyr]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tyr', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\tyr.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tyr_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\tyr_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [tyr] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tyr].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tyr] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tyr] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tyr] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tyr] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tyr] SET ARITHABORT OFF 
GO
ALTER DATABASE [tyr] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tyr] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tyr] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tyr] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tyr] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tyr] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tyr] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tyr] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tyr] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tyr] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tyr] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tyr] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tyr] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tyr] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tyr] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tyr] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tyr] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tyr] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tyr] SET  MULTI_USER 
GO
ALTER DATABASE [tyr] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tyr] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tyr] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tyr] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tyr] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tyr] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [tyr] SET QUERY_STORE = ON
GO
ALTER DATABASE [tyr] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [tyr]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 16.06.2024 22:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[TourID] [int] NULL,
	[BookingDate] [datetime] NULL,
	[Disability] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 16.06.2024 22:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[UserPatronymic] [nvarchar](100) NULL,
	[Email] [nvarchar](20) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientTour]    Script Date: 16.06.2024 22:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientTour](
	[ClientID] [int] NOT NULL,
	[TourID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Insurance]    Script Date: 16.06.2024 22:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insurance](
	[InsuranceID] [int] IDENTITY(1,1) NOT NULL,
	[IDServiceClients] [int] NULL,
	[Name] [nvarchar](150) NULL,
	[ExactPrice] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Insurance] PRIMARY KEY CLUSTERED 
(
	[InsuranceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotesAndWishes]    Script Date: 16.06.2024 22:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotesAndWishes](
	[ClientNotesID] [int] IDENTITY(1,1) NOT NULL,
	[ClientNotes] [nvarchar](150) NULL,
	[CustomerWishes] [nvarchar](150) NULL,
	[IDClient] [int] NULL,
 CONSTRAINT [PK_NotesAndWishes] PRIMARY KEY CLUSTERED 
(
	[ClientNotesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 16.06.2024 22:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 16.06.2024 22:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceClientsID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Price] [decimal](10, 2) NULL,
	[IDTour] [int] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceClientsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicesForDisabled]    Script Date: 16.06.2024 22:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicesForDisabled](
	[ServicesForTheDisableID] [int] IDENTITY(1,1) NOT NULL,
	[IDServiceClients] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Price] [decimal](10, 2) NULL,
 CONSTRAINT [PK_ServicesForDisabled] PRIMARY KEY CLUSTERED 
(
	[ServicesForTheDisableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tours]    Script Date: 16.06.2024 22:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tours](
	[TourID] [int] IDENTITY(1,1) NOT NULL,
	[TourName] [nvarchar](100) NULL,
	[Destination] [nvarchar](100) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Price] [decimal](10, 2) NULL,
	[IDUser] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usеr]    Script Date: 16.06.2024 22:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usеr](
	[UsеrID] [int] IDENTITY(1,1) NOT NULL,
	[IDRole] [int] NOT NULL,
	[UserSurname] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserPatronymic] [nvarchar](50) NULL,
	[UserLogin] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Usеr] PRIMARY KEY CLUSTERED 
(
	[UsеrID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ClientID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Client]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Tour] FOREIGN KEY([TourID])
REFERENCES [dbo].[Tours] ([TourID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Tour]
GO
ALTER TABLE [dbo].[Insurance]  WITH CHECK ADD  CONSTRAINT [FK_Insurance_ServicesForDisabled] FOREIGN KEY([IDServiceClients])
REFERENCES [dbo].[ServicesForDisabled] ([ServicesForTheDisableID])
GO
ALTER TABLE [dbo].[Insurance] CHECK CONSTRAINT [FK_Insurance_ServicesForDisabled]
GO
ALTER TABLE [dbo].[NotesAndWishes]  WITH CHECK ADD  CONSTRAINT [FK_NotesAndWishes_Client] FOREIGN KEY([IDClient])
REFERENCES [dbo].[Client] ([ClientID])
GO
ALTER TABLE [dbo].[NotesAndWishes] CHECK CONSTRAINT [FK_NotesAndWishes_Client]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Tours] FOREIGN KEY([IDTour])
REFERENCES [dbo].[Tours] ([TourID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Tours]
GO
ALTER TABLE [dbo].[ServicesForDisabled]  WITH CHECK ADD  CONSTRAINT [FK_ServicesForDisabled_Service] FOREIGN KEY([IDServiceClients])
REFERENCES [dbo].[Service] ([ServiceClientsID])
GO
ALTER TABLE [dbo].[ServicesForDisabled] CHECK CONSTRAINT [FK_ServicesForDisabled_Service]
GO
ALTER TABLE [dbo].[Tours]  WITH CHECK ADD  CONSTRAINT [FK_Tours_Usеr] FOREIGN KEY([IDUser])
REFERENCES [dbo].[Usеr] ([UsеrID])
GO
ALTER TABLE [dbo].[Tours] CHECK CONSTRAINT [FK_Tours_Usеr]
GO
ALTER TABLE [dbo].[Usеr]  WITH CHECK ADD  CONSTRAINT [FK_Usеr_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Usеr] CHECK CONSTRAINT [FK_Usеr_Role]
GO
ALTER TABLE [dbo].[Tours]  WITH CHECK ADD  CONSTRAINT [CK_Tours_Price] CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[Tours] CHECK CONSTRAINT [CK_Tours_Price]
GO
USE [master]
GO
ALTER DATABASE [tyr] SET  READ_WRITE 
GO
