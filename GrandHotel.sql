USE [master]
GO
/****** Object:  Database [GrandHotel]    Script Date: 11/7/2022 9:50:39 AM ******/
CREATE DATABASE [GrandHotel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GrandHotel', FILENAME = N'D:\Program Files\MSSQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\GrandHotel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GrandHotel_log', FILENAME = N'D:\Program Files\MSSQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\GrandHotel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GrandHotel] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GrandHotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GrandHotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GrandHotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GrandHotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GrandHotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GrandHotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [GrandHotel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GrandHotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GrandHotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GrandHotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GrandHotel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GrandHotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GrandHotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GrandHotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GrandHotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GrandHotel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GrandHotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GrandHotel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GrandHotel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GrandHotel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GrandHotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GrandHotel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GrandHotel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GrandHotel] SET RECOVERY FULL 
GO
ALTER DATABASE [GrandHotel] SET  MULTI_USER 
GO
ALTER DATABASE [GrandHotel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GrandHotel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GrandHotel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GrandHotel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GrandHotel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GrandHotel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GrandHotel', N'ON'
GO
ALTER DATABASE [GrandHotel] SET QUERY_STORE = OFF
GO
USE [GrandHotel]
GO
/****** Object:  Table [dbo].[CleaningRoom]    Script Date: 11/7/2022 9:50:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CleaningRoom](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_CleaningRoom] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CleaningRoomDetail]    Script Date: 11/7/2022 9:50:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CleaningRoomDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CleaningRoomID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[FinishDateTime] [datetime] NOT NULL,
	[Note] [text] NOT NULL,
	[StatusCleaning] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CleaningRoomDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CleaningRoomItem]    Script Date: 11/7/2022 9:50:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CleaningRoomItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CleaningRoomDetailID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CleaningRoomItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/7/2022 9:50:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[NIK] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Gender] [char](1) NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Age] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dTime]    Script Date: 11/7/2022 9:50:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dTime](
	[DateTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/7/2022 9:50:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[JobID] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 11/7/2022 9:50:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[RequestPrice] [int] NOT NULL,
	[CompensationFee] [int] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemStatus]    Script Date: 11/7/2022 9:50:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ItemStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 11/7/2022 9:50:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 11/7/2022 9:50:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationCheckOut]    Script Date: 11/7/2022 9:50:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationCheckOut](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReservationRoomID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[ItemStatusID] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[TotalCharge] [int] NOT NULL,
 CONSTRAINT [PK_ReservationCheckOut] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationRequestItem]    Script Date: 11/7/2022 9:50:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationRequestItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReservationRoomID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[TotalPrice] [int] NOT NULL,
 CONSTRAINT [PK_ReservationRequestItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationRoom]    Script Date: 11/7/2022 9:50:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationRoom](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReservationID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[StartDateTime] [date] NOT NULL,
	[DurationNights] [int] NOT NULL,
	[RoomPrice] [int] NOT NULL,
	[CheckInDateTime] [datetime] NOT NULL,
	[CheckOutDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ReservationRoom] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 11/7/2022 9:50:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomTypeID] [int] NOT NULL,
	[RoomNumber] [varchar](50) NOT NULL,
	[RoomFloor] [varchar](50) NOT NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 11/7/2022 9:50:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Capacity] [varchar](50) NOT NULL,
	[RoomPrice] [int] NOT NULL,
 CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CleaningRoom]  WITH CHECK ADD  CONSTRAINT [FK_CleaningRoom_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[CleaningRoom] CHECK CONSTRAINT [FK_CleaningRoom_Employee]
GO
ALTER TABLE [dbo].[CleaningRoomDetail]  WITH CHECK ADD  CONSTRAINT [FK_CleaningRoomDetail_CleaningRoom] FOREIGN KEY([CleaningRoomID])
REFERENCES [dbo].[CleaningRoom] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CleaningRoomDetail] CHECK CONSTRAINT [FK_CleaningRoomDetail_CleaningRoom]
GO
ALTER TABLE [dbo].[CleaningRoomDetail]  WITH CHECK ADD  CONSTRAINT [FK_CleaningRoomDetail_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([ID])
GO
ALTER TABLE [dbo].[CleaningRoomDetail] CHECK CONSTRAINT [FK_CleaningRoomDetail_Room]
GO
ALTER TABLE [dbo].[CleaningRoomItem]  WITH CHECK ADD  CONSTRAINT [FK_CleaningRoomItem_CleaningRoomDetail] FOREIGN KEY([CleaningRoomDetailID])
REFERENCES [dbo].[CleaningRoomDetail] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CleaningRoomItem] CHECK CONSTRAINT [FK_CleaningRoomItem_CleaningRoomDetail]
GO
ALTER TABLE [dbo].[CleaningRoomItem]  WITH CHECK ADD  CONSTRAINT [FK_CleaningRoomItem_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ID])
GO
ALTER TABLE [dbo].[CleaningRoomItem] CHECK CONSTRAINT [FK_CleaningRoomItem_Item]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Job] FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Job]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Customer]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Employee]
GO
ALTER TABLE [dbo].[ReservationCheckOut]  WITH CHECK ADD  CONSTRAINT [FK_ReservationCheckOut_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ID])
GO
ALTER TABLE [dbo].[ReservationCheckOut] CHECK CONSTRAINT [FK_ReservationCheckOut_Item]
GO
ALTER TABLE [dbo].[ReservationCheckOut]  WITH CHECK ADD  CONSTRAINT [FK_ReservationCheckOut_ItemStatus] FOREIGN KEY([ItemStatusID])
REFERENCES [dbo].[ItemStatus] ([ID])
GO
ALTER TABLE [dbo].[ReservationCheckOut] CHECK CONSTRAINT [FK_ReservationCheckOut_ItemStatus]
GO
ALTER TABLE [dbo].[ReservationCheckOut]  WITH CHECK ADD  CONSTRAINT [FK_ReservationCheckOut_ReservationRoom] FOREIGN KEY([ReservationRoomID])
REFERENCES [dbo].[Reservation] ([ID])
GO
ALTER TABLE [dbo].[ReservationCheckOut] CHECK CONSTRAINT [FK_ReservationCheckOut_ReservationRoom]
GO
ALTER TABLE [dbo].[ReservationRoom]  WITH CHECK ADD  CONSTRAINT [FK_ReservationRoom_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([ID])
GO
ALTER TABLE [dbo].[ReservationRoom] CHECK CONSTRAINT [FK_ReservationRoom_Room]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomType] FOREIGN KEY([RoomTypeID])
REFERENCES [dbo].[RoomType] ([ID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomType]
GO
USE [master]
GO
ALTER DATABASE [GrandHotel] SET  READ_WRITE 
GO
