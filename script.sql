USE [master]
GO
/****** Object:  Database [webpage]    Script Date: 19/05/2024 7:54:51 pm ******/
CREATE DATABASE [webpage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'webpage', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESSSERVER\MSSQL\DATA\webpage.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'webpage_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESSSERVER\MSSQL\DATA\webpage_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [webpage] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [webpage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [webpage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [webpage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [webpage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [webpage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [webpage] SET ARITHABORT OFF 
GO
ALTER DATABASE [webpage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [webpage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [webpage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [webpage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [webpage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [webpage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [webpage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [webpage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [webpage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [webpage] SET  DISABLE_BROKER 
GO
ALTER DATABASE [webpage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [webpage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [webpage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [webpage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [webpage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [webpage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [webpage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [webpage] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [webpage] SET  MULTI_USER 
GO
ALTER DATABASE [webpage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [webpage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [webpage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [webpage] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [webpage] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [webpage] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [webpage] SET QUERY_STORE = OFF
GO
USE [webpage]
GO
/****** Object:  Table [dbo].[achievements]    Script Date: 19/05/2024 7:54:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[achievements](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](max) NULL,
	[body] [text] NULL,
	[created_at] [timestamp] NULL,
 CONSTRAINT [PK_achievements] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 19/05/2024 7:54:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[quotes]    Script Date: 19/05/2024 7:54:51 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quotes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[author] [varchar](max) NULL,
	[quote] [varchar](max) NULL,
	[IsFavourite] [bit] NULL,
	[category_id] [int] NULL,
 CONSTRAINT [PK_quotes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[achievements] ON 

INSERT [dbo].[achievements] ([id], [title], [body]) VALUES (1, N'First Job', N'Having the offer to work in Fisher and Paykel Healthcare as a graduate product development engineer')
SET IDENTITY_INSERT [dbo].[achievements] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [name]) VALUES (1, N'Change')
INSERT [dbo].[category] ([id], [name]) VALUES (2, N'Ambition')
INSERT [dbo].[category] ([id], [name]) VALUES (3, N'Life and Love')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[quotes] ON 

INSERT [dbo].[quotes] ([id], [author], [quote], [IsFavourite], [category_id]) VALUES (25, NULL, N'Yesterday is history, tomorrow is a mystery, today is a gift of God, which is why we call it the present.', 0, 1)
INSERT [dbo].[quotes] ([id], [author], [quote], [IsFavourite], [category_id]) VALUES (26, N'Oprah Winfrey', N'Challenges are gifts that force us to search for a new center of gravity. Don’t fight them. Just find a new way to stand.', 0, 1)
INSERT [dbo].[quotes] ([id], [author], [quote], [IsFavourite], [category_id]) VALUES (27, N'Barack Obama', N'Change will not come if we wait for some other person or some other time. We are the ones we’ve been waiting for. We are the change that we seek.', 0, 1)
INSERT [dbo].[quotes] ([id], [author], [quote], [IsFavourite], [category_id]) VALUES (28, N'Alan Wilson Watts', N'The only way to make sense out of change is to plunge into it, move with it, and join the dance.', 0, 1)
INSERT [dbo].[quotes] ([id], [author], [quote], [IsFavourite], [category_id]) VALUES (29, N'Michael Jordan', N'Fear is an illusion. You think something is standing in your way, but nothing is really there. What is there is an opportunity to do your best and gain some success.', 0, 2)
INSERT [dbo].[quotes] ([id], [author], [quote], [IsFavourite], [category_id]) VALUES (30, N'Zig Ziglar', N'You don’t have to be great to start, but you have to start to be great', 0, 2)
INSERT [dbo].[quotes] ([id], [author], [quote], [IsFavourite], [category_id]) VALUES (31, N'Henry Ford', N'Thinking always ahead, thinking always of trying to do more, brings a state of mind in which nothing is impossible.', 0, 2)
INSERT [dbo].[quotes] ([id], [author], [quote], [IsFavourite], [category_id]) VALUES (32, N'William Shakespeare, “All’s Well That Ends Well”', N'Love all, trust a few, do wrong to none', 0, 2)
INSERT [dbo].[quotes] ([id], [author], [quote], [IsFavourite], [category_id]) VALUES (33, N'Dolly Parton', N'If you don’t like the road you’re walking, start paving another one.', 0, 3)
INSERT [dbo].[quotes] ([id], [author], [quote], [IsFavourite], [category_id]) VALUES (34, N'Unknown', N'Keep your face always toward the sunshine — and shadows will fall behind you.', 0, 3)
INSERT [dbo].[quotes] ([id], [author], [quote], [IsFavourite], [category_id]) VALUES (35, N'Unknown', N'Anyone who has never made a mistake has never tried anything new.', 0, 3)
INSERT [dbo].[quotes] ([id], [author], [quote], [IsFavourite], [category_id]) VALUES (36, N'Rosario Dawson', N'You only live once. You don’t want your tombstone to read: played it safe.', 0, 3)
INSERT [dbo].[quotes] ([id], [author], [quote], [IsFavourite], [category_id]) VALUES (37, N'fdsfafsafasff', N'sssdsds', NULL, NULL)
INSERT [dbo].[quotes] ([id], [author], [quote], [IsFavourite], [category_id]) VALUES (38, N'fdggfafgagfgfafgd', N'sdadad', NULL, NULL)
INSERT [dbo].[quotes] ([id], [author], [quote], [IsFavourite], [category_id]) VALUES (39, N'Sabrina', N'sdsdsd', NULL, NULL)
SET IDENTITY_INSERT [dbo].[quotes] OFF
GO
ALTER TABLE [dbo].[quotes]  WITH CHECK ADD  CONSTRAINT [FK_quotes_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[quotes] CHECK CONSTRAINT [FK_quotes_category]
GO
USE [master]
GO
ALTER DATABASE [webpage] SET  READ_WRITE 
GO
