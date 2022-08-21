USE [Exchange]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BCH_BTC_CandleStick](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Close] [decimal](18, 0) NOT NULL,
	[CloseTime] [datetime] NOT NULL,
	[High] [decimal](18, 0) NOT NULL,
	[Low] [decimal](18, 0) NOT NULL,
	[Open] [decimal](18, 0) NOT NULL,
	[OpenTime] [datetime] NOT NULL,
 CONSTRAINT [PK_BCH_BTC_CandleStick] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BCH_BTC_ClosedOrders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ClosedDate] [datetime] NOT NULL,
	[IsBuy] [bit] NOT NULL,
	[StartPrice] [decimal](38, 20) NOT NULL,
	[Difference] [decimal](38, 20) NOT NULL,
	[ClosedPrice] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
	[BoughtUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_BCH_BTC_ClosedOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BCH_BTC_OpenOrders_Buy](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_BCH_BTC_OpenOrders_Buy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BCH_BTC_OpenOrders_Sell](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_BCH_BTC_OpenOrders_Sell] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BCH_USDT_CandleStick](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Close] [decimal](18, 0) NOT NULL,
	[CloseTime] [datetime] NOT NULL,
	[High] [decimal](18, 0) NOT NULL,
	[Low] [decimal](18, 0) NOT NULL,
	[Open] [decimal](18, 0) NOT NULL,
	[OpenTime] [datetime] NOT NULL,
 CONSTRAINT [PK_BCH_USDT_CandleStick] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BCH_USDT_ClosedOrders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ClosedDate] [datetime] NOT NULL,
	[IsBuy] [bit] NOT NULL,
	[StartPrice] [decimal](38, 20) NOT NULL,
	[Difference] [decimal](38, 20) NOT NULL,
	[ClosedPrice] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
	[BoughtUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_BCH_USDT_ClosedOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BCH_USDT_OpenOrders_Buy](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_BCH_USDT_OpenOrders_Buy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BCH_USDT_OpenOrders_Sell](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_BCH_USDT_OpenOrders_Sell] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bots](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[BotAuthCode] [nvarchar](450) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Bots] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTC_USDT_CandleStick](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Close] [decimal](18, 0) NOT NULL,
	[CloseTime] [datetime] NOT NULL,
	[High] [decimal](18, 0) NOT NULL,
	[Low] [decimal](18, 0) NOT NULL,
	[Open] [decimal](18, 0) NOT NULL,
	[OpenTime] [datetime] NOT NULL,
 CONSTRAINT [PK_BTC_USDT_CandleStick] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTC_USDT_ClosedOrders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ClosedDate] [datetime] NOT NULL,
	[IsBuy] [bit] NOT NULL,
	[StartPrice] [decimal](38, 20) NOT NULL,
	[Difference] [decimal](38, 20) NOT NULL,
	[ClosedPrice] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
	[BoughtUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_BTC_USDT_ClosedOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTC_USDT_OpenOrders_Buy](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_BTC_USDT_OpenOrders_Buy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BTC_USDT_OpenOrders_Sell](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_BTC_USDT_OpenOrders_Sell] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currencies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Acronim] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Created] [datetime] NOT NULL,
	[PercentCommissionForIncomeTransaction] [decimal](38, 20) NULL,
	[PercentCommissionForTransfer] [decimal](38, 20) NULL,
	[PercentCommissionForOutcomeTransaction] [decimal](38, 20) NULL,
	[PercentCommissionForTrade] [decimal](38, 20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DASH_BTC_CandleStick](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Close] [decimal](18, 0) NOT NULL,
	[CloseTime] [datetime] NOT NULL,
	[High] [decimal](18, 0) NOT NULL,
	[Low] [decimal](18, 0) NOT NULL,
	[Open] [decimal](18, 0) NOT NULL,
	[OpenTime] [datetime] NOT NULL,
 CONSTRAINT [PK_DASH_BTC_CandleStick] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DASH_BTC_ClosedOrders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ClosedDate] [datetime] NOT NULL,
	[IsBuy] [bit] NOT NULL,
	[StartPrice] [decimal](38, 20) NOT NULL,
	[Difference] [decimal](38, 20) NOT NULL,
	[ClosedPrice] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
	[BoughtUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_DASH_BTC_ClosedOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DASH_BTC_OpenOrders_Buy](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_DASH_BTC_OpenOrders_Buy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DASH_BTC_OpenOrders_Sell](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_DASH_BTC_OpenOrders_Sell] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DASH_USDT_CandleStick](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Close] [decimal](18, 0) NOT NULL,
	[CloseTime] [datetime] NOT NULL,
	[High] [decimal](18, 0) NOT NULL,
	[Low] [decimal](18, 0) NOT NULL,
	[Open] [decimal](18, 0) NOT NULL,
	[OpenTime] [datetime] NOT NULL,
 CONSTRAINT [PK_DASH_USDT_CandleStick] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DASH_USDT_ClosedOrders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ClosedDate] [datetime] NOT NULL,
	[IsBuy] [bit] NOT NULL,
	[StartPrice] [decimal](38, 20) NOT NULL,
	[Difference] [decimal](38, 20) NOT NULL,
	[ClosedPrice] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
	[BoughtUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_DASH_USDT_ClosedOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DASH_USDT_OpenOrders_Buy](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_DASH_USDT_OpenOrders_Buy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DASH_USDT_OpenOrders_Sell](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_DASH_USDT_OpenOrders_Sell] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOGE_BTC_CandleStick](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Close] [decimal](18, 0) NOT NULL,
	[CloseTime] [datetime] NOT NULL,
	[High] [decimal](18, 0) NOT NULL,
	[Low] [decimal](18, 0) NOT NULL,
	[Open] [decimal](18, 0) NOT NULL,
	[OpenTime] [datetime] NOT NULL,
 CONSTRAINT [PK_DOGE_BTC_CandleStick] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOGE_BTC_ClosedOrders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ClosedDate] [datetime] NOT NULL,
	[IsBuy] [bit] NOT NULL,
	[StartPrice] [decimal](38, 20) NOT NULL,
	[Difference] [decimal](38, 20) NOT NULL,
	[ClosedPrice] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
	[BoughtUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_DOGE_BTC_ClosedOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOGE_BTC_OpenOrders_Buy](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_DOGE_BTC_OpenOrders_Buy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOGE_BTC_OpenOrders_Sell](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_DOGE_BTC_OpenOrders_Sell] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOGE_USDT_CandleStick](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Close] [decimal](18, 0) NOT NULL,
	[CloseTime] [datetime] NOT NULL,
	[High] [decimal](18, 0) NOT NULL,
	[Low] [decimal](18, 0) NOT NULL,
	[Open] [decimal](18, 0) NOT NULL,
	[OpenTime] [datetime] NOT NULL,
 CONSTRAINT [PK_DOGE_USDT_CandleStick] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOGE_USDT_ClosedOrders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ClosedDate] [datetime] NOT NULL,
	[IsBuy] [bit] NOT NULL,
	[StartPrice] [decimal](38, 20) NOT NULL,
	[Difference] [decimal](38, 20) NOT NULL,
	[ClosedPrice] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
	[BoughtUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_DOGE_USDT_ClosedOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOGE_USDT_OpenOrders_Buy](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_DOGE_USDT_OpenOrders_Buy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOGE_USDT_OpenOrders_Sell](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_DOGE_USDT_OpenOrders_Sell] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ETH_BTC_CandleStick](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Close] [decimal](18, 0) NOT NULL,
	[CloseTime] [datetime] NOT NULL,
	[High] [decimal](18, 0) NOT NULL,
	[Low] [decimal](18, 0) NOT NULL,
	[Open] [decimal](18, 0) NOT NULL,
	[OpenTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ETH_BTC_CandleStick] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ETH_BTC_ClosedOrders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ClosedDate] [datetime] NOT NULL,
	[IsBuy] [bit] NOT NULL,
	[StartPrice] [decimal](38, 20) NOT NULL,
	[Difference] [decimal](38, 20) NOT NULL,
	[ClosedPrice] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
	[BoughtUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_ETH_BTC_ClosedOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ETH_BTC_OpenOrders_Buy](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_ETH_BTC_OpenOrders_Buy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ETH_BTC_OpenOrders_Sell](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_ETH_BTC_OpenOrders_Sell] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ETH_USDT_CandleStick](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Close] [decimal](18, 0) NOT NULL,
	[CloseTime] [datetime] NOT NULL,
	[High] [decimal](18, 0) NOT NULL,
	[Low] [decimal](18, 0) NOT NULL,
	[Open] [decimal](18, 0) NOT NULL,
	[OpenTime] [datetime] NOT NULL,
 CONSTRAINT [PK_ETH_USDT_CandleStick] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ETH_USDT_ClosedOrders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ClosedDate] [datetime] NOT NULL,
	[IsBuy] [bit] NOT NULL,
	[StartPrice] [decimal](38, 20) NOT NULL,
	[Difference] [decimal](38, 20) NOT NULL,
	[ClosedPrice] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
	[BoughtUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_ETH_USDT_ClosedOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ETH_USDT_OpenOrders_Buy](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_ETH_USDT_OpenOrders_Buy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ETH_USDT_OpenOrders_Sell](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_ETH_USDT_OpenOrders_Sell] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Type] [int] NOT NULL,
	[Value] [decimal](38, 20) NULL,
	[StartBalance] [decimal](38, 20) NULL,
	[ResultBalance] [decimal](38, 20) NULL,
	[PlatformCommission] [decimal](38, 20) NULL,
	[Comment] [nvarchar](max) NULL,
	[WhenDate] [datetime] NOT NULL,
	[CurrencyAcronim] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_UsersEvents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exceptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[StackTrace] [nvarchar](max) NULL,
	[WhenDate] [datetime] NOT NULL,
	[UserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Exceptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomeTransactions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CurrencyAcronim] [nvarchar](50) NOT NULL,
	[TransactionId] [nvarchar](max) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[TransactionFee] [decimal](38, 20) NOT NULL,
	[PlatformCommission] [decimal](38, 20) NULL,
	[FromAddress] [nvarchar](max) NULL,
	[ToAddress] [nvarchar](max) NOT NULL,
	[Date] [float] NULL,
	[CreatedDate] [datetime] NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[IncomeWalletsId] [int] NOT NULL,
 CONSTRAINT [PK_IncomeTransactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncomeWallets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[AddressLabel] [nvarchar](max) NULL,
	[CurrencyAcronim] [nvarchar](10) NULL,
	[Created] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_IncomeWallets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LTC_BTC_CandleStick](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Close] [decimal](18, 0) NOT NULL,
	[CloseTime] [datetime] NOT NULL,
	[High] [decimal](18, 0) NOT NULL,
	[Low] [decimal](18, 0) NOT NULL,
	[Open] [decimal](18, 0) NOT NULL,
	[OpenTime] [datetime] NOT NULL,
 CONSTRAINT [PK_LTC_BTC_CandleStick] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LTC_BTC_ClosedOrders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ClosedDate] [datetime] NOT NULL,
	[IsBuy] [bit] NOT NULL,
	[StartPrice] [decimal](38, 20) NOT NULL,
	[Difference] [decimal](38, 20) NOT NULL,
	[ClosedPrice] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
	[BoughtUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_LTC_BTC_ClosedOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LTC_BTC_OpenOrders_Buy](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_LTC_BTC_OpenOrders_Buy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LTC_BTC_OpenOrders_Sell](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_LTC_BTC_OpenOrders_Sell] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LTC_USDT_CandleStick](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Close] [decimal](18, 0) NOT NULL,
	[CloseTime] [datetime] NOT NULL,
	[High] [decimal](18, 0) NOT NULL,
	[Low] [decimal](18, 0) NOT NULL,
	[Open] [decimal](18, 0) NOT NULL,
	[OpenTime] [datetime] NOT NULL,
 CONSTRAINT [PK_LTC_USDT_CandleStick] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LTC_USDT_ClosedOrders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ClosedDate] [datetime] NOT NULL,
	[IsBuy] [bit] NOT NULL,
	[StartPrice] [decimal](38, 20) NOT NULL,
	[Difference] [decimal](38, 20) NOT NULL,
	[ClosedPrice] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
	[BoughtUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_LTC_USDT_ClosedOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LTC_USDT_OpenOrders_Buy](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_LTC_USDT_OpenOrders_Buy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LTC_USDT_OpenOrders_Sell](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_LTC_USDT_OpenOrders_Sell] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Date] [datetime] NOT NULL,
	[AuthorId] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_New] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutcomeTransactions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FromWalletId] [int] NOT NULL,
	[ToAddress] [nvarchar](max) NOT NULL,
	[Value] [decimal](38, 20) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CurrencyAcronim] [nvarchar](10) NOT NULL,
	[State] [int] NOT NULL,
	[LastUpdateDate] [datetime] NOT NULL,
	[ErrorText] [nvarchar](max) NULL,
	[PlatformCommission] [decimal](38, 20) NULL,
	[BlockchainCommission] [decimal](38, 20) NULL,
	[FixedCommission] [decimal](38, 20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[P2PBuyers](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[P2PFiatId] [int] NOT NULL,
	[LimitFrom] [decimal](38, 20) NOT NULL,
	[LimitTo] [decimal](38, 20) NOT NULL,
	[Available] [decimal](38, 20) NOT NULL,
	[P2PCryptId] [int] NOT NULL,
	[P2PTimeFrameId] [int] NOT NULL,
 CONSTRAINT [PK_P2PBuyers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[P2PCrypts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_P2PCrypts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[P2PFiats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_P2PFiats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[P2PPayments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_P2PPayments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[P2PSellers](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[P2PFiatId] [int] NOT NULL,
	[LimitFrom] [decimal](38, 20) NOT NULL,
	[LimitTo] [decimal](38, 20) NOT NULL,
	[Available] [decimal](38, 20) NOT NULL,
	[P2PCryptId] [int] NOT NULL,
	[P2PTimeFrameId] [int] NOT NULL,
 CONSTRAINT [PK_P2PSellers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[P2PTimeFrames](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Mins] [int] NOT NULL,
	[ViewName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_P2PTimeFrames] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[P2PUsersPayments](
	[P2PUserId] [bigint] NOT NULL,
	[P2PPaymentId] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[P2PValutes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Valutes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pairs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Currency1] [nvarchar](10) NOT NULL,
	[Currency2] [nvarchar](10) NOT NULL,
	[Order] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Header] [nvarchar](128) NULL,
	[Acronim] [nvarchar](20) NULL,
	[Price] [decimal](38, 20) NOT NULL,
	[Change24h] [decimal](5, 2) NOT NULL,
	[Change1h] [decimal](5, 2) NOT NULL,
	[Volume24h] [decimal](38, 20) NOT NULL,
	[PriceUpdateDate] [datetime] NOT NULL,
	[Change24hUpdateDate] [datetime] NOT NULL,
	[Change1hUpdateDate] [datetime] NOT NULL,
	[Volume24hUpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Pairs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[LastUpdateDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transfers](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[WalletFromId] [int] NOT NULL,
	[WalletToId] [int] NOT NULL,
	[Value] [decimal](38, 20) NOT NULL,
	[Date] [datetime] NOT NULL,
	[CurrencyAcronim] [nvarchar](10) NOT NULL,
	[Hash] [varchar](66) NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[PlatformCommission] [decimal](38, 20) NULL,
 CONSTRAINT [PK_Transfers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrianglesData](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Pairs] [nvarchar](max) NOT NULL,
	[1PairPrice] [decimal](38, 20) NOT NULL,
	[2PairPrice] [decimal](38, 20) NOT NULL,
	[3PairPrice] [decimal](38, 20) NOT NULL,
	[Profit] [decimal](38, 20) NOT NULL,
	[ProfitPercent] [decimal](38, 20) NOT NULL,
	[1PairPriceMin] [decimal](38, 20) NULL,
	[1PairPriceMax] [decimal](38, 20) NULL,
	[1PairPriceAverage] [decimal](38, 20) NULL,
	[1PairPriceVolume] [decimal](38, 20) NULL,
	[2PairPriceMin] [decimal](38, 20) NULL,
	[2PairPriceMax] [decimal](38, 20) NULL,
	[2PairPriceAverage] [decimal](38, 20) NULL,
	[2PairPriceVolume] [decimal](38, 20) NULL,
	[3PairPriceMin] [decimal](38, 20) NULL,
	[3PairPriceMax] [decimal](38, 20) NULL,
	[3PairPriceAverage] [decimal](38, 20) NULL,
	[3PairPriceVolume] [decimal](38, 20) NULL,
 CONSTRAINT [PK_TrianglesData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Value] [decimal](38, 20) NOT NULL,
	[CurrencyAcronim] [nvarchar](10) NULL,
	[Created] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Wallets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_Wallets] UNIQUE NONCLUSTERED 
(
	[UserId] ASC,
	[CurrencyAcronim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220703-223846] ON [dbo].[BCH_BTC_ClosedOrders]
(
	[ClosedDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220703-223634] ON [dbo].[BCH_USDT_ClosedOrders]
(
	[ClosedDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220703-223801] ON [dbo].[BTC_USDT_ClosedOrders]
(
	[ClosedDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220711-230559] ON [dbo].[BTC_USDT_OpenOrders_Buy]
(
	[Price] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220711-230712] ON [dbo].[BTC_USDT_OpenOrders_Sell]
(
	[Price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220703-223951] ON [dbo].[DASH_BTC_ClosedOrders]
(
	[ClosedDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220703-224010] ON [dbo].[DASH_USDT_ClosedOrders]
(
	[ClosedDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220703-224028] ON [dbo].[DOGE_BTC_ClosedOrders]
(
	[ClosedDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220703-224044] ON [dbo].[DOGE_USDT_ClosedOrders]
(
	[ClosedDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220703-224101] ON [dbo].[ETH_BTC_ClosedOrders]
(
	[ClosedDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220711-231202] ON [dbo].[ETH_BTC_OpenOrders_Buy]
(
	[Price] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220711-231215] ON [dbo].[ETH_BTC_OpenOrders_Sell]
(
	[Price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220703-224117] ON [dbo].[ETH_USDT_ClosedOrders]
(
	[ClosedDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220711-230935] ON [dbo].[ETH_USDT_OpenOrders_Buy]
(
	[Price] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220711-230950] ON [dbo].[ETH_USDT_OpenOrders_Sell]
(
	[Price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220712-232339] ON [dbo].[IncomeTransactions]
(
	[CreatedDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220703-224135] ON [dbo].[LTC_BTC_ClosedOrders]
(
	[ClosedDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220711-231131] ON [dbo].[LTC_BTC_OpenOrders_Buy]
(
	[Price] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220711-231147] ON [dbo].[LTC_BTC_OpenOrders_Sell]
(
	[Price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220703-224152] ON [dbo].[LTC_USDT_ClosedOrders]
(
	[ClosedDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220711-231022] ON [dbo].[LTC_USDT_OpenOrders_Buy]
(
	[Price] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20220711-231037] ON [dbo].[LTC_USDT_OpenOrders_Sell]
(
	[Price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BCH_BTC_OpenOrders_Buy] ADD  CONSTRAINT [DF_BCH_BTC_OpenOrders_Buy_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[BCH_BTC_OpenOrders_Sell] ADD  CONSTRAINT [DF_BCH_BTC_OpenOrders_Sell_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[BCH_USDT_OpenOrders_Buy] ADD  CONSTRAINT [DF_BCH_USDT_OpenOrders_Buy_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[BCH_USDT_OpenOrders_Sell] ADD  CONSTRAINT [DF_BCH_USDT_OpenOrders_Sell_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[BTC_USDT_OpenOrders_Buy] ADD  CONSTRAINT [DF_BTC_USDT_OpenOrders_Buy_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[BTC_USDT_OpenOrders_Sell] ADD  CONSTRAINT [DF_BTC_USDT_OpenOrders_Sell_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Currencies] ADD  CONSTRAINT [DF_Currencies_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[DASH_BTC_OpenOrders_Buy] ADD  CONSTRAINT [DF_DASH_BTC_OpenOrders_Buy_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[DASH_BTC_OpenOrders_Sell] ADD  CONSTRAINT [DF_DASH_BTC_OpenOrders_Sell_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[DASH_USDT_OpenOrders_Buy] ADD  CONSTRAINT [DF_DASH_USDT_OpenOrders_Buy_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[DASH_USDT_OpenOrders_Sell] ADD  CONSTRAINT [DF_DASH_USDT_OpenOrders_Sell_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[DOGE_BTC_OpenOrders_Buy] ADD  CONSTRAINT [DF_DOGE_BTC_OpenOrders_Buy_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[DOGE_BTC_OpenOrders_Sell] ADD  CONSTRAINT [DF_DOGE_BTC_OpenOrders_Sell_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[DOGE_USDT_OpenOrders_Buy] ADD  CONSTRAINT [DF_DOGE_USDT_OpenOrders_Buy_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[DOGE_USDT_OpenOrders_Sell] ADD  CONSTRAINT [DF_DOGE_USDT_OpenOrders_Sell_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ETH_BTC_OpenOrders_Buy] ADD  CONSTRAINT [DF_ETH_BTC_OpenOrders_Buy_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ETH_BTC_OpenOrders_Sell] ADD  CONSTRAINT [DF_ETH_BTC_OpenOrders_Sell_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ETH_USDT_OpenOrders_Buy] ADD  CONSTRAINT [DF_ETH_USDT_OpenOrders_Buy_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ETH_USDT_OpenOrders_Sell] ADD  CONSTRAINT [DF_ETH_USDT_OpenOrders_Sell_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Events] ADD  CONSTRAINT [DF_UsersEvents_Value]  DEFAULT ((0)) FOR [Value]
GO
ALTER TABLE [dbo].[Events] ADD  CONSTRAINT [DF_UsersEvents_WhenDate]  DEFAULT (getdate()) FOR [WhenDate]
GO
ALTER TABLE [dbo].[Exceptions] ADD  CONSTRAINT [DF_Exceptions_WhenDate]  DEFAULT (getdate()) FOR [WhenDate]
GO
ALTER TABLE [dbo].[IncomeTransactions] ADD  CONSTRAINT [DF_IncomeTransactions_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[IncomeWallets] ADD  CONSTRAINT [DF_IncomeWallets_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[IncomeWallets] ADD  CONSTRAINT [DF_IncomeWallets_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [dbo].[LTC_BTC_OpenOrders_Buy] ADD  CONSTRAINT [DF_LTC_BTC_OpenOrders_Buy_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[LTC_BTC_OpenOrders_Sell] ADD  CONSTRAINT [DF_LTC_BTC_OpenOrders_Sell_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[LTC_USDT_OpenOrders_Buy] ADD  CONSTRAINT [DF_LTC_USDT_OpenOrders_Buy_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[LTC_USDT_OpenOrders_Sell] ADD  CONSTRAINT [DF_LTC_USDT_OpenOrders_Sell_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_New_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_New_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[OutcomeTransactions] ADD  CONSTRAINT [DF_OutcomeTransactions_Date]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[OutcomeTransactions] ADD  CONSTRAINT [DF_OutcomeTransactions_State]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[OutcomeTransactions] ADD  CONSTRAINT [DF_OutcomeTransactions_LastUpdateDate]  DEFAULT (getdate()) FOR [LastUpdateDate]
GO
ALTER TABLE [dbo].[Pairs] ADD  CONSTRAINT [DF_Pairs_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Pairs] ADD  CONSTRAINT [DF_Pairs_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Pairs] ADD  CONSTRAINT [DF_Pairs_Change24h]  DEFAULT ((0)) FOR [Change24h]
GO
ALTER TABLE [dbo].[Pairs] ADD  CONSTRAINT [DF_Pairs_Change1h]  DEFAULT ((0)) FOR [Change1h]
GO
ALTER TABLE [dbo].[Pairs] ADD  CONSTRAINT [DF_Pairs_Volume24h]  DEFAULT ((0)) FOR [Volume24h]
GO
ALTER TABLE [dbo].[Pairs] ADD  CONSTRAINT [DF_Pairs_PriceUpdateDate]  DEFAULT (getdate()) FOR [PriceUpdateDate]
GO
ALTER TABLE [dbo].[Pairs] ADD  CONSTRAINT [DF_Pairs_Change24hUpdateDate]  DEFAULT (getdate()) FOR [Change24hUpdateDate]
GO
ALTER TABLE [dbo].[Pairs] ADD  CONSTRAINT [DF_Pairs_Change1hUpdateDate]  DEFAULT (getdate()) FOR [Change1hUpdateDate]
GO
ALTER TABLE [dbo].[Pairs] ADD  CONSTRAINT [DF_Pairs_Volume24hUpdateDate]  DEFAULT (getdate()) FOR [Volume24hUpdateDate]
GO
ALTER TABLE [dbo].[Settings] ADD  CONSTRAINT [DF_Settings_LastUpdateDateTime]  DEFAULT (getdate()) FOR [LastUpdateDateTime]
GO
ALTER TABLE [dbo].[Transfers] ADD  CONSTRAINT [DF_Transfers_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[TrianglesData] ADD  CONSTRAINT [DF_TrianglesData_Profit]  DEFAULT ((0)) FOR [Profit]
GO
ALTER TABLE [dbo].[TrianglesData] ADD  CONSTRAINT [DF_TrianglesData_ProfitPercent]  DEFAULT ((0)) FOR [ProfitPercent]
GO
ALTER TABLE [dbo].[Wallets] ADD  CONSTRAINT [DF_Wallets_Value]  DEFAULT ((0)) FOR [Value]
GO
ALTER TABLE [dbo].[Wallets] ADD  CONSTRAINT [DF_Wallets_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Wallets] ADD  CONSTRAINT [DF_Wallets_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AddTriangleData]
@pairs nvarchar(max),
@pair1price decimal(38,20),
@pair2price decimal(38,20),
@pair3price decimal(38,20),
@date datetime
AS
BEGIN

INSERT INTO [Exchange].[dbo].[TrianglesData] ([Date], Pairs, [1PairPrice], [2PairPrice], [3PairPrice], [Profit], [ProfitPercent])
VALUES (@date, @pairs, @pair1price, @pair2price, @pair3price, (((1 / @pair3price) * @pair2price/ @pair1price) - 1), ((((1 / @pair3price) * @pair2price/ @pair1price) - 1) * 100))

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ClosedOrders_Paged]
@page int,
@pageSize int
AS
BEGIN

Select
  CreateDate
      ,ClosedDate
      ,IsBuy
      ,StartPrice
      ,Difference
      ,ClosedPrice
      ,Amount
      ,Total
      ,Status
      ,CreateUserId
      ,BoughtUserId
FROM [Exchange].[dbo].[BTC_USDT_ClosedOrders]
Order By Id desc
OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateBot]
@name nvarchar(450),
@botAuthCode nvarchar(450),
@userId nvarchar(450)
AS
BEGIN

INSERT INTO [Exchange].[dbo].[Bots] (Name, BotAuthCode, UserId)
VALUES (@name, @botAuthCode, @userId)

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateCandleStick]
@pairName nvarchar(25),
@close decimal(18,0),
@closeTime datetime,
@high decimal(18,0),
@low decimal(18,0),
@open decimal(18,0),
@openTime datetime
AS
BEGIN

Declare @SQL nvarchar(200)

SET @SQL = 'INSERT INTO [Exchange].[dbo].['+@pairName+'_CandleStick] ([Close], CloseTime, High, Low, [Open], OpenTime)
VALUES ('+@close+', '+@closeTime+', '+@high+', '+@low+', '+@open+', '+@openTime+')'

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateEvent]
@userid nvarchar(450),
@type int,
@value decimal(38,20) NULL,
@startBalance decimal (38, 20) NULL,
@resultBalance decimal (38, 20) NULL,
@comment nvarchar(450),
@whenDate datetime,
@currencyAcronim nvarchar(450)
AS
BEGIN

INSERT INTO [Exchange].[dbo].[Events] (UserId, Type, Value, StartBalance, ResultBalance, Comment, WhenDate, CurrencyAcronim)
VALUES (@userid, @type, @value, @startBalance, @resultBalance, @comment, @whenDate, @currencyAcronim)

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateException]
@value nvarchar(max),
@stackTrace nvarchar(max) NULL,
@userId nvarchar(450) NULL
AS
BEGIN

INSERT INTO [Exchange].[dbo].[Exceptions] (Value, StackTrace, WhenDate, UserId)
VALUES (@value, @stackTrace, GETDATE(), @userId)

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateIncomeTransaction]
@currencyAcronim nvarchar(10),
@transactionId nvarchar(max),
@amount decimal(38, 20),
@transactionFee decimal(38, 20),
@PlatformCommission decimal(38, 20),
@toAddress nvarchar(max),
@date decimal(38, 20),
@userId nvarchar(450),
@incomeWalletId int,
@new_identity    INT    OUTPUT
AS
BEGIN

INSERT INTO [Exchange].[dbo].[IncomeTransactions](CurrencyAcronim, TransactionId, Amount,
TransactionFee, ToAddress, Date, UserId, IncomeWalletsId, PlatformCommission)
VALUES (@currencyAcronim, @transactionId, @amount, @transactionFee,
@toAddress, @date, @userId, @incomeWalletId, @PlatformCommission)

SET @new_identity = SCOPE_IDENTITY()

RETURN

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateOutcomeTransaction]
@id int OUTPUT,
@fromWalletId int,
@toAddress nvarchar(max),
@value decimal(38,20),
@platformCommission decimal(38,20),
@fixedCommission decimal(38,20),
@blockchainCommission decimal(38,20),
@currencyAcronim nvarchar(10),
@state int
AS

BEGIN

INSERT INTO [Exchange].[dbo].[OutcomeTransactions] ( FromWalletId, ToAddress,
			Value, CreateDate, CurrencyAcronim, State, LastUpdateDate, PlatformCommission,
			BlockchainCommission, FixedCommission)
VALUES (@fromWalletId, @toAddress, @value, GETDATE(), @currencyAcronim, 1, GETDATE(),
@platformCommission, @blockchainCommission, @fixedCommission)

SET @id = SCOPE_IDENTITY()
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateP2PBuyer]
@userId nvarchar(450),
@price decimal(38,20),
@p2pFiatId int,
@limitFrom decimal(38,20),
@limitTo decimal(38,20),
@available decimal(38,20),
@p2pCryptId int,
@p2pTimeFrameId int
AS
BEGIN

INSERT INTO [Exchange].[dbo].[P2PBuyers] (UserId, Price, P2PFiatId, LimitFrom, LimitTo, Available, P2PCryptId, P2PTimeFrameId)
VALUES (@userId, @price, @p2pFiatId, @limitFrom, @limitTo, @available,  @p2pCryptId, @p2pTimeFrameId)

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateP2PPayment]
@name nvarchar(450)
AS
BEGIN

INSERT INTO [Exchange].[dbo].[P2PPayments] ([Name])
VALUES (@name)

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateP2PSeller]
@userId nvarchar(450),
@price decimal(38,20),
@p2pFiatId int,
@limitFrom decimal(38,20),
@limitTo decimal(38,20),
@available decimal(38,20),
@p2pCryptId int,
@p2pTimeFrameId int
AS
BEGIN

INSERT INTO [Exchange].[dbo].[P2PSellers] (UserId, Price, P2PFiatId, LimitFrom, LimitTo, Available, P2PCryptId, P2PTimeFrameId)
VALUES (@userId, @price, @p2pFiatId, @limitFrom, @limitTo, @available,  @p2pCryptId, @p2pTimeFrameId)

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateP2PValute]
@name nvarchar(450)
AS
BEGIN

INSERT INTO [Exchange].[dbo].[P2PValutes] ([Name])
VALUES (@name)

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreatePair]
@currency1 nvarchar(10),
@currency2 nvarchar(10),
@created datetime,
@header nvarchar(128),
@acronim nvarchar(20)
AS
BEGIN

INSERT INTO [Exchange].[dbo].[Pairs] (Currency1, Currency2, "Order", Created, Header, Acronim)
VALUES (@currency1, @currency2, 10, @created, @header, @acronim)

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateUserIncomeWallet]
@userid nvarchar(450),
@address nvarchar(max),
@addressLabel nvarchar(max),
@currencyAcronim nvarchar(10),
@new_identity    INT    OUTPUT
AS
BEGIN

INSERT INTO [Exchange].[dbo].[IncomeWallets] (UserId, Address, AddressLabel, CurrencyAcronim)
VALUES (@userid, @address, @addressLabel, @currencyAcronim)

SET @new_identity = SCOPE_IDENTITY()

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateUserWallet]
@userid nvarchar(450),
@address nvarchar(max),
@currencyAcronim nvarchar(10),
@value decimal(38,20),
@new_identity    INT    OUTPUT
AS
BEGIN

INSERT INTO [Exchange].[dbo].[Wallets] (UserId, Address, CurrencyAcronim, Value)
VALUES (@userid, @address, @currencyAcronim, @value)

SET @new_identity = SCOPE_IDENTITY()
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBots_ById]
@id nvarchar(450)
AS
BEGIN

DELETE FROM [Exchange].[dbo].[Bots] WHERE Id = @id

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BCH_BTC_CandleStick]
@datestart datetime,
@dateend datetime,
@interval nvarchar(50)
AS
BEGIN

IF(@interval = '1h')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksHoursTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksHoursTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(hour,0, datediff(hour,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksHoursTable
	FROM [Exchange].[dbo].[BCH_BTC_CandleStick]
	group by dateadd(hour,0, datediff(hour,0, OpenTime))

	select tt.*,
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksHoursTable tt
	left join [BCH_BTC_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [BCH_BTC_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE IF (@interval = '1d')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksDaysTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksDaysTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(day,0, datediff(day,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksDaysTable
	FROM [Exchange].[dbo].[BCH_BTC_CandleStick]
	group by dateadd(day,0, datediff(day,0, OpenTime))

	select 
	--tt.OpenTime,
	tt.OpenTimeD as OpenTime, 
	tt.CloseTime,
	tt.[Low],
	tt.[High],
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksDaysTable tt
	left join [BCH_BTC_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [BCH_BTC_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE
BEGIN

	SELECT * 
	FROM [Exchange].[dbo].[BCH_BTC_CandleStick]
	where (@datestart is null or OpenTime >= @datestart)
	and (@dateend is null or CloseTime <= @dateend)

END
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BCH_BTC_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[BCH_BTC_ClosedOrders]
WHERE CreateUserId = @createUserId
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BCH_BTC_ClosedOrders_Top100]
AS
BEGIN

SELECT TOP 100 *
FROM [Exchange].[dbo].[BCH_BTC_ClosedOrders]
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BCH_BTC_OpenOrder_ById]
@openOrderId bigint
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[BCH_BTC_OpenOrders_Buy]
WHERE Id = @openOrderId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[BCH_BTC_OpenOrders_Sell]
WHERE Id = @openOrderId
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BCH_BTC_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[BCH_BTC_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[BCH_BTC_OpenOrders_Sell]
WHERE CreateUserId = @createUserId
ORDER BY CreateDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BCH_BTC_OrderBookBuy_OrderByDescPrice]
AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[BCH_BTC_OpenOrders_Buy] AS D1
	ORDER BY D1.Price DESC
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
order by c.Price DESC
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BCH_BTC_OrderBookSell_OrderByPrice]

AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[BCH_BTC_OpenOrders_Sell] AS D1
	ORDER BY D1.Price
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BCH_USDT_CandleStick]
@datestart datetime,
@dateend datetime,
@interval nvarchar(50)
AS
BEGIN

IF(@interval = '1h')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksHoursTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksHoursTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(hour,0, datediff(hour,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksHoursTable
	FROM [Exchange].[dbo].[BCH_USDT_CandleStick]
	group by dateadd(hour,0, datediff(hour,0, OpenTime))

	select tt.*,
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksHoursTable tt
	left join [BCH_USDT_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [BCH_USDT_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE IF (@interval = '1d')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksDaysTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksDaysTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(day,0, datediff(day,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksDaysTable
	FROM [Exchange].[dbo].[BCH_USDT_CandleStick]
	group by dateadd(day,0, datediff(day,0, OpenTime))

	select 
	--tt.OpenTime,
	tt.OpenTimeD as OpenTime, 
	tt.CloseTime,
	tt.[Low],
	tt.[High],
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksDaysTable tt
	left join [BCH_USDT_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [BCH_USDT_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE
BEGIN

	SELECT * 
	FROM [Exchange].[dbo].[BCH_USDT_CandleStick]
	where (@datestart is null or OpenTime >= @datestart)
	and (@dateend is null or CloseTime <= @dateend)

END
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BCH_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[BCH_USDT_ClosedOrders]
WHERE CreateUserId = @createUserId
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BCH_USDT_ClosedOrders_Top100]
AS
BEGIN

SELECT TOP 100 *
FROM [Exchange].[dbo].[BCH_USDT_ClosedOrders]
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BCH_USDT_OpenOrder_ById]
@openOrderId bigint
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[BCH_USDT_OpenOrders_Buy]
WHERE Id = @openOrderId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[BCH_USDT_OpenOrders_Sell]
WHERE Id = @openOrderId
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BCH_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[BCH_USDT_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[BCH_USDT_OpenOrders_Sell]
WHERE CreateUserId = @createUserId
ORDER BY CreateDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BCH_USDT_OrderBookBuy_OrderByDescPrice]
AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[BCH_USDT_OpenOrders_Buy] AS D1
	ORDER BY D1.Price DESC
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
order by c.Price DESC
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BCH_USDT_OrderBookSell_OrderByPrice]

AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[BCH_USDT_OpenOrders_Sell] AS D1
	ORDER BY D1.Price
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_CandleStick]
@datestart datetime,
@dateend datetime,
@interval nvarchar(50)
AS
BEGIN

IF(@interval = '1h')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksHoursTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksHoursTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(hour,0, datediff(hour,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksHoursTable
	FROM [Exchange].[dbo].[BTC_USDT_CandleStick]
	group by dateadd(hour,0, datediff(hour,0, OpenTime))

	select tt.*,
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksHoursTable tt
	left join [BTC_USDT_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [BTC_USDT_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE IF (@interval = '1d')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksDaysTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksDaysTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(day,0, datediff(day,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksDaysTable
	FROM [Exchange].[dbo].[BTC_USDT_CandleStick]
	group by dateadd(day,0, datediff(day,0, OpenTime))

	select 
	--tt.OpenTime,
	tt.OpenTimeD as OpenTime, 
	tt.CloseTime,
	tt.[Low],
	tt.[High],
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksDaysTable tt
	left join [BTC_USDT_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [BTC_USDT_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE
BEGIN

	SELECT * 
	FROM [Exchange].[dbo].[BTC_USDT_CandleStick]
	where (@datestart is null or OpenTime >= @datestart)
	and (@dateend is null or CloseTime <= @dateend)

END
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[BTC_USDT_ClosedOrders]
WHERE CreateUserId = @createUserId
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_ClosedOrders_Top100]
AS
BEGIN

SELECT TOP 100 *
FROM [Exchange].[dbo].[BTC_USDT_ClosedOrders]
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_OpenOrder_ById]
@openOrderId bigint
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy]
WHERE Id = @openOrderId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
WHERE Id = @openOrderId
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
WHERE CreateUserId = @createUserId
ORDER BY CreateDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_OrderBookBuy_OrderByDescPrice]
AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy] AS D1
	ORDER BY D1.Price DESC
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
order by c.Price DESC
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_OrderBookSell_OrderByPrice]

AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell] AS D1
	ORDER BY D1.Price
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DASH_BTC_CandleStick]
@datestart datetime,
@dateend datetime,
@interval nvarchar(50)
AS
BEGIN

IF(@interval = '1h')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksHoursTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksHoursTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(hour,0, datediff(hour,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksHoursTable
	FROM [Exchange].[dbo].[DASH_BTC_CandleStick]
	group by dateadd(hour,0, datediff(hour,0, OpenTime))

	select tt.*,
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksHoursTable tt
	left join [DASH_BTC_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [DASH_BTC_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE IF (@interval = '1d')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksDaysTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksDaysTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(day,0, datediff(day,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksDaysTable
	FROM [Exchange].[dbo].[DASH_BTC_CandleStick]
	group by dateadd(day,0, datediff(day,0, OpenTime))

	select 
	--tt.OpenTime,
	tt.OpenTimeD as OpenTime, 
	tt.CloseTime,
	tt.[Low],
	tt.[High],
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksDaysTable tt
	left join [DASH_BTC_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [DASH_BTC_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE
BEGIN

	SELECT * 
	FROM [Exchange].[dbo].[DASH_BTC_CandleStick]
	where (@datestart is null or OpenTime >= @datestart)
	and (@dateend is null or CloseTime <= @dateend)

END
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DASH_BTC_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[DASH_BTC_ClosedOrders]
WHERE CreateUserId = @createUserId
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DASH_BTC_ClosedOrders_Top100]
AS
BEGIN

SELECT TOP 100 *
FROM [Exchange].[dbo].[DASH_BTC_ClosedOrders]
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DASH_BTC_OpenOrder_ById]
@openOrderId bigint
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[DASH_BTC_OpenOrders_Buy]
WHERE Id = @openOrderId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[DASH_BTC_OpenOrders_Sell]
WHERE Id = @openOrderId
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DASH_BTC_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[DASH_BTC_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[DASH_BTC_OpenOrders_Sell]
WHERE CreateUserId = @createUserId
ORDER BY CreateDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DASH_BTC_OrderBookBuy_OrderByDescPrice]
AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[DASH_BTC_OpenOrders_Buy] AS D1
	ORDER BY D1.Price DESC
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
order by c.Price DESC
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DASH_BTC_OrderBookSell_OrderByPrice]

AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[DASH_BTC_OpenOrders_Sell] AS D1
	ORDER BY D1.Price
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DASH_USDT_CandleStick]
@datestart datetime,
@dateend datetime,
@interval nvarchar(50)
AS
BEGIN

IF(@interval = '1h')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksHoursTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksHoursTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(hour,0, datediff(hour,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksHoursTable
	FROM [Exchange].[dbo].[DASH_USDT_CandleStick]
	group by dateadd(hour,0, datediff(hour,0, OpenTime))

	select tt.*,
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksHoursTable tt
	left join [DASH_USDT_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [DASH_USDT_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE IF (@interval = '1d')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksDaysTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksDaysTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(day,0, datediff(day,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksDaysTable
	FROM [Exchange].[dbo].[DASH_USDT_CandleStick]
	group by dateadd(day,0, datediff(day,0, OpenTime))

	select 
	--tt.OpenTime,
	tt.OpenTimeD as OpenTime, 
	tt.CloseTime,
	tt.[Low],
	tt.[High],
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksDaysTable tt
	left join [DASH_USDT_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [DASH_USDT_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE
BEGIN

	SELECT * 
	FROM [Exchange].[dbo].[DASH_USDT_CandleStick]
	where (@datestart is null or OpenTime >= @datestart)
	and (@dateend is null or CloseTime <= @dateend)

END
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DASH_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[DASH_USDT_ClosedOrders]
WHERE CreateUserId = @createUserId
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DASH_USDT_ClosedOrders_Top100]
AS
BEGIN

SELECT TOP 100 *
FROM [Exchange].[dbo].[DASH_USDT_ClosedOrders]
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DASH_USDT_OpenOrder_ById]
@openOrderId bigint
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[DASH_USDT_OpenOrders_Buy]
WHERE Id = @openOrderId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[DASH_USDT_OpenOrders_Sell]
WHERE Id = @openOrderId
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DASH_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[DASH_USDT_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[DASH_USDT_OpenOrders_Sell]
WHERE CreateUserId = @createUserId
ORDER BY CreateDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DASH_USDT_OrderBookBuy_OrderByDescPrice]
AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[DASH_USDT_OpenOrders_Buy] AS D1
	ORDER BY D1.Price DESC
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
order by c.Price DESC
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DASH_USDT_OrderBookSell_OrderByPrice]

AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[DASH_USDT_OpenOrders_Sell] AS D1
	ORDER BY D1.Price
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DOGE_BTC_CandleStick]
@datestart datetime,
@dateend datetime,
@interval nvarchar(50)
AS
BEGIN

IF(@interval = '1h')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksHoursTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksHoursTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(hour,0, datediff(hour,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksHoursTable
	FROM [Exchange].[dbo].[DOGE_BTC_CandleStick]
	group by dateadd(hour,0, datediff(hour,0, OpenTime))

	select tt.*,
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksHoursTable tt
	left join [DOGE_BTC_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [DOGE_BTC_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE IF (@interval = '1d')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksDaysTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksDaysTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(day,0, datediff(day,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksDaysTable
	FROM [Exchange].[dbo].[DOGE_BTC_CandleStick]
	group by dateadd(day,0, datediff(day,0, OpenTime))

	select 
	--tt.OpenTime,
	tt.OpenTimeD as OpenTime, 
	tt.CloseTime,
	tt.[Low],
	tt.[High],
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksDaysTable tt
	left join [DOGE_BTC_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [DOGE_BTC_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE
BEGIN

	SELECT * 
	FROM [Exchange].[dbo].[DOGE_BTC_CandleStick]
	where (@datestart is null or OpenTime >= @datestart)
	and (@dateend is null or CloseTime <= @dateend)

END
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DOGE_BTC_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[DOGE_BTC_ClosedOrders]
WHERE CreateUserId = @createUserId
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DOGE_BTC_ClosedOrders_Top100]
AS
BEGIN

SELECT TOP 100 *
FROM [Exchange].[dbo].[DOGE_BTC_ClosedOrders]
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DOGE_BTC_OpenOrder_ById]
@openOrderId bigint
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[DOGE_BTC_OpenOrders_Buy]
WHERE Id = @openOrderId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[DOGE_BTC_OpenOrders_Sell]
WHERE Id = @openOrderId
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DOGE_BTC_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[DOGE_BTC_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[DOGE_BTC_OpenOrders_Sell]
WHERE CreateUserId = @createUserId
ORDER BY CreateDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DOGE_BTC_OrderBookBuy_OrderByDescPrice]
AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[DOGE_BTC_OpenOrders_Buy] AS D1
	ORDER BY D1.Price DESC
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
order by c.Price DESC
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DOGE_BTC_OrderBookSell_OrderByPrice]

AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[DOGE_BTC_OpenOrders_Sell] AS D1
	ORDER BY D1.Price
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DOGE_USDT_CandleStick]
@datestart datetime,
@dateend datetime,
@interval nvarchar(50)
AS
BEGIN

IF(@interval = '1h')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksHoursTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksHoursTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(hour,0, datediff(hour,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksHoursTable
	FROM [Exchange].[dbo].[DOGE_USDT_CandleStick]
	group by dateadd(hour,0, datediff(hour,0, OpenTime))

	select tt.*,
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksHoursTable tt
	left join [DOGE_USDT_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [DOGE_USDT_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE IF (@interval = '1d')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksDaysTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksDaysTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(day,0, datediff(day,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksDaysTable
	FROM [Exchange].[dbo].[DOGE_USDT_CandleStick]
	group by dateadd(day,0, datediff(day,0, OpenTime))

	select 
	--tt.OpenTime,
	tt.OpenTimeD as OpenTime, 
	tt.CloseTime,
	tt.[Low],
	tt.[High],
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksDaysTable tt
	left join [DOGE_USDT_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [DOGE_USDT_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE
BEGIN

	SELECT * 
	FROM [Exchange].[dbo].[DOGE_USDT_CandleStick]
	where (@datestart is null or OpenTime >= @datestart)
	and (@dateend is null or CloseTime <= @dateend)

END
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DOGE_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[DOGE_USDT_ClosedOrders]
WHERE CreateUserId = @createUserId
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DOGE_USDT_ClosedOrders_Top100]
AS
BEGIN

SELECT TOP 100 *
FROM [Exchange].[dbo].[DOGE_USDT_ClosedOrders]
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DOGE_USDT_OpenOrder_ById]
@openOrderId bigint
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[DOGE_USDT_OpenOrders_Buy]
WHERE Id = @openOrderId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[DOGE_USDT_OpenOrders_Sell]
WHERE Id = @openOrderId
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DOGE_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[DOGE_USDT_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[DOGE_USDT_OpenOrders_Sell]
WHERE CreateUserId = @createUserId
ORDER BY CreateDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DOGE_USDT_OrderBookBuy_OrderByDescPrice]
AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[DOGE_USDT_OpenOrders_Buy] AS D1
	ORDER BY D1.Price DESC
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
order by c.Price DESC
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_DOGE_USDT_OrderBookSell_OrderByPrice]

AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[DOGE_USDT_OpenOrders_Sell] AS D1
	ORDER BY D1.Price
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_ETH_BTC_CandleStick]
@datestart datetime,
@dateend datetime,
@interval nvarchar(50)
AS
BEGIN

IF(@interval = '1h')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksHoursTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksHoursTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(hour,0, datediff(hour,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksHoursTable
	FROM [Exchange].[dbo].[ETH_BTC_CandleStick]
	group by dateadd(hour,0, datediff(hour,0, OpenTime))

	select tt.*,
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksHoursTable tt
	left join [ETH_BTC_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [ETH_BTC_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE IF (@interval = '1d')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksDaysTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksDaysTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(day,0, datediff(day,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksDaysTable
	FROM [Exchange].[dbo].[ETH_BTC_CandleStick]
	group by dateadd(day,0, datediff(day,0, OpenTime))

	select 
	--tt.OpenTime,
	tt.OpenTimeD as OpenTime, 
	tt.CloseTime,
	tt.[Low],
	tt.[High],
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksDaysTable tt
	left join [ETH_BTC_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [ETH_BTC_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE
BEGIN

	SELECT * 
	FROM [Exchange].[dbo].[ETH_BTC_CandleStick]
	where (@datestart is null or OpenTime >= @datestart)
	and (@dateend is null or CloseTime <= @dateend)

END
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_ETH_BTC_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[ETH_BTC_ClosedOrders]
WHERE CreateUserId = @createUserId
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_ETH_BTC_ClosedOrders_Top100]
AS
BEGIN

SELECT TOP 100 *
FROM [Exchange].[dbo].[ETH_BTC_ClosedOrders]
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_ETH_BTC_OpenOrder_ById]
@openOrderId bigint
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[ETH_BTC_OpenOrders_Buy]
WHERE Id = @openOrderId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[ETH_BTC_OpenOrders_Sell]
WHERE Id = @openOrderId
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_ETH_BTC_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[ETH_BTC_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[ETH_BTC_OpenOrders_Sell]
WHERE CreateUserId = @createUserId
ORDER BY CreateDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_ETH_BTC_OrderBookBuy_OrderByDescPrice]
AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[ETH_BTC_OpenOrders_Buy] AS D1
	ORDER BY D1.Price DESC
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
order by c.Price DESC
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_ETH_BTC_OrderBookSell_OrderByPrice]

AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[ETH_BTC_OpenOrders_Sell] AS D1
	ORDER BY D1.Price
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_ETH_USDT_CandleStick]
@datestart datetime,
@dateend datetime,
@interval nvarchar(50)
AS
BEGIN

IF(@interval = '1h')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksHoursTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksHoursTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(hour,0, datediff(hour,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksHoursTable
	FROM [Exchange].[dbo].[ETH_USDT_CandleStick]
	group by dateadd(hour,0, datediff(hour,0, OpenTime))

	select tt.*,
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksHoursTable tt
	left join [ETH_USDT_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [ETH_USDT_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE IF (@interval = '1d')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksDaysTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksDaysTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(day,0, datediff(day,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksDaysTable
	FROM [Exchange].[dbo].[ETH_USDT_CandleStick]
	group by dateadd(day,0, datediff(day,0, OpenTime))

	select 
	--tt.OpenTime,
	tt.OpenTimeD as OpenTime, 
	tt.CloseTime,
	tt.[Low],
	tt.[High],
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksDaysTable tt
	left join [ETH_USDT_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [ETH_USDT_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE
BEGIN

	SELECT * 
	FROM [Exchange].[dbo].[ETH_USDT_CandleStick]
	where (@datestart is null or OpenTime >= @datestart)
	and (@dateend is null or CloseTime <= @dateend)

END
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_ETH_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[ETH_USDT_ClosedOrders]
WHERE CreateUserId = @createUserId
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_ETH_USDT_ClosedOrders_Top100]
AS
BEGIN

SELECT TOP 100 *
FROM [Exchange].[dbo].[ETH_USDT_ClosedOrders]
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_ETH_USDT_OpenOrder_ById]
@openOrderId bigint
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[ETH_USDT_OpenOrders_Buy]
WHERE Id = @openOrderId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[ETH_USDT_OpenOrders_Sell]
WHERE Id = @openOrderId
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_ETH_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[ETH_USDT_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[ETH_USDT_OpenOrders_Sell]
WHERE CreateUserId = @createUserId
ORDER BY CreateDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_ETH_USDT_OrderBookBuy_OrderByDescPrice]
AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[ETH_USDT_OpenOrders_Buy] AS D1
	ORDER BY D1.Price DESC
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
order by c.Price DESC
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_ETH_USDT_OrderBookSell_OrderByPrice]

AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[ETH_USDT_OpenOrders_Sell] AS D1
	ORDER BY D1.Price
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_LTC_BTC_CandleStick]
@datestart datetime,
@dateend datetime,
@interval nvarchar(50)
AS
BEGIN

IF(@interval = '1h')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksHoursTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksHoursTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(hour,0, datediff(hour,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksHoursTable
	FROM [Exchange].[dbo].[LTC_BTC_CandleStick]
	group by dateadd(hour,0, datediff(hour,0, OpenTime))

	select tt.*,
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksHoursTable tt
	left join [LTC_BTC_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [LTC_BTC_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE IF (@interval = '1d')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksDaysTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksDaysTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(day,0, datediff(day,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksDaysTable
	FROM [Exchange].[dbo].[LTC_BTC_CandleStick]
	group by dateadd(day,0, datediff(day,0, OpenTime))

	select 
	--tt.OpenTime,
	tt.OpenTimeD as OpenTime, 
	tt.CloseTime,
	tt.[Low],
	tt.[High],
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksDaysTable tt
	left join [LTC_BTC_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [LTC_BTC_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE
BEGIN

	SELECT * 
	FROM [Exchange].[dbo].[LTC_BTC_CandleStick]
	where (@datestart is null or OpenTime >= @datestart)
	and (@dateend is null or CloseTime <= @dateend)

END
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_LTC_BTC_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[LTC_BTC_ClosedOrders]
WHERE CreateUserId = @createUserId
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_LTC_BTC_ClosedOrders_Top100]
AS
BEGIN

SELECT TOP 100 *
FROM [Exchange].[dbo].[LTC_BTC_ClosedOrders]
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_LTC_BTC_OpenOrder_ById]
@openOrderId bigint
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[LTC_BTC_OpenOrders_Buy]
WHERE Id = @openOrderId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[LTC_BTC_OpenOrders_Sell]
WHERE Id = @openOrderId
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_LTC_BTC_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[LTC_BTC_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[LTC_BTC_OpenOrders_Sell]
WHERE CreateUserId = @createUserId
ORDER BY CreateDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_LTC_BTC_OrderBookBuy_OrderByDescPrice]
AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[LTC_BTC_OpenOrders_Buy] AS D1
	ORDER BY D1.Price DESC
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
order by c.Price DESC
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_LTC_BTC_OrderBookSell_OrderByPrice]

AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[LTC_BTC_OpenOrders_Sell] AS D1
	ORDER BY D1.Price
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_LTC_USDT_CandleStick]
@datestart datetime,
@dateend datetime,
@interval nvarchar(50)
AS
BEGIN

IF(@interval = '1h')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksHoursTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksHoursTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(hour,0, datediff(hour,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksHoursTable
	FROM [Exchange].[dbo].[LTC_USDT_CandleStick]
	group by dateadd(hour,0, datediff(hour,0, OpenTime))

	select tt.*,
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksHoursTable tt
	left join [LTC_USDT_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [LTC_USDT_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE IF (@interval = '1d')
BEGIN
	
	IF OBJECT_ID(N'tempdb..#TempCandleSticksDaysTable') IS NOT NULL
	BEGIN
	DROP TABLE #TempCandleSticksDaysTable
	END

	SELECT 
	min(OpenTime) as OpenTime,
	max([CloseTime]) as CloseTime,
	min([Low]) Low,
	max([High]) High,
	dateadd(day,0, datediff(day,0, OpenTime)) as OpenTimeD
	INTO #TempCandleSticksDaysTable
	FROM [Exchange].[dbo].[LTC_USDT_CandleStick]
	group by dateadd(day,0, datediff(day,0, OpenTime))

	select 
	--tt.OpenTime,
	tt.OpenTimeD as OpenTime, 
	tt.CloseTime,
	tt.[Low],
	tt.[High],
	cso.[Open],
	csc.[Close]
	from #TempCandleSticksDaysTable tt
	left join [LTC_USDT_CandleStick] cso on tt.OpenTime = cso.OpenTime
	left join [LTC_USDT_CandleStick] csc on tt.CloseTime = csc.CloseTime
	where (@datestart is null or tt.OpenTime >= @datestart)
	and (@dateend is null or tt.CloseTime <= @dateend)

END
ELSE
BEGIN

	SELECT * 
	FROM [Exchange].[dbo].[LTC_USDT_CandleStick]
	where (@datestart is null or OpenTime >= @datestart)
	and (@dateend is null or CloseTime <= @dateend)

END
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_LTC_USDT_ClosedOrders_ByCreateUserIdWithOrderByDescClosedDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[LTC_USDT_ClosedOrders]
WHERE CreateUserId = @createUserId
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_LTC_USDT_ClosedOrders_Top100]
AS
BEGIN

SELECT TOP 100 *
FROM [Exchange].[dbo].[LTC_USDT_ClosedOrders]
ORDER BY ClosedDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_LTC_USDT_OpenOrder_ById]
@openOrderId bigint
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[LTC_USDT_OpenOrders_Buy]
WHERE Id = @openOrderId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[LTC_USDT_OpenOrders_Sell]
WHERE Id = @openOrderId
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_LTC_USDT_OpenOrders_ByCreateUserIdWithOrderByDescCreateDate]
@createUserId nvarchar(450)
AS
BEGIN

SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[LTC_USDT_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[LTC_USDT_OpenOrders_Sell]
WHERE CreateUserId = @createUserId
ORDER BY CreateDate DESC
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_LTC_USDT_OrderBookBuy_OrderByDescPrice]
AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[LTC_USDT_OpenOrders_Buy] AS D1
	ORDER BY D1.Price DESC
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
order by c.Price DESC
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_LTC_USDT_OrderBookSell_OrderByPrice]

AS
BEGIN

;WITH cte
as
(
	SELECT top 1000  
		D1.Price, 
		D1.Amount  
	FROM [Exchange].[dbo].[LTC_USDT_OpenOrders_Sell] AS D1
	ORDER BY D1.Price
) 

SELECT TOP 15
    COUNT(c.Price) AS CountPrices,
	c.Price, 
	SUM(c.Amount) Amount,
    SUM(c.Price * c.Amount) Total  
FROM cte c
	GROUP BY c.Price
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_OpenOrders_ByUserId]
@createUserId nvarchar(450)
AS
BEGIN

SELECT *, 1 as IsBuy, 'BTCUSDT' as Pair FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy, 'BTCUSDT' as Pair FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
WHERE CreateUserId = @createUserId

UNION
SELECT *, 1 as IsBuy, 'DASHUSDT' as Pair FROM [Exchange].[dbo].[DASH_USDT_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy, 'DASHUSDT' as Pair FROM [Exchange].[dbo].[DASH_USDT_OpenOrders_Sell]
WHERE CreateUserId = @createUserId

UNION
SELECT *, 1 as IsBuy, 'DOGEUSDT' as Pair FROM [Exchange].[dbo].[DOGE_USDT_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy, 'DOGEUSDT' as Pair FROM [Exchange].[dbo].[DOGE_USDT_OpenOrders_Sell]
WHERE CreateUserId = @createUserId

UNION
SELECT *, 1 as IsBuy, 'ETHUSDT' as Pair FROM [Exchange].[dbo].[ETH_USDT_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy, 'ETHUSDT' as Pair FROM [Exchange].[dbo].[ETH_USDT_OpenOrders_Sell]
WHERE CreateUserId = @createUserId

UNION
SELECT *, 1 as IsBuy, 'LTCUSDT' as Pair FROM [Exchange].[dbo].[LTC_USDT_OpenOrders_Buy]
WHERE CreateUserId = @createUserId
UNION
SELECT *, 0 as IsBuy, 'LTCUSDT' as Pair FROM [Exchange].[dbo].[LTC_USDT_OpenOrders_Sell]
WHERE CreateUserId = @createUserId

ORDER BY CreateDate DESC

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Top10000_Exceptions]

AS
BEGIN

SELECT TOP(10000) * FROM [Exchange].[dbo].[Exceptions]
	
END






GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Top10000_Transfers]

AS
BEGIN

SELECT TOP(10000) * FROM [Exchange].[dbo].[Transfers]
	
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_TrianglesData_Profit]
AS
BEGIN
	
SELECT TOP (1000) [Id]
    ,[Date]
    ,[Pairs]
    ,[1PairPrice]
    ,[2PairPrice]
    ,[3PairPrice]
    ,[Profit]
    , ABS([ProfitPercent]) ProfitPercent
FROM [Exchange].[dbo].[TrianglesData]
order by ABS([ProfitPercent])  desc

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllIncomeTransactions]

AS
BEGIN

SELECT inct.[Id],
       inct.[CurrencyAcronim],
       inct.[Amount],
       inct.[TransactionFee],
       inct.[FromAddress],
       inct.[ToAddress],
       inct.[Date],
       inct.[UserId]
 FROM IncomeTransactions inct

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllPairs]
AS
BEGIN

SELECT 
[Id]
,[Currency1]
,[Currency2]
,[Order]
,[Created]
,[Header]
,[Acronim]
,[Price]
,[Change24h]
,[Change1h]
,[Volume24h]
,[PriceUpdateDate]
,[Change24hUpdateDate]
,[Change1hUpdateDate]
,[Volume24hUpdateDate]
FROM [Exchange].[dbo].[Pairs]
ORDER BY [Order]

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllTransfers]

AS
BEGIN

SELECT * FROM [Exchange].[dbo].[Transfers]
	
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBots_ByBotAuthCode]
@botAuthCode nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[Bots] WHERE BotAuthCode = @botAuthCode
	
END






GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBots_ById]
@userid nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[Bots] WHERE UserId = @userid
	
END






GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCountOfClosedOreders]
AS
BEGIN

SELECT COUNT(1) FROM [Exchange].[dbo].[ClosedOrders_Paged]

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCountOfIncomeTransactions]
AS
BEGIN

SELECT COUNT(1) FROM [Exchange].[dbo].[IncomeTransactions]

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCountOfOutcomeTransactions]
AS
BEGIN

SELECT COUNT(1) FROM [Exchange].[dbo].[OutcomeTransactions]

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCountOfTransfers]
AS
BEGIN

SELECT COUNT(1) FROM [Exchange].[dbo].[Transfers]

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCurrencyByAcronim]
@acronim nvarchar (450)
AS
BEGIN

Select * FROM Currencies WHERE Acronim = @acronim

END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCurrent_BTC_USDT_CandleStick]
AS
BEGIN

DECLARE @CandleStick TABLE
(Id bigint, 
 [Close] decimal(18,0), 
 CloseTime datetime,
 High decimal(18,0),
 Low decimal(18,0),
 [Open] decimal(18,0),
 OpenTime datetime
)

SELECT TOP(1) * 
INTO #lastCandleStick
FROM [Exchange].[dbo].[BTC_USDT_CandleStick]
ORDER BY Id DESC

SELECT *
INTO #closedOrdersByLastMinute 
FROM [Exchange].[dbo].[BTC_USDT_ClosedOrders]
WHERE (SELECT CloseTime FROM #lastCandleStick) < ClosedDate and ClosedDate < GETDATE()

SELECT TOP (1) * INTO #lastOrder FROM #closedOrdersByLastMinute ORDER BY ClosedDate DESC

INSERT INTO @CandleStick([Open], OpenTime, High, Low, [Close], CloseTime)
VALUES ((SELECT [Close] FROM #lastCandleStick),
		(SELECT CloseTime FROM #lastCandleStick),
		(SELECT max(ExposedPrice) FROM #closedOrdersByLastMinute),
		(SELECT min(ExposedPrice) FROM #closedOrdersByLastMinute),
		(SELECT ExposedPrice FROM #lastOrder),
		(SELECT ClosedDate FROM #lastOrder))
		
SELECT * FROM @CandleStick
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCurrent_DASH_USDT_CandleStick]
AS
BEGIN

DECLARE @CandleStick TABLE
(Id bigint, 
 [Close] decimal(18,0), 
 CloseTime datetime,
 High decimal(18,0),
 Low decimal(18,0),
 [Open] decimal(18,0),
 OpenTime datetime
)

SELECT TOP(1) * 
INTO #lastCandleStick
FROM [Exchange].[dbo].[DASH_USDT_CandleStick]
ORDER BY Id DESC

SELECT *
INTO #closedOrdersByLastMinute 
FROM [Exchange].[dbo].[DASH_USDT_ClosedOrders]
WHERE (SELECT CloseTime FROM #lastCandleStick) < ClosedDate and ClosedDate < GETDATE()

SELECT TOP (1) * INTO #lastOrder FROM #closedOrdersByLastMinute ORDER BY ClosedDate DESC

INSERT INTO @CandleStick([Open], OpenTime, High, Low, [Close], CloseTime)
VALUES ((SELECT [Close] FROM #lastCandleStick),
		(SELECT CloseTime FROM #lastCandleStick),
		(SELECT max(ExposedPrice) FROM #closedOrdersByLastMinute),
		(SELECT min(ExposedPrice) FROM #closedOrdersByLastMinute),
		(SELECT ExposedPrice FROM #lastOrder),
		(SELECT ClosedDate FROM #lastOrder))
		
SELECT * FROM @CandleStick
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCurrent_DOGE_USDT_CandleStick]
AS
BEGIN

DECLARE @CandleStick TABLE
(Id bigint, 
 [Close] decimal(18,0), 
 CloseTime datetime,
 High decimal(18,0),
 Low decimal(18,0),
 [Open] decimal(18,0),
 OpenTime datetime
)

SELECT TOP(1) * 
INTO #lastCandleStick
FROM [Exchange].[dbo].[DOGE_USDT_CandleStick]
ORDER BY Id DESC

SELECT *
INTO #closedOrdersByLastMinute 
FROM [Exchange].[dbo].[DOGE_USDT_ClosedOrders]
WHERE (SELECT CloseTime FROM #lastCandleStick) < ClosedDate and ClosedDate < GETDATE()

SELECT TOP (1) * INTO #lastOrder FROM #closedOrdersByLastMinute ORDER BY ClosedDate DESC

INSERT INTO @CandleStick([Open], OpenTime, High, Low, [Close], CloseTime)
VALUES ((SELECT [Close] FROM #lastCandleStick),
		(SELECT CloseTime FROM #lastCandleStick),
		(SELECT max(ExposedPrice) FROM #closedOrdersByLastMinute),
		(SELECT min(ExposedPrice) FROM #closedOrdersByLastMinute),
		(SELECT ExposedPrice FROM #lastOrder),
		(SELECT ClosedDate FROM #lastOrder))
		
SELECT * FROM @CandleStick
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCurrent_ETH_USDT_CandleStick]
AS
BEGIN

DECLARE @CandleStick TABLE
(Id bigint, 
 [Close] decimal(18,0), 
 CloseTime datetime,
 High decimal(18,0),
 Low decimal(18,0),
 [Open] decimal(18,0),
 OpenTime datetime
)

SELECT TOP(1) * 
INTO #lastCandleStick
FROM [Exchange].[dbo].[ETH_USDT_CandleStick]
ORDER BY Id DESC

SELECT *
INTO #closedOrdersByLastMinute 
FROM [Exchange].[dbo].[ETH_USDT_ClosedOrders]
WHERE (SELECT CloseTime FROM #lastCandleStick) < ClosedDate and ClosedDate < GETDATE()

SELECT TOP (1) * INTO #lastOrder FROM #closedOrdersByLastMinute ORDER BY ClosedDate DESC

INSERT INTO @CandleStick([Open], OpenTime, High, Low, [Close], CloseTime)
VALUES ((SELECT [Close] FROM #lastCandleStick),
		(SELECT CloseTime FROM #lastCandleStick),
		(SELECT max(ExposedPrice) FROM #closedOrdersByLastMinute),
		(SELECT min(ExposedPrice) FROM #closedOrdersByLastMinute),
		(SELECT ExposedPrice FROM #lastOrder),
		(SELECT ClosedDate FROM #lastOrder))
		
SELECT * FROM @CandleStick
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCurrent_LTC_USDT_CandleStick]
AS
BEGIN

DECLARE @CandleStick TABLE
(Id bigint, 
 [Close] decimal(18,0), 
 CloseTime datetime,
 High decimal(18,0),
 Low decimal(18,0),
 [Open] decimal(18,0),
 OpenTime datetime
)

SELECT TOP(1) * 
INTO #lastCandleStick
FROM [Exchange].[dbo].[LTC_USDT_CandleStick]
ORDER BY Id DESC

SELECT *
INTO #closedOrdersByLastMinute 
FROM [Exchange].[dbo].[LTC_USDT_ClosedOrders]
WHERE (SELECT CloseTime FROM #lastCandleStick) < ClosedDate and ClosedDate < GETDATE()

SELECT TOP (1) * INTO #lastOrder FROM #closedOrdersByLastMinute ORDER BY ClosedDate DESC

INSERT INTO @CandleStick([Open], OpenTime, High, Low, [Close], CloseTime)
VALUES ((SELECT [Close] FROM #lastCandleStick),
		(SELECT CloseTime FROM #lastCandleStick),
		(SELECT max(ExposedPrice) FROM #closedOrdersByLastMinute),
		(SELECT min(ExposedPrice) FROM #closedOrdersByLastMinute),
		(SELECT ExposedPrice FROM #lastOrder),
		(SELECT ClosedDate FROM #lastOrder))
		
SELECT * FROM @CandleStick
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCurrentCandleStick]
@pairName nvarchar(20)
AS
BEGIN

DECLARE @sql nvarchar(MAX) = '
DECLARE @CandleStick TABLE
(Id bigint, 
 [Close] decimal(18,0), 
 CloseTime datetime,
 High decimal(18,0),
 Low decimal(18,0),
 [Open] decimal(18,0),
 OpenTime datetime
)

SELECT TOP(1) * 
INTO #lastCandleStick
FROM [Exchange].[dbo].[' + @pairName + '_CandleStick]
ORDER BY Id DESC

SELECT *
INTO #closedOrdersByLastMinute 
FROM [Exchange].[dbo].[' + @pairName + '_ClosedOrders]
WHERE (SELECT CloseTime FROM #lastCandleStick) < ClosedDate and ClosedDate < GETDATE()

SELECT TOP (1) * INTO #lastOrder FROM #closedOrdersByLastMinute ORDER BY ClosedDate DESC

INSERT INTO @CandleStick([Open], OpenTime, High, Low, [Close], CloseTime)
VALUES ((SELECT [Close] FROM #lastCandleStick),
		(SELECT CloseTime FROM #lastCandleStick),
		(SELECT max(StartPrice) FROM #closedOrdersByLastMinute),
		(SELECT min(StartPrice) FROM #closedOrdersByLastMinute),
		(SELECT StartPrice FROM #lastOrder),
		(SELECT ClosedDate FROM #lastOrder))

SELECT * FROM @CandleStick'

EXEC sp_executesql @sql

END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetEventsByUserIdWithOrderByDescWhenDate]
@userId nvarchar(450)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[Events]
WHERE UserId = @userId
ORDER BY WhenDate Desc


END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetIncomeTransactions_Paged]
@page int,
@pageSize int
AS
BEGIN

Select
  CurrencyAcronim
  ,Amount
  ,TransactionFee
  ,FromAddress
  ,ToAddress
  ,CreatedDate
  ,Date
  ,UserId
FROM [Exchange].[dbo].[IncomeTransactions]
Order By CreatedDate desc
OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetIncomeTransactionsByUserIdAndCurrencyAcronim]
@userId bigint,
@currencyAcronim nvarchar(50)
AS
BEGIN

SELECT * FROM IncomeTransactions 
WHERE 
UserId = @userId
AND CurrencyAcronim = @currencyAcronim

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLastCandleStick]
@pairName nvarchar(450)
AS
BEGIN

Declare @SQL nvarchar(100)

SET @SQL = 'SELECT TOP 1 * FROM [Exchange].[dbo].[' + @pairName + '_CandleStick] ORDER BY Id DESC'

EXEC(@SQL)
	
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLastFiveEvents_ByUserId]
@userId nvarchar(450)
AS
BEGIN

SELECT TOP(5) * FROM [Exchange].[dbo].[Events]
WHERE UserId = @userId
ORDER BY WhenDate DESC


END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLastIncomeTransactionsByUserId]
@userid nvarchar(450)
AS
BEGIN

Select transactions.* From IncomeTransactions transactions
	Inner join ( SELECT transactionGroup.CurrencyAcronim, max(transactionGroup.Id) LastId
				 FROM IncomeTransactions transactionGroup
				 WHERE transactionGroup.UserId = @userid
				 GROUP BY transactionGroup.CurrencyAcronim)
	transactionMaxIdByAcronim
	On transactions.Id = transactionMaxIdByAcronim.LastId
	
END






GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetLastOrdersBySeconds]
@pairName nvarchar(20),
@seconds nvarchar(10)
AS
BEGIN

Declare @SQL nvarchar(200)

SET @SQL = 'SELECT * 
FROM [Exchange].[dbo].['+ @pairName +'_ClosedOrders]
WHERE DATEADD(second, -'+ @seconds +', GETDATE()) < ClosedDate and ClosedDate < GETDATE()'

EXEC(@SQL)

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetOutcomeTransactions_Paged]
@page int,
@pageSize int
AS
BEGIN

Select
  CurrencyAcronim
  ,Value
  ,CreateDate
  ,ToAddress
  ,State
  ,LastUpdateDate
  ,ErrorText
FROM [Exchange].[dbo].[OutcomeTransactions]
Order By Id desc
OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetP2PBuyersByCryptId]
@page int,
@cryptId int
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[P2PBuyers] 
WHERE 
P2PCryptId = @cryptId
ORDER BY Id
OFFSET 10 * (@page - 1) ROWS
FETCH  NEXT 10 ROWS ONLY
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetP2PCryptById]
@id int
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[P2PCrypts] 
WHERE 
Id = @id

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetP2PCryptByName]
@name nvarchar(100)
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[P2PCrypts] 
WHERE 
[Name] = @name

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetP2PCrypts]
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[P2PCrypts]

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetP2PFiatById]
@fiatId int
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[P2PFiats] 
WHERE 
Id = @fiatId

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetP2PFiats]

AS
BEGIN

SELECT *
  FROM [Exchange].[dbo].[P2PFiats]

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetP2PPaymentById]
@id int
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[P2PPayments] 
WHERE 
Id = @id

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetP2PPayments]

AS
BEGIN

SELECT *
  FROM [Exchange].[dbo].[P2PPayments]

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetP2PPaymentsByP2PUserId]
@p2pUserId bigint
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[P2PUsersPayments] 
WHERE 
P2PUserId = @p2pUserId

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetP2PSellersByCryptId]
@page int,
@cryptId int
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[P2PSellers] 
WHERE 
P2PCryptId = @cryptId
ORDER BY Id
OFFSET 10 * (@page - 1) ROWS
FETCH  NEXT 10 ROWS ONLY
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetP2PTimeFrames]
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[P2PTimeFrames]

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPairByAcronim]
@acronim nvarchar(450)
AS
BEGIN

Select * From Pairs 
Where Acronim = @acronim
	
END






GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPaymentById]
@id bigint
AS
BEGIN

SELECT * FROM [Exchange].[dbo].[Payments] 
WHERE 
Id = @id

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSettings]

AS
BEGIN

SELECT [Id]
      ,[Name]
      ,[Value]
      ,[LastUpdateDateTime]
  FROM [Exchange].[dbo].[Settings]

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetTransfers_Paged]
@page int,
@pageSize int
AS
BEGIN

Select
  WalletFromId,
  WalletToId,
  Value,
  Date, 
  CurrencyAcronim,
  Hash,
  Comment,
  PlatformCommission

FROM [Exchange].[dbo].[Transfers]
Order By Id desc
OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserIdByWalletAddress]
@address nvarchar(max)
AS
BEGIN

Select UserId
FROM Wallets
WHERE Address = @address

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserIncomeWalletByAcronim]
@userid nvarchar(450),
@acronim nvarchar(10)
AS
BEGIN

SELECT iw.[Id]
      ,iw.[UserId]
      ,iw.[Address]
      ,iw.[AddressLabel]
      ,iw.[CurrencyAcronim]
      ,iw.[Created]
      ,iw.[LastUpdate]
  FROM [Exchange].[dbo].[IncomeWallets] iw
  where 
  iw.[UserId] = @userid
  AND iw.CurrencyAcronim = @acronim

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserIncomeWallets]
@userid nvarchar(450)
AS
BEGIN

SELECT iw.[Id]
      ,iw.[UserId]
      ,iw.[Address]
      ,iw.[AddressLabel]
      ,iw.[CurrencyAcronim]
      ,iw.[Created]
      ,iw.[LastUpdate]
  FROM [Exchange].[dbo].[IncomeWallets] iw
  where iw.[UserId] = @userid

END



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserWalletByAcronim]
@userId nvarchar(450),
@acronim nvarchar(10)
AS
BEGIN

SELECT w.[Id]
      ,w.[UserId]
      ,w.[Value]
      ,w.CurrencyAcronim
	  ,w.[Created]
	  ,w.[LastUpdate]
	  ,w.[Address]
  FROM [Exchange].[dbo].[Wallets] w
  where w.[UserId] = @userid AND w.CurrencyAcronim = @acronim

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserWallets]
@userid nvarchar(450)
AS
BEGIN

--declare @acronim nvarchar(10)
--set @acronim = 'GPS'

SELECT w.[Id]
      ,w.[UserId]
      ,w.[Value]
      ,w.CurrencyAcronim
	  ,w.[Created]
	  ,w.[LastUpdate]
	  ,w.[Address]
  FROM [Exchange].[dbo].[Wallets] w
  where w.[UserId] = @userid

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[MoveFromOpenToClosedOrders]
@pair nvarchar(20),
@buyOrSell nvarchar(4),
@createUserId nvarchar(450),
@boughtUserId nvarchar(450),
@id bigint,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@status int,
@createDate datetime
AS
BEGIN

declare @Sql nvarchar(max);

set @sql = 'delete from [Exchange].[dbo].[' + @pair + '_OpenOrders_' + @buyOrSell + '] WHERE Id = ' + CAST(@id as nvarchar(MAX)) + '

insert into [Exchange].[dbo].[' + @pair + '_ClosedOrders] (Total, CreateDate, ClosedDate, IsBuy, StartPrice, ClosedPrice, Difference, Amount, CreateUserId, BoughtUserId, Status)
values (' + CAST(@total as nvarchar(MAX)) + ', ''' + CAST(@createDate as nvarchar(MAX)) + ''', ''' + CAST(getdate() as nvarchar(MAX)) + ''', 1, ' + CAST(@price as nvarchar(MAX)) + ', ' + CAST(@price as nvarchar(MAX)) + ', 0, ' + CAST(@amount as nvarchar(MAX)) + ', ''' + @createUserId + ''', ''' + @boughtUserId + ''', ' + CAST(@status as nvarchar(MAX)) + ')'

exec sp_executesql @sql

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Pairs_Create_OpenOrder_Buy]
@pair nvarchar(20),
@userid nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@new_identity bigint OUTPUT
AS
BEGIN

declare @Sql nvarchar(max);

set @Sql = 'INSERT INTO [Exchange].[dbo].[' + @pair + '_OpenOrders_Buy] (Price, Amount, Total, CreateUserId) VALUES (' + CAST(@price as nvarchar(MAX)) + ', ' + CAST(@amount as nvarchar(MAX)) + ', ' + CAST(@total as nvarchar(MAX)) + ',''' + @userid + ''') select SCOPE_IDENTITY()'
exec sp_executesql @sql 

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Pairs_Create_OpenOrder_Sell]
@pair nvarchar(20),
@userid nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@new_identity bigint OUTPUT
AS
BEGIN

declare @Sql nvarchar(max);

set @Sql = 'INSERT INTO [Exchange].[dbo].[' + @pair + '_OpenOrders_Sell] (Price, Amount, Total, CreateUserId) VALUES (' + CAST(@price as nvarchar(MAX)) + ', ' + CAST(@amount as nvarchar(MAX)) + ', ' + CAST(@total as nvarchar(MAX)) + ',''' + @userid + ''') select SCOPE_IDENTITY()'
exec sp_executesql @sql 

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_BCH_BTC_BuyOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 15;
--set @amount = 20;
--set @total = 100;
--set @createDate = '24/10/2021';

--select sell order with hight price

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[BCH_BTC_OpenOrders_Sell]
WHERE  @price >= Price
ORDER  BY Price

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Buy]
		@pair = 'BCH_BTC',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[BCH_BTC_OpenOrders_Sell]
	WHERE  Id =  
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BCH_BTC_ClosedOrders] (	
				Total, 
				CreateDate,
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[BCH_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  			
	
	UPDATE [Exchange].[dbo].[BCH_BTC_OpenOrders_Sell]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[BCH_BTC_OpenOrders_Sell]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BCH_BTC_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	INSERT INTO [Exchange].[dbo].[BCH_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  	

	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_BCH_BTC_SellOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 5;
--set @amount = 20;
--set @total = 100;
--set @createDate = '23/10/2021';

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[BCH_BTC_OpenOrders_Buy]
WHERE  @price <= Price 
ORDER  BY Price DESC

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Sell]
		@pair = 'BCH_BTC',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[BCH_BTC_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BCH_BTC_ClosedOrders] (	
				Total, 
				CreateDate, 
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				 1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	

	UPDATE [Exchange].[dbo].[Wallets] 
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'
	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[BCH_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
	
	UPDATE [Exchange].[dbo].[BCH_BTC_OpenOrders_Buy]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[BCH_BTC_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BCH_BTC_ClosedOrders] (
				Total, CreateDate,
				ClosedDate, IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'  			

	INSERT INTO [Exchange].[dbo].[BCH_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
		
	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_BCH_USDT_BuyOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 15;
--set @amount = 20;
--set @total = 100;
--set @createDate = '24/10/2021';

--select sell order with hight price

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[BCH_USDT_OpenOrders_Sell]
WHERE  @price >= Price
ORDER  BY Price

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Buy]
		@pair = 'BCH_USDT',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[BCH_USDT_OpenOrders_Sell]
	WHERE  Id =  
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BCH_USDT_ClosedOrders] (	
				Total, 
				CreateDate,
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[BCH_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  			
	
	UPDATE [Exchange].[dbo].[BCH_USDT_OpenOrders_Sell]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[BCH_USDT_OpenOrders_Sell]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BCH_USDT_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	INSERT INTO [Exchange].[dbo].[BCH_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  	

	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_BCH_USDT_SellOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 5;
--set @amount = 20;
--set @total = 100;
--set @createDate = '23/10/2021';

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[BCH_USDT_OpenOrders_Buy]
WHERE  @price <= Price 
ORDER  BY Price DESC

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Sell]
		@pair = 'BCH_USDT',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[BCH_USDT_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BCH_USDT_ClosedOrders] (	
				Total, 
				CreateDate, 
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				 1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	

	UPDATE [Exchange].[dbo].[Wallets] 
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'
	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[BCH_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
	
	UPDATE [Exchange].[dbo].[BCH_USDT_OpenOrders_Buy]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[BCH_USDT_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BCH_USDT_ClosedOrders] (
				Total, CreateDate,
				ClosedDate, IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'  			

	INSERT INTO [Exchange].[dbo].[BCH_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
		
	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_BTC_USDT_BuyOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 15;
--set @amount = 20;
--set @total = 100;
--set @createDate = '24/10/2021';

--select sell order with hight price

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
WHERE  @price >= Price
ORDER  BY Price

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Buy]
		@pair = 'BTC_USDT',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
	WHERE  Id =  
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (	
				Total, 
				CreateDate,
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  			
	
	UPDATE [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  	

	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_BTC_USDT_SellOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 5;
--set @amount = 20;
--set @total = 100;
--set @createDate = '23/10/2021';

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy]
WHERE  @price <= Price 
ORDER  BY Price DESC

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Sell]
		@pair = 'BTC_USDT',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (	
				Total, 
				CreateDate, 
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				 1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	

	UPDATE [Exchange].[dbo].[Wallets] 
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'
	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
	
	UPDATE [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				Total, CreateDate,
				ClosedDate, IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'  			

	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
		
	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_DASH_BTC_BuyOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 15;
--set @amount = 20;
--set @total = 100;
--set @createDate = '24/10/2021';

--select sell order with hight price

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[DASH_BTC_OpenOrders_Sell]
WHERE  @price >= Price
ORDER  BY Price

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Buy]
		@pair = 'DASH_BTC',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[DASH_BTC_OpenOrders_Sell]
	WHERE  Id =  
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[DASH_BTC_ClosedOrders] (	
				Total, 
				CreateDate,
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[DASH_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  			
	
	UPDATE [Exchange].[dbo].[DASH_BTC_OpenOrders_Sell]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[DASH_BTC_OpenOrders_Sell]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[DASH_BTC_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	INSERT INTO [Exchange].[dbo].[DASH_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  	

	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_DASH_BTC_SellOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 5;
--set @amount = 20;
--set @total = 100;
--set @createDate = '23/10/2021';

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[DASH_BTC_OpenOrders_Buy]
WHERE  @price <= Price 
ORDER  BY Price DESC

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Sell]
		@pair = 'DASH_BTC',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[DASH_BTC_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[DASH_BTC_ClosedOrders] (	
				Total, 
				CreateDate, 
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				 1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	

	UPDATE [Exchange].[dbo].[Wallets] 
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'
	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[DASH_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
	
	UPDATE [Exchange].[dbo].[DASH_BTC_OpenOrders_Buy]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[DASH_BTC_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[DASH_BTC_ClosedOrders] (
				Total, CreateDate,
				ClosedDate, IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'  			

	INSERT INTO [Exchange].[dbo].[DASH_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
		
	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_DASH_USDT_BuyOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 15;
--set @amount = 20;
--set @total = 100;
--set @createDate = '24/10/2021';

--select sell order with hight price

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[DASH_USDT_OpenOrders_Sell]
WHERE  @price >= Price
ORDER  BY Price

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Buy]
		@pair = 'DASH_USDT',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[DASH_USDT_OpenOrders_Sell]
	WHERE  Id =  
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[DASH_USDT_ClosedOrders] (	
				Total, 
				CreateDate,
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[DASH_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  			
	
	UPDATE [Exchange].[dbo].[DASH_USDT_OpenOrders_Sell]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[DASH_USDT_OpenOrders_Sell]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[DASH_USDT_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	INSERT INTO [Exchange].[dbo].[DASH_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  	

	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_DASH_USDT_SellOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 5;
--set @amount = 20;
--set @total = 100;
--set @createDate = '23/10/2021';

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[DASH_USDT_OpenOrders_Buy]
WHERE  @price <= Price 
ORDER  BY Price DESC

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Sell]
		@pair = 'DASH_USDT',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[DASH_USDT_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[DASH_USDT_ClosedOrders] (	
				Total, 
				CreateDate, 
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				 1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	

	UPDATE [Exchange].[dbo].[Wallets] 
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'
	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[DASH_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
	
	UPDATE [Exchange].[dbo].[DASH_USDT_OpenOrders_Buy]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[DASH_USDT_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[DASH_USDT_ClosedOrders] (
				Total, CreateDate,
				ClosedDate, IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'  			

	INSERT INTO [Exchange].[dbo].[DASH_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
		
	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_DOGE_BTC_BuyOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 15;
--set @amount = 20;
--set @total = 100;
--set @createDate = '24/10/2021';

--select sell order with hight price

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[DOGE_BTC_OpenOrders_Sell]
WHERE  @price >= Price
ORDER  BY Price

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Buy]
		@pair = 'DOGE_BTC',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[DOGE_BTC_OpenOrders_Sell]
	WHERE  Id =  
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[DOGE_BTC_ClosedOrders] (	
				Total, 
				CreateDate,
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[DOGE_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  			
	
	UPDATE [Exchange].[dbo].[DOGE_BTC_OpenOrders_Sell]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[DOGE_BTC_OpenOrders_Sell]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[DOGE_BTC_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	INSERT INTO [Exchange].[dbo].[DOGE_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  	

	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_DOGE_BTC_SellOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 5;
--set @amount = 20;
--set @total = 100;
--set @createDate = '23/10/2021';

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[DOGE_BTC_OpenOrders_Buy]
WHERE  @price <= Price 
ORDER  BY Price DESC

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Sell]
		@pair = 'DOGE_BTC',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[DOGE_BTC_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[DOGE_BTC_ClosedOrders] (	
				Total, 
				CreateDate, 
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				 1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	

	UPDATE [Exchange].[dbo].[Wallets] 
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'
	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[DOGE_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
	
	UPDATE [Exchange].[dbo].[DOGE_BTC_OpenOrders_Buy]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[DOGE_BTC_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[DOGE_BTC_ClosedOrders] (
				Total, CreateDate,
				ClosedDate, IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'  			

	INSERT INTO [Exchange].[dbo].[DOGE_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
		
	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_DOGE_USDT_BuyOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 15;
--set @amount = 20;
--set @total = 100;
--set @createDate = '24/10/2021';

--select sell order with hight price

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[DOGE_USDT_OpenOrders_Sell]
WHERE  @price >= Price
ORDER  BY Price

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Buy]
		@pair = 'DOGE_USDT',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[DOGE_USDT_OpenOrders_Sell]
	WHERE  Id =  
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[DOGE_USDT_ClosedOrders] (	
				Total, 
				CreateDate,
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[DOGE_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  			
	
	UPDATE [Exchange].[dbo].[DOGE_USDT_OpenOrders_Sell]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[DOGE_USDT_OpenOrders_Sell]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[DOGE_USDT_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	INSERT INTO [Exchange].[dbo].[DOGE_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  	

	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_DOGE_USDT_SellOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 5;
--set @amount = 20;
--set @total = 100;
--set @createDate = '23/10/2021';

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[DOGE_USDT_OpenOrders_Buy]
WHERE  @price <= Price 
ORDER  BY Price DESC

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Sell]
		@pair = 'DOGE_USDT',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[DOGE_USDT_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[DOGE_USDT_ClosedOrders] (	
				Total, 
				CreateDate, 
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				 1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	

	UPDATE [Exchange].[dbo].[Wallets] 
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'
	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[DOGE_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
	
	UPDATE [Exchange].[dbo].[DOGE_USDT_OpenOrders_Buy]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[DOGE_USDT_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[DOGE_USDT_ClosedOrders] (
				Total, CreateDate,
				ClosedDate, IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'  			

	INSERT INTO [Exchange].[dbo].[DOGE_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
		
	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_ETH_BTC_BuyOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 15;
--set @amount = 20;
--set @total = 100;
--set @createDate = '24/10/2021';

--select sell order with hight price

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[ETH_BTC_OpenOrders_Sell]
WHERE  @price >= Price
ORDER  BY Price

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Buy]
		@pair = 'ETH_BTC',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[ETH_BTC_OpenOrders_Sell]
	WHERE  Id =  
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[ETH_BTC_ClosedOrders] (	
				Total, 
				CreateDate,
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[ETH_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  			
	
	UPDATE [Exchange].[dbo].[ETH_BTC_OpenOrders_Sell]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[ETH_BTC_OpenOrders_Sell]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[ETH_BTC_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	INSERT INTO [Exchange].[dbo].[ETH_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  	

	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_ETH_BTC_SellOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 5;
--set @amount = 20;
--set @total = 100;
--set @createDate = '23/10/2021';

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[ETH_BTC_OpenOrders_Buy]
WHERE  @price <= Price 
ORDER  BY Price DESC

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Sell]
		@pair = 'ETH_BTC',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[ETH_BTC_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[ETH_BTC_ClosedOrders] (	
				Total, 
				CreateDate, 
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				 1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	

	UPDATE [Exchange].[dbo].[Wallets] 
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'
	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[ETH_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
	
	UPDATE [Exchange].[dbo].[ETH_BTC_OpenOrders_Buy]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[ETH_BTC_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[ETH_BTC_ClosedOrders] (
				Total, CreateDate,
				ClosedDate, IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'  			

	INSERT INTO [Exchange].[dbo].[ETH_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
		
	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_ETH_USDT_BuyOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 15;
--set @amount = 20;
--set @total = 100;
--set @createDate = '24/10/2021';

--select sell order with hight price

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[ETH_USDT_OpenOrders_Sell]
WHERE  @price >= Price
ORDER  BY Price

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Buy]
		@pair = 'ETH_USDT',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[ETH_USDT_OpenOrders_Sell]
	WHERE  Id =  
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[ETH_USDT_ClosedOrders] (	
				Total, 
				CreateDate,
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[ETH_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  			
	
	UPDATE [Exchange].[dbo].[ETH_USDT_OpenOrders_Sell]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[ETH_USDT_OpenOrders_Sell]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[ETH_USDT_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	INSERT INTO [Exchange].[dbo].[ETH_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  	

	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_ETH_USDT_SellOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 5;
--set @amount = 20;
--set @total = 100;
--set @createDate = '23/10/2021';

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[ETH_USDT_OpenOrders_Buy]
WHERE  @price <= Price 
ORDER  BY Price DESC

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Sell]
		@pair = 'ETH_USDT',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[ETH_USDT_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[ETH_USDT_ClosedOrders] (	
				Total, 
				CreateDate, 
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				 1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	

	UPDATE [Exchange].[dbo].[Wallets] 
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'
	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[ETH_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
	
	UPDATE [Exchange].[dbo].[ETH_USDT_OpenOrders_Buy]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[ETH_USDT_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[ETH_USDT_ClosedOrders] (
				Total, CreateDate,
				ClosedDate, IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'  			

	INSERT INTO [Exchange].[dbo].[ETH_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
		
	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_LTC_BTC_BuyOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 15;
--set @amount = 20;
--set @total = 100;
--set @createDate = '24/10/2021';

--select sell order with hight price

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[LTC_BTC_OpenOrders_Sell]
WHERE  @price >= Price
ORDER  BY Price

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Buy]
		@pair = 'LTC_BTC',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[LTC_BTC_OpenOrders_Sell]
	WHERE  Id =  
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[LTC_BTC_ClosedOrders] (	
				Total, 
				CreateDate,
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[LTC_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  			
	
	UPDATE [Exchange].[dbo].[LTC_BTC_OpenOrders_Sell]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[LTC_BTC_OpenOrders_Sell]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[LTC_BTC_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	INSERT INTO [Exchange].[dbo].[LTC_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  	

	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_LTC_BTC_SellOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 5;
--set @amount = 20;
--set @total = 100;
--set @createDate = '23/10/2021';

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[LTC_BTC_OpenOrders_Buy]
WHERE  @price <= Price 
ORDER  BY Price DESC

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Sell]
		@pair = 'LTC_BTC',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[LTC_BTC_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[LTC_BTC_ClosedOrders] (	
				Total, 
				CreateDate, 
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				 1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	

	UPDATE [Exchange].[dbo].[Wallets] 
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'
	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[LTC_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
	
	UPDATE [Exchange].[dbo].[LTC_BTC_OpenOrders_Buy]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[LTC_BTC_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[LTC_BTC_ClosedOrders] (
				Total, CreateDate,
				ClosedDate, IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'  			

	INSERT INTO [Exchange].[dbo].[LTC_BTC_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
		
	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_LTC_USDT_BuyOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 15;
--set @amount = 20;
--set @total = 100;
--set @createDate = '24/10/2021';

--select sell order with hight price

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[LTC_USDT_OpenOrders_Sell]
WHERE  @price >= Price
ORDER  BY Price

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Buy]
		@pair = 'LTC_USDT',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[LTC_USDT_OpenOrders_Sell]
	WHERE  Id =  
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[LTC_USDT_ClosedOrders] (	
				Total, 
				CreateDate,
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[LTC_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  			
	
	UPDATE [Exchange].[dbo].[LTC_USDT_OpenOrders_Sell]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[LTC_USDT_OpenOrders_Sell]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[LTC_USDT_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				0,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Total FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'USDT' 

	INSERT INTO [Exchange].[dbo].[LTC_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				1,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @amount
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'BTC'  	

	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Process_LTC_USDT_SellOrder]
@createUserId nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@createDate datetime
AS
BEGIN

--IF OBJECT_ID(N'tempdb..#selectedOrder') IS NOT NULL
--BEGIN
--DROP TABLE #selectedOrder
--END

--declare @createUserId nvarchar(450);
--declare @price decimal(38,20);
--declare @amount decimal(38,20);
--declare @total decimal(38,20);
--declare @createDate datetime;

--set @createUserId = 'c7523ee3-fa66-4d84-90b6-ef049e60af67';
--set @price = 5;
--set @amount = 20;
--set @total = 100;
--set @createDate = '23/10/2021';

SELECT TOP 1 *
INTO   #selectedOrder
FROM   [Exchange].[dbo].[LTC_USDT_OpenOrders_Buy]
WHERE  @price <= Price 
ORDER  BY Price DESC

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Pairs_Create_OpenOrder_Sell]
		@pair = 'LTC_USDT',
		@userId = @createUserId,
		@price = @price,
		@amount = @amount,
		@total = @total,
		@new_identity = @newId output

	SELECT @amount as Amount, @newId as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount > @selectOrderAmount)
BEGIN
	SET @amountLocal = @amount - @selectOrderAmount;
	
	DELETE FROM [Exchange].[dbo].[LTC_USDT_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[LTC_USDT_ClosedOrders] (	
				Total, 
				CreateDate, 
				ClosedDate, 
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				 1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)
	

	UPDATE [Exchange].[dbo].[Wallets] 
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'
	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[LTC_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
	
	UPDATE [Exchange].[dbo].[LTC_USDT_OpenOrders_Buy]
	SET    Price = (SELECT Price FROM #selectedOrder),
		   Amount = (@selectOrderAmount - @amount),
		   CreateUserId = (SELECT CreateUserId FROM #selectedOrder)
	WHERE  Id = (SELECT Id FROM #selectedOrder)
	
	SELECT 0 as Amount, -1 as Id, '-1' as ClosedOrderUserId, -1 as ClosedOrderId;
END
ELSE IF (@amount = @selectOrderAmount)
BEGIN

	DELETE FROM [Exchange].[dbo].[LTC_USDT_OpenOrders_Buy]
	WHERE  Id = 
		(SELECT Id FROM #selectedOrder) 

	INSERT INTO [Exchange].[dbo].[LTC_USDT_ClosedOrders] (
				Total, CreateDate,
				ClosedDate, IsBuy, StartPrice, ClosedPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)
		VALUES ((SELECT Total FROM #selectedOrder),
				(SELECT CreateDate FROM #selectedOrder),
				 getdate(),
				1,
				(SELECT Price FROM #selectedOrder),
				@price,
				((SELECT Price FROM #selectedOrder) - @price),
				(SELECT Amount FROM #selectedOrder),
				(SELECT CreateUserId FROM #selectedOrder),
				@createUserId, 
				1)


	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + (SELECT Amount FROM #selectedOrder)
	WHERE UserId = (SELECT CreateUserId FROM #selectedOrder) 
		AND CurrencyAcronim = 'BTC'  			

	INSERT INTO [Exchange].[dbo].[LTC_USDT_ClosedOrders] (
				Total, 
				CreateDate, 
				ClosedDate,
				IsBuy, 
				StartPrice, 
				ClosedPrice, 
				Difference, 
				Amount,
				CreateUserId, 
				BoughtUserId, 
				Status)

		VALUES (@total,
				@createDate,
				getdate(),
				0,
				@price,
				(SELECT Price FROM #selectedOrder),
				(@price - (SELECT Price FROM #selectedOrder)),
				@amount,
				@createUserId,
				(SELECT CreateUserId FROM #selectedOrder), 
				1)
				
	UPDATE [Exchange].[dbo].[Wallets]
	SET Value = Value + @total
	WHERE UserId = @createUserId 
		AND CurrencyAcronim = 'USDT' 
		
	SELECT 0 as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SendCoins] 
@senderUserId nvarchar(450),
@receiverUserId nvarchar(450),
@typeSend int,
@typeRecieve int,

@Comment nvarchar(450),
@currencyAcronim nvarchar(10),
@value decimal(38,20),
@platformCommission decimal(38,20),

@startBalanceSender  decimal(38,20),
@resultBalanceSender decimal(38,20),
@startBalanceReceiver decimal(38,20),
@resultBalanceReceiver decimal(38,20),

@senderWalletId int,
@receiverWalletId int,
@hash varchar(66)

AS

BEGIN

UPDATE [Exchange].[dbo].[Wallets]
SET Value = @resultBalanceSender, LastUpdate = GETDATE()
WHERE Id = @senderWalletId

UPDATE [Exchange].[dbo].[Wallets]
SET Value = @resultBalanceReceiver, LastUpdate = GETDATE()
WHERE Id = @receiverWalletId

insert into [Exchange].[dbo].[Transfers] (WalletFromId, WalletToId, Value, Date, CurrencyAcronim, Hash, Comment,
				PlatformCommission)
values (@senderWalletId, @receiverWalletId, @value, GETDATE(), @currencyAcronim, @hash, @Comment, @platformCommission)

insert into [Exchange].[dbo].[Events] (UserId, Type, Value, 
StartBalance, ResultBalance, Comment, WhenDate, CurrencyAcronim, PlatformCommission)
values (@senderUserId, @typeSend, @value, @startBalanceSender, @resultBalanceSender,
@Comment, GETDATE(), @currencyAcronim, @platformCommission)

insert into [Exchange].[dbo].[Events] (UserId, Type, Value,
StartBalance, ResultBalance, Comment, WhenDate, CurrencyAcronim, PlatformCommission)
values (@receiverUserId, @typeRecieve, @value, @startBalanceReceiver, @resultBalanceReceiver,
@Comment, GETDATE(), @currencyAcronim, @platformCommission)

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[UpdatePairsStatistics]
AS
BEGIN

----------------- BCH BTC
--GO
declare @BCH_BTC_24_hour_ago_price DECIMAL(38, 20);
declare @BCH_BTC_1_hour_ago_price DECIMAL(38, 20);
set @BCH_BTC_24_hour_ago_price = (select TOP 1 ClosedPrice from BCH_BTC_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @BCH_BTC_1_hour_ago_price = (select TOP 1 ClosedPrice from BCH_BTC_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);


UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from BCH_BTC_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@BCH_BTC_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@BCH_BTC_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'BCHBTC'

------------------- BCH USDT
--GO
declare @BCH_USDT_24_hour_ago_price DECIMAL(38, 20);
declare @BCH_USDT_1_hour_ago_price DECIMAL(38, 20);
set @BCH_USDT_24_hour_ago_price = (select TOP 1 ClosedPrice from BCH_USDT_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @BCH_USDT_1_hour_ago_price = (select TOP 1 ClosedPrice from BCH_USDT_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from BCH_USDT_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@BCH_USDT_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@BCH_USDT_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'BCHUSDT'

------------------- BTC USDT
--GO
declare @BTC_USDT_24_hour_ago_price DECIMAL(38, 20);
declare @BTC_USDT_1_hour_ago_price DECIMAL(38, 20);
set @BTC_USDT_24_hour_ago_price = (select TOP 1 ClosedPrice from BTC_USDT_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @BTC_USDT_1_hour_ago_price = (select TOP 1 ClosedPrice from BTC_USDT_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from BTC_USDT_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@BTC_USDT_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@BTC_USDT_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'BTCUSDT'

------------------- DASH BTC
--GO
declare @DASH_BTC_24_hour_ago_price DECIMAL(38, 20);
declare @DASH_BTC_1_hour_ago_price DECIMAL(38, 20);
set @DASH_BTC_24_hour_ago_price = (select TOP 1 ClosedPrice from DASH_BTC_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @DASH_BTC_1_hour_ago_price = (select TOP 1 ClosedPrice from DASH_BTC_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from DASH_BTC_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@DASH_BTC_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@DASH_BTC_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'DASHBTC'

------------------- DASH USDT
--GO
declare @DASH_USDT_24_hour_ago_price DECIMAL(38, 20);
declare @DASH_USDT_1_hour_ago_price DECIMAL(38, 20);
set @DASH_USDT_24_hour_ago_price = (select TOP 1 ClosedPrice from DASH_USDT_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @DASH_USDT_1_hour_ago_price = (select TOP 1 ClosedPrice from DASH_USDT_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from DASH_USDT_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@DASH_USDT_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@DASH_USDT_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'DASHUSDT'

------------------- DOGE BTC
--GO
declare @DOGE_BTC_24_hour_ago_price DECIMAL(38, 20);
declare @DOGE_BTC_1_hour_ago_price DECIMAL(38, 20);
set @DOGE_BTC_24_hour_ago_price = (select TOP 1 ClosedPrice from DOGE_BTC_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @DOGE_BTC_1_hour_ago_price = (select TOP 1 ClosedPrice from DOGE_BTC_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from DOGE_BTC_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@DOGE_BTC_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@DOGE_BTC_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'DOGEBTC'

------------------- DOGE USDT
--GO
declare @DOGE_USDT_24_hour_ago_price DECIMAL(38, 20);
declare @DOGE_USDT_1_hour_ago_price DECIMAL(38, 20);
set @DOGE_USDT_24_hour_ago_price = (select TOP 1 ClosedPrice from DOGE_USDT_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @DOGE_USDT_1_hour_ago_price = (select TOP 1 ClosedPrice from DOGE_USDT_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from DOGE_USDT_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@DOGE_USDT_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@DOGE_USDT_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'DOGEUSDT'

------------------- ETH BTC
--GO
declare @ETH_BTC_24_hour_ago_price DECIMAL(38, 20);
declare @ETH_BTC_1_hour_ago_price DECIMAL(38, 20);
set @ETH_BTC_24_hour_ago_price = (select TOP 1 ClosedPrice from ETH_BTC_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @ETH_BTC_1_hour_ago_price = (select TOP 1 ClosedPrice from ETH_BTC_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from ETH_BTC_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@ETH_BTC_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@ETH_BTC_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'ETHBTC'

------------------- ETH USDT
--GO
declare @ETH_USDT_24_hour_ago_price DECIMAL(38, 20);
declare @ETH_USDT_1_hour_ago_price DECIMAL(38, 20);
set @ETH_USDT_24_hour_ago_price = (select TOP 1 ClosedPrice from ETH_USDT_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @ETH_USDT_1_hour_ago_price = (select TOP 1 ClosedPrice from ETH_USDT_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from ETH_USDT_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@ETH_USDT_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@ETH_USDT_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'ETHUSDT'

------------------- LTC BTC
--GO
declare @LTC_BTC_24_hour_ago_price DECIMAL(38, 20);
declare @LTC_BTC_1_hour_ago_price DECIMAL(38, 20);
set @LTC_BTC_24_hour_ago_price = (select TOP 1 ClosedPrice from LTC_BTC_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @LTC_BTC_1_hour_ago_price = (select TOP 1 ClosedPrice from LTC_BTC_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from LTC_BTC_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@LTC_BTC_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@LTC_BTC_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'LTCBTC'

------------------- LTC USDT
--GO
declare @LTC_USDT_24_hour_ago_price DECIMAL(38, 20);
declare @LTC_USDT_1_hour_ago_price DECIMAL(38, 20);
set @LTC_USDT_24_hour_ago_price = (select TOP 1 ClosedPrice from LTC_USDT_ClosedOrders where ClosedDate < (GETDATE() - 1) order by Id desc);
set @LTC_USDT_1_hour_ago_price = (select TOP 1 ClosedPrice from LTC_USDT_ClosedOrders where ClosedDate < (dateadd(hh,-1,getdate())) order by Id desc);

UPDATE [Exchange].[dbo].[Pairs]
SET    Price = (select TOP 1 ClosedPrice from LTC_USDT_ClosedOrders order by Id desc)
		, PriceUpdateDate = GETDATE()
		, Change24h = Price / (@LTC_USDT_24_hour_ago_price / 100) - 100
		, Change1h = Price / (@LTC_USDT_1_hour_ago_price / 100) - 100
WHERE [Acronim] = 'LTCUSDT'
--GO

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSetting]
@name nvarchar(MAX),
@value nvarchar(MAX)
AS
BEGIN

UPDATE [Exchange].[dbo].[Settings]
SET    Value = @value,
       LastUpdateDateTime = GETDATE()
WHERE Name = @name 

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTransactionAfterExecution]
@id int,
@state int,
@blockchainCommission decimal (38, 20),
@errorText nvarchar(max)
AS
BEGIN

UPDATE [Exchange].[dbo].[OutcomeTransactions]
SET State = @state, LastUpdateDate = GETDATE(),
BlockchainCommission = @blockchainCommission, ErrorText = @errorText
WHERE Id = @id

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateWalletBalance]
@newWalletBalance decimal(38,20),
@walletId    INT    OUTPUT
AS
BEGIN

UPDATE [Exchange].[dbo].[Wallets]
SET Value = @newWalletBalance
WHERE Id = @walletId

RETURN

END
GO