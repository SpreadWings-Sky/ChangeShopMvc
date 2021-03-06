USE [master]
GO
/****** Object:  Database [ChangeDB]    Script Date: 2019/6/21 16:51:39 ******/
CREATE DATABASE [ChangeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChangeDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ChangeDB.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ChangeDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ChangeDB_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ChangeDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChangeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChangeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChangeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChangeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChangeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChangeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChangeDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChangeDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ChangeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChangeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChangeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChangeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChangeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChangeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChangeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChangeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChangeDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ChangeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChangeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChangeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChangeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChangeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChangeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChangeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChangeDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ChangeDB] SET  MULTI_USER 
GO
ALTER DATABASE [ChangeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChangeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChangeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChangeDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ChangeDB', N'ON'
GO
USE [ChangeDB]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 2019/6/21 16:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUser](
	[SuId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Pwd] [nvarchar](50) NOT NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Appraise]    Script Date: 2019/6/21 16:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appraise](
	[AppraiseId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[ProductId] [int] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Grade] [int] NULL,
	[RateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AppraiseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 2019/6/21 16:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CateId] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [nvarchar](50) NOT NULL,
	[ParentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 2019/6/21 16:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[DeliveryID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Consignee] [nvarchar](50) NOT NULL,
	[Complete] [nvarchar](200) NOT NULL,
	[Phone] [nvarchar](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Favorite]    Script Date: 2019/6/21 16:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[FavoriteID] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FavoriteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 2019/6/21 16:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[NTypes] [nvarchar](10) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[PhotoUrl] [nvarchar](200) NOT NULL,
	[PushTime] [datetime] NULL,
	[States] [int] NULL,
 CONSTRAINT [PK__News__954EBDD3698C4671] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2019/6/21 16:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrdersID] [int] IDENTITY(1,1) NOT NULL,
	[Orderdate] [date] NOT NULL,
	[UserId] [int] NULL,
	[Total] [money] NULL,
	[DeliveryID] [int] NULL,
	[DeliveryDate] [date] NULL,
	[States] [int] NULL,
	[Remark] [nvarchar](500) NULL,
 CONSTRAINT [PK__Orders__630B995669ED18DF] PRIMARY KEY CLUSTERED 
(
	[OrdersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrdersDetail]    Script Date: 2019/6/21 16:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetail](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrdersID] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[States] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Photo]    Script Date: 2019/6/21 16:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photo](
	[PhotoId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[PhotoUrl] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PhotoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 2019/6/21 16:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CateId] [int] NOT NULL,
	[MarketPrice] [money] NOT NULL,
	[Price] [money] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[PostTime] [datetime] NULL,
	[Stock] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 2019/6/21 16:51:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Pwd] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Nick] [nvarchar](50) NULL,
	[DeliveryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[AdminUser] ON 

INSERT [dbo].[AdminUser] ([SuId], [UserName], [Pwd], [role]) VALUES (1, N'admin', N'123', 1)
INSERT [dbo].[AdminUser] ([SuId], [UserName], [Pwd], [role]) VALUES (2, N'sysadmin', N'123', 0)
SET IDENTITY_INSERT [dbo].[AdminUser] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (1, N'服装', NULL)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (2, N'数码', NULL)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (3, N'家居', NULL)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (4, N'美妆', NULL)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (5, N'美食', NULL)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (6, N'母婴', NULL)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (7, N'上装', 1)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (8, N'裤子', 1)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (9, N'裙子', 1)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (10, N'帽子', 1)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (11, N'鞋子', 1)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (12, N'手套', 1)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (13, N'手机', 2)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (14, N'电脑', 2)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (15, N'配件', 2)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (16, N'智能硬件', 2)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (17, N'数码', 2)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (18, N'家具', 3)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (19, N'厨具', 3)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (20, N'家纺', 3)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (21, N'生活日用', 3)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (22, N'灯具', 3)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (23, N'卫浴', 3)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (24, N'五金', 3)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (25, N'护肤', 4)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (26, N'彩妆', 4)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (27, N'洗发护发', 4)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (28, N'身体护理', 4)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (29, N'茶叶', 5)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (30, N'零食', 5)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (31, N'咖啡', 5)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (32, N'水果', 5)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (33, N'巧克力', 5)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (34, N'奶粉', 6)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (35, N'辅食', 6)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (36, N'玩具', 6)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (37, N'喂养', 6)
INSERT [dbo].[Category] ([CateId], [CateName], [ParentId]) VALUES (38, N'洗护', 6)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([DeliveryID], [UserId], [Consignee], [Complete], [Phone]) VALUES (1, 1, N'小白', N'湖北省荆州市沙市区中山路9号201', N'139*****011')
INSERT [dbo].[Delivery] ([DeliveryID], [UserId], [Consignee], [Complete], [Phone]) VALUES (2, 2, N'妞妞', N'湖南省长沙市湘潭路28号', N'139*****012')
INSERT [dbo].[Delivery] ([DeliveryID], [UserId], [Consignee], [Complete], [Phone]) VALUES (3, 3, N'李老哥', N'重庆市解放碑路88号', N'139*****013')
SET IDENTITY_INSERT [dbo].[Delivery] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsID], [Title], [NTypes], [Content], [PhotoUrl], [PushTime], [States]) VALUES (1, N'促销活动1', N'促销活动', N'促销活动', N'/images/bannel1.jpg', CAST(0x0000AA7200FF38EB AS DateTime), 1)
INSERT [dbo].[News] ([NewsID], [Title], [NTypes], [Content], [PhotoUrl], [PushTime], [States]) VALUES (2, N'促销活动2', N'促销活动', N'促销活动', N'/images/bannel2.jpg', CAST(0x0000AA7200FF38EB AS DateTime), 0)
INSERT [dbo].[News] ([NewsID], [Title], [NTypes], [Content], [PhotoUrl], [PushTime], [States]) VALUES (3, N'促销活动3', N'促销活动', N'促销活动', N'/images/bannel3.jpg', CAST(0x0000AA7200FF38EB AS DateTime), 0)
INSERT [dbo].[News] ([NewsID], [Title], [NTypes], [Content], [PhotoUrl], [PushTime], [States]) VALUES (4, N'活动咨询1', N'活动咨询', N'活动咨询', N'/images/bannel4.jpg', CAST(0x0000AA7200FF38EB AS DateTime), 0)
INSERT [dbo].[News] ([NewsID], [Title], [NTypes], [Content], [PhotoUrl], [PushTime], [States]) VALUES (5, N'活动咨询2', N'活动咨询', N'活动咨询', N'/images/bannel5.jpg', CAST(0x0000AA7200FF38EB AS DateTime), 0)
INSERT [dbo].[News] ([NewsID], [Title], [NTypes], [Content], [PhotoUrl], [PushTime], [States]) VALUES (6, N'大宗礼品1', N'大宗礼品', N'大宗礼品', N'/images/bannel6.jpg', CAST(0x0000AA7200FF38EB AS DateTime), 0)
INSERT [dbo].[News] ([NewsID], [Title], [NTypes], [Content], [PhotoUrl], [PushTime], [States]) VALUES (7, N'大宗礼品2', N'大宗礼品', N'大宗礼品', N'/images/bannel7.jpg', CAST(0x0000AA7200FF38EB AS DateTime), 0)
INSERT [dbo].[News] ([NewsID], [Title], [NTypes], [Content], [PhotoUrl], [PushTime], [States]) VALUES (8, N'大宗礼品3', N'大宗礼品', N'大宗礼品', N'/images/bannel8.jpg', CAST(0x0000AA7200FF38EB AS DateTime), 1)
INSERT [dbo].[News] ([NewsID], [Title], [NTypes], [Content], [PhotoUrl], [PushTime], [States]) VALUES (9, N'111', N'大宗礼品', N'<p>111</p>', N'/images/2.jpg', CAST(0x0000AA7300EB1B80 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserId], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (1, CAST(0xCE3F0B00 AS Date), 1, 121.0000, 1, NULL, 0, N'111')
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserId], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (2, CAST(0xCE3F0B00 AS Date), 1, 1999.0000, 1, NULL, 0, N'111')
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserId], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (3, CAST(0xCE3F0B00 AS Date), 1, 44.0000, 1, NULL, 0, N'333')
INSERT [dbo].[Orders] ([OrdersID], [Orderdate], [UserId], [Total], [DeliveryID], [DeliveryDate], [States], [Remark]) VALUES (4, CAST(0xCE3F0B00 AS Date), 1, 1999.0000, 1, NULL, 1, N'44444')
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[OrdersDetail] ON 

INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductId], [Quantity], [States]) VALUES (1, 2, 9, 1, NULL)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductId], [Quantity], [States]) VALUES (2, 3, 3, 1, NULL)
INSERT [dbo].[OrdersDetail] ([DetailID], [OrdersID], [ProductId], [Quantity], [States]) VALUES (3, 4, 9, 1, NULL)
SET IDENTITY_INSERT [dbo].[OrdersDetail] OFF
SET IDENTITY_INSERT [dbo].[Photo] ON 

INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (1, 4, N'/images/Goods/show_20171127030848903.jpg')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (2, 4, N'/images/Goods/show_20171127031157715.jpg')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (3, 3, N'/images/Goods/show_20100824041036819.jpg')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (4, 5, N'/images/Goods/show_20100824041514147.jpg')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (5, 8, N'/images/Goods/红米2-1.PNG')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (6, 8, N'/images/Goods/红米2-2.PNG')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (7, 8, N'/images/Goods/红米2-3.PNG')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (8, 8, N'/images/Goods/红米2-4.PNG')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (9, 8, N'/images/Goods/红米2-5.PNG')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (10, 9, N'/images/Goods/华为matel8.png')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (11, 10, N'/images/Goods/华为荣耀7i.png')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (12, 11, N'/images/Goods/魅族matel套餐.png')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (13, 12, N'/images/Goods/魅族Pro5 白色套餐.png')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (14, 13, N'/images/Goods/XIAOMI5.jpg')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (15, 14, N'/images/Goods/food2.jpg')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (16, 15, N'/images/Goods/food1.jpg')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (17, 16, N'/images/Goods/fan2.jpeg')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (18, 17, N'/images/Goods/fan5.jpeg')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (19, 18, N'/images/Goods/fan6.jpeg')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (20, 19, N'/images/Goods/fan1.jpeg')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (22, 7, N'/images/Goods/show_20171127031652003.jpg')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (23, 2, N'/images/Goods/show_20171127031730253.jpg')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (24, 6, N'/images/Goods/show_20100824041205663.jpg')
INSERT [dbo].[Photo] ([PhotoId], [ProductId], [PhotoUrl]) VALUES (25, 1, N'/images/Goods/show_20180808000000005.jpg')
SET IDENTITY_INSERT [dbo].[Photo] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [Title], [CateId], [MarketPrice], [Price], [Content], [PostTime], [Stock]) VALUES (1, N'蓝碧草板鞋', 11, 144.0000, 121.0000, N'<h4>潮流一词，最早源于英文&ldquo;<a href="https://baike.baidu.com/item/TREND" style="color: rgb(19, 110, 194); text-decoration: none;" target="_blank">TREND</a>&rdquo;，90年代初，由日本时尚前沿人群率先翻译为潮流，后传入香港和台湾，2000年前后，国内出现首批潮流爱好者，称为&ldquo;<a href="https://baike.baidu.com/item/%E6%BD%AE%E4%BA%BA/3424418" data-lemmaid="3424418" style="color: rgb(19, 110, 194); text-decoration: none;" target="_blank">潮人</a>&rdquo;。潮人大多都是从球鞋、<a href="https://baike.baidu.com/item/%E6%9D%BF%E9%9E%8B" style="color: rgb(19, 110, 194); text-decoration: none;" target="_blank">板鞋</a>爱好者转变而来，从最初对鞋的热爱，演变到更广泛的对新锐品牌、新锐设计的热爱。</h4>
<h4>由于<a href="https://baike.baidu.com/item/%E9%99%88%E5%86%A0%E5%B8%8C" style="color: rgb(19, 110, 194); text-decoration: none;" target="_blank">陈冠希</a>、<a href="https://baike.baidu.com/item/%E4%BD%99%E6%96%87%E4%B9%90" style="color: rgb(19, 110, 194); text-decoration: none;" target="_blank">余文乐</a>、<a href="https://baike.baidu.com/item/%E6%9D%8E%E7%81%BF%E6%A3%AE" style="color: rgb(19, 110, 194); text-decoration: none;" target="_blank">李灿森</a>等香港艺人的关系，日本潮流对中国潮流文化影响极其深远，<a href="https://baike.baidu.com/item/BAPE" style="color: rgb(19, 110, 194); text-decoration: none;" target="_blank">BAPE</a>、<a href="https://baike.baidu.com/item/MMJ" style="color: rgb(19, 110, 194); text-decoration: none;" target="_blank">MMJ</a>、<a href="https://baike.baidu.com/item/VISVIM" style="color: rgb(19, 110, 194); text-decoration: none;" target="_blank">VISVIM</a>等日系品牌全盛时期，几乎就是潮流的代名词。国内的潮流文化起步晚，但是发展得相当好，短短十几年时间，潮流已经从一个小众概念演变成一个几乎能与时尚相提并论的热门词汇，潮人也不再是少数人，而是相当大一部分年轻人的称谓。</h4>
<h4>潮流相关产业也蓬勃发展，诞生了如同<a href="https://baike.baidu.com/item/SIZE" style="color: rgb(19, 110, 194); text-decoration: none;" target="_blank">SIZE</a>、<a href="https://baike.baidu.com/item/WPLUX" style="color: rgb(19, 110, 194); text-decoration: none;" target="_blank">WPLUX</a>、<a href="https://baike.baidu.com/item/CK" style="color: rgb(19, 110, 194); text-decoration: none;" target="_blank">CK</a>论坛、<a href="https://baike.baidu.com/item/WEALTHY%20PERFUME" style="color: rgb(19, 110, 194); text-decoration: none;" target="_blank">WEALTHY PERFUME</a>、1626、NPC等相当高知名度的潮流单位。潮流文化也变成更加包罗万象，不再仅仅是时尚品牌和服饰了，它渗透进了大众生活的方方面面，小到一个杯子、一张<a href="https://baike.baidu.com/item/%E8%B4%B4%E7%BA%B8" style="color: rgb(19, 110, 194); text-decoration: none;" target="_blank">贴纸</a>，大到家电、汽车，可能你都能发现潮流文</h4>
<div class="para-title level-3" label-module="para-title" style="clear: both; zoom: 1; margin: 20px 0px 12px; line-height: 20px; font-size: 18px; font-weight: normal; font-family: &quot;Microsoft YaHei&quot;, SimHei, Verdana; color: rgb(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
<h4>&nbsp;</h4>
</div>
<div class="para" label-module="para" style="font-size: 14px; word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);">
<h4>&nbsp;</h4>
<h4>服装潮流是一种态度的流行。何谓潮流？一种人人都向往而追随着某种事物，从而形成一股热浪？</h4>
</div>
<h4>可当人人都拥有种种些许的<a href="https://baike.baidu.com/item/%E6%BD%AE%E6%B5%81%E5%85%83%E7%B4%A0" style="color: rgb(19, 110, 194); text-decoration: none;" target="_blank">潮流元素</a>之后，流行也就无所谓了。在我看来，&ldquo;流行&rdquo;这个词只是存在于率先发起潮流少数人的专用词汇。而对于大多数人来讲，潮流的东西就是一种态度，一种感觉的盛行，能够&ldquo;自我感觉良好&rdquo;就是很不错的境界了。</h4>', CAST(0x00009DDC00B595F0 AS DateTime), 34)
INSERT [dbo].[Product] ([ProductId], [Title], [CateId], [MarketPrice], [Price], [Content], [PostTime], [Stock]) VALUES (2, N'太平鸟', 7, 500.0000, 600.0000, N'品牌: Qingsenuzhu/青涩女主适用年龄: 18-24周岁尺码: S M L XL 2XL 3XL图案: 字母风格: 通勤通勤: 韩版领型: 圆领流行元素: 印花主要颜色: 3302#紫色 3302#蓝色 3302#白色 3302#绿色 3308#紫色 3308#白色 3308#绿色 3308#黑色 3308#咖色 2件装袖型: 常规货号: 33302图案文化: 青春年份季节: 2019年夏季袖长: 短袖衣长: 常规款服装版型: 宽松销售渠道类型: 纯电商(只在线上销售)材质成分: 棉95% 聚氨酯弹性纤维(氨纶)5%', CAST(0x0000A7D900B595F0 AS DateTime), 2345)
INSERT [dbo].[Product] ([ProductId], [Title], [CateId], [MarketPrice], [Price], [Content], [PostTime], [Stock]) VALUES (3, N'班尼路男士短袖衬衣', 7, 45.0000, 44.0000, N'品牌: Qingsenuzhu/青涩女主适用年龄: 18-24周岁尺码: S M L XL 2XL 3XL图案: 字母风格: 通勤通勤: 韩版领型: 圆领流行元素: 印花主要颜色: 3302#紫色 3302#蓝色 3302#白色 3302#绿色 3308#紫色 3308#白色 3308#绿色 3308#黑色 3308#咖色 2件装袖型: 常规货号: 33302图案文化: 青春年份季节: 2019年夏季袖长: 短袖衣长: 常规款服装版型: 宽松销售渠道类型: 纯电商(只在线上销售)材质成分: 棉95% 聚氨酯弹性纤维(氨纶)5%', CAST(0x0000A94600B595F0 AS DateTime), 33)
INSERT [dbo].[Product] ([ProductId], [Title], [CateId], [MarketPrice], [Price], [Content], [PostTime], [Stock]) VALUES (4, N'特价短袖', 7, 45.0000, 30.0000, N'品牌: Qingsenuzhu/青涩女主适用年龄: 18-24周岁尺码: S M L XL 2XL 3XL图案: 字母风格: 通勤通勤: 韩版领型: 圆领流行元素: 印花主要颜色: 3302#紫色 3302#蓝色 3302#白色 3302#绿色 3308#紫色 3308#白色 3308#绿色 3308#黑色 3308#咖色 2件装袖型: 常规货号: 33302图案文化: 青春年份季节: 2019年夏季袖长: 短袖衣长: 常规款服装版型: 宽松销售渠道类型: 纯电商(只在线上销售)材质成分: 棉95% 聚氨酯弹性纤维(氨纶)5%', CAST(0x0000A9FE00B595F0 AS DateTime), 22)
INSERT [dbo].[Product] ([ProductId], [Title], [CateId], [MarketPrice], [Price], [Content], [PostTime], [Stock]) VALUES (5, N'宜宾特价短袖', 7, 45.0000, 30.0000, N'品牌: Qingsenuzhu/青涩女主适用年龄: 18-24周岁尺码: S M L XL 2XL 3XL图案: 字母风格: 通勤通勤: 韩版领型: 圆领流行元素: 印花主要颜色: 3302#紫色 3302#蓝色 3302#白色 3302#绿色 3308#紫色 3308#白色 3308#绿色 3308#黑色 3308#咖色 2件装袖型: 常规货号: 33302图案文化: 青春年份季节: 2019年夏季袖长: 短袖衣长: 常规款服装版型: 宽松销售渠道类型: 纯电商(只在线上销售)材质成分: 棉95% 聚氨酯弹性纤维(氨纶)5%', CAST(0x0000A8CC00B595F0 AS DateTime), 378)
INSERT [dbo].[Product] ([ProductId], [Title], [CateId], [MarketPrice], [Price], [Content], [PostTime], [Stock]) VALUES (6, N'尚曼格特价短袖', 7, 45.0000, 30.0000, N'品牌: Qingsenuzhu/青涩女主适用年龄: 18-24周岁尺码: S M L XL 2XL 3XL图案: 字母风格: 通勤通勤: 韩版领型: 圆领流行元素: 印花主要颜色: 3302#紫色 3302#蓝色 3302#白色 3302#绿色 3308#紫色 3308#白色 3308#绿色 3308#黑色 3308#咖色 2件装袖型: 常规货号: 33302图案文化: 青春年份季节: 2019年夏季袖长: 短袖衣长: 常规款服装版型: 宽松销售渠道类型: 纯电商(只在线上销售)材质成分: 棉95% 聚氨酯弹性纤维(氨纶)5%', CAST(0x0000A66C00B595F0 AS DateTime), 3456)
INSERT [dbo].[Product] ([ProductId], [Title], [CateId], [MarketPrice], [Price], [Content], [PostTime], [Stock]) VALUES (7, N'希尼亚男士西服', 7, 45.0000, 30.0000, N'品牌: Qingsenuzhu/青涩女主适用年龄: 18-24周岁尺码: S M L XL 2XL 3XL图案: 字母风格: 通勤通勤: 韩版领型: 圆领流行元素: 印花主要颜色: 3302#紫色 3302#蓝色 3302#白色 3302#绿色 3308#紫色 3308#白色 3308#绿色 3308#黑色 3308#咖色 2件装袖型: 常规货号: 33302图案文化: 青春年份季节: 2019年夏季袖长: 短袖衣长: 常规款服装版型: 宽松销售渠道类型: 纯电商(只在线上销售)材质成分: 棉95% 聚氨酯弹性纤维(氨纶)5%', CAST(0x0000A7D900B595F0 AS DateTime), 1234)
INSERT [dbo].[Product] ([ProductId], [Title], [CateId], [MarketPrice], [Price], [Content], [PostTime], [Stock]) VALUES (8, N'红米2', 13, 2300.0000, 1999.0000, N'红米2', CAST(0x0000A83700B0D7E0 AS DateTime), 46)
INSERT [dbo].[Product] ([ProductId], [Title], [CateId], [MarketPrice], [Price], [Content], [PostTime], [Stock]) VALUES (9, N'华为mate', 13, 2300.0000, 1999.0000, N'华为mate', CAST(0x0000A83700B0D7E0 AS DateTime), 44)
INSERT [dbo].[Product] ([ProductId], [Title], [CateId], [MarketPrice], [Price], [Content], [PostTime], [Stock]) VALUES (10, N'华为荣耀7i', 13, 2300.0000, 1999.0000, N'华为荣耀7i', CAST(0x0000A83700B0D7E0 AS DateTime), 46)
INSERT [dbo].[Product] ([ProductId], [Title], [CateId], [MarketPrice], [Price], [Content], [PostTime], [Stock]) VALUES (11, N'魅族mate', 13, 2300.0000, 1999.0000, N'魅族mate', CAST(0x0000A83700B0D7E0 AS DateTime), 46)
INSERT [dbo].[Product] ([ProductId], [Title], [CateId], [MarketPrice], [Price], [Content], [PostTime], [Stock]) VALUES (12, N'魅族Pro5', 13, 2300.0000, 1999.0000, N'魅族Pro5', CAST(0x0000A83700B0D7E0 AS DateTime), 46)
INSERT [dbo].[Product] ([ProductId], [Title], [CateId], [MarketPrice], [Price], [Content], [PostTime], [Stock]) VALUES (13, N'小米5', 13, 2300.0000, 1999.0000, N'小米5', CAST(0x0000A83700B0D7E0 AS DateTime), 46)
INSERT [dbo].[Product] ([ProductId], [Title], [CateId], [MarketPrice], [Price], [Content], [PostTime], [Stock]) VALUES (14, N'怀山堂山药', 23, 22.0000, 19.0000, N'零食', CAST(0x0000A83700B0D7E0 AS DateTime), 46)
INSERT [dbo].[Product] ([ProductId], [Title], [CateId], [MarketPrice], [Price], [Content], [PostTime], [Stock]) VALUES (15, N'阿根廷牛肉', 23, 22.0000, 19.0000, N'零食', CAST(0x0000A83700B0D7E0 AS DateTime), 46)
INSERT [dbo].[Product] ([ProductId], [Title], [CateId], [MarketPrice], [Price], [Content], [PostTime], [Stock]) VALUES (16, N'酱爆鸡腿饭', 23, 22.0000, 19.0000, N'零食', CAST(0x0000A83700B0D7E0 AS DateTime), 46)
INSERT [dbo].[Product] ([ProductId], [Title], [CateId], [MarketPrice], [Price], [Content], [PostTime], [Stock]) VALUES (17, N'红烧排骨饭', 23, 22.0000, 19.0000, N'零食', CAST(0x0000A83700B0D7E0 AS DateTime), 46)
INSERT [dbo].[Product] ([ProductId], [Title], [CateId], [MarketPrice], [Price], [Content], [PostTime], [Stock]) VALUES (18, N'咖喱牛肉饭', 23, 22.0000, 19.0000, N'零食', CAST(0x0000A83700B0D7E0 AS DateTime), 46)
INSERT [dbo].[Product] ([ProductId], [Title], [CateId], [MarketPrice], [Price], [Content], [PostTime], [Stock]) VALUES (19, N'梅菜扣肉饭', 23, 22.0000, 19.0000, N'零食', CAST(0x0000A83700B0D7E0 AS DateTime), 46)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserName], [Pwd], [Email], [Nick], [DeliveryID]) VALUES (1, N'xiaobai', N'111', N'xiaobai@163.com', N'x小白', NULL)
INSERT [dbo].[Users] ([UserId], [UserName], [Pwd], [Email], [Nick], [DeliveryID]) VALUES (2, N'niu', N'111', N'zhangsan@163.com', N'妞妞', NULL)
INSERT [dbo].[Users] ([UserId], [UserName], [Pwd], [Email], [Nick], [DeliveryID]) VALUES (3, N'lisi', N'111', N'lisi@163.com', N'李老哥', NULL)
INSERT [dbo].[Users] ([UserId], [UserName], [Pwd], [Email], [Nick], [DeliveryID]) VALUES (4, N'wangwu', N'111', N'wangwu@163.com', N'爱妃', NULL)
INSERT [dbo].[Users] ([UserId], [UserName], [Pwd], [Email], [Nick], [DeliveryID]) VALUES (5, N'test', N'111', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserId], [UserName], [Pwd], [Email], [Nick], [DeliveryID]) VALUES (6, N'111', N'111', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__C9F28456A71EC068]    Script Date: 2019/6/21 16:51:39 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appraise] ADD  DEFAULT ((0)) FOR [Grade]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__Orderdat__276EDEB3]  DEFAULT (getdate()) FOR [Orderdate]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [PostTime]
GO
ALTER TABLE [dbo].[Appraise]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Appraise]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD FOREIGN KEY([ParentId])
REFERENCES [dbo].[Category] ([CateId])
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__Delivery__29572725] FOREIGN KEY([DeliveryID])
REFERENCES [dbo].[Delivery] ([DeliveryID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__Delivery__29572725]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__UserId__286302EC] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__UserId__286302EC]
GO
ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrdersDet__Order__2C3393D0] FOREIGN KEY([OrdersID])
REFERENCES [dbo].[Orders] ([OrdersID])
GO
ALTER TABLE [dbo].[OrdersDetail] CHECK CONSTRAINT [FK__OrdersDet__Order__2C3393D0]
GO
ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Photo]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CateId])
REFERENCES [dbo].[Category] ([CateId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Delivery] FOREIGN KEY([DeliveryID])
REFERENCES [dbo].[Delivery] ([DeliveryID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Delivery]
GO
USE [master]
GO
ALTER DATABASE [ChangeDB] SET  READ_WRITE 
GO
