USE [Exchange]
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
	[ExposedPrice] [decimal](38, 20) NOT NULL,
	[Difference] [decimal](38, 20) NOT NULL,
	[TotalPrice] [decimal](38, 20) NOT NULL,
	[Amount] [decimal](38, 20) NOT NULL,
	[Total] [decimal](38, 20) NOT NULL,
	[Status] [int] NOT NULL,
	[CreateUserId] [nvarchar](450) NOT NULL,
	[BoughtUserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_BTC_USDT_ClosedOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
	[Created] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Type] [int] NOT NULL,
	[Value] [decimal](38, 20) NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[WhenDate] [datetime] NOT NULL,
	[CurrencyAcronim] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_UsersEvents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exceptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[WhenDate] [datetime] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Exceptions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
	[FromAddress] [nvarchar](max) NULL,
	[ToAddress] [nvarchar](max) NOT NULL,
	[Date] [float] NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[IncomeWalletsId] [int] NOT NULL,
 CONSTRAINT [PK_IncomeTransactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutcomeTransactions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FromWalletId] [int] NOT NULL,
	[FromAddress] [nvarchar](max) NOT NULL,
	[ToAddress] [nvarchar](max) NOT NULL,
	[Value] [decimal](38, 20) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CurrencyAcronim] [nvarchar](10) NOT NULL,
	[State] [int] NOT NULL,
	[LastUpdateDate] [datetime] NOT NULL,
	[ErrorText] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
	[Comment] [nvarchar](max) NULL
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Wallets] UNIQUE NONCLUSTERED 
(
	[UserId] ASC,
	[CurrencyAcronim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20211014-094721] ON [dbo].[BTC_USDT_ClosedOrders]
(
	[ClosedDate] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20211017-055453] ON [dbo].[BTC_USDT_OpenOrders_Buy]
(
	[Price] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20211017-055512] ON [dbo].[BTC_USDT_OpenOrders_Sell]
(
	[Price] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BTC_USDT_OpenOrders_Buy] ADD  CONSTRAINT [DF_BTC_USDT_OpenOrders_Buy_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[BTC_USDT_OpenOrders_Sell] ADD  CONSTRAINT [DF_BTC_USDT_OpenOrders_Sell_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Currencies] ADD  CONSTRAINT [DF_Currencies_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Events] ADD  CONSTRAINT [DF_UsersEvents_Value]  DEFAULT ((0)) FOR [Value]
GO
ALTER TABLE [dbo].[Events] ADD  CONSTRAINT [DF_UsersEvents_WhenDate]  DEFAULT (getdate()) FOR [WhenDate]
GO
ALTER TABLE [dbo].[Exceptions] ADD  CONSTRAINT [DF_Exceptions_WhenDate]  DEFAULT (getdate()) FOR [WhenDate]
GO
ALTER TABLE [dbo].[IncomeWallets] ADD  CONSTRAINT [DF_IncomeWallets_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[IncomeWallets] ADD  CONSTRAINT [DF_IncomeWallets_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
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
ALTER TABLE [dbo].[Settings] ADD  CONSTRAINT [DF_Settings_LastUpdateDateTime]  DEFAULT (getdate()) FOR [LastUpdateDateTime]
GO
ALTER TABLE [dbo].[Transfers] ADD  CONSTRAINT [DF_Transfers_Date]  DEFAULT (getdate()) FOR [Date]
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
CREATE PROCEDURE [dbo].[Create_BTC_USDT_OpenOrder]
@userid nvarchar(450),
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@new_identity bigint OUTPUT
AS
BEGIN

INSERT INTO [Exchange].[dbo].[BTC_USDT_OpenOrders] (IsBuy, Price, Amount, Total, CreateUserId)
VALUES (@isBuy, @price, @amount, @total, @userid)

SELECT @new_identity = SCOPE_IDENTITY()

SELECT @new_identity

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Create_BTC_USDT_OpenOrder_Buy]
@userid nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@new_identity bigint OUTPUT
AS
BEGIN

INSERT INTO [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy] (Price, Amount, Total, CreateUserId)
VALUES (@price, @amount, @total, @userid)

set @new_identity = SCOPE_IDENTITY()

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Create_BTC_USDT_OpenOrder_Sell]
@userid nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@new_identity bigint OUTPUT
AS
BEGIN

INSERT INTO [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell] (Price, Amount, Total, CreateUserId)
VALUES (@price, @amount, @total, @userid)

set @new_identity = SCOPE_IDENTITY()

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
CREATE PROCEDURE [dbo].[CreateEvent]
@userid nvarchar(450),
@type int,
@value decimal(38,20),
@comment nvarchar(450),
@whenDate datetime,
@currencyAcronim nvarchar(450)
AS
BEGIN

INSERT INTO [Exchange].[dbo].[Events] (UserId, Type, Value, Comment, WhenDate, CurrencyAcronim)
VALUES (@userid, @type, @value, @comment, @whenDate, @currencyAcronim)

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
@toAddress nvarchar(max),
@date decimal(38, 20),
@userId nvarchar(450),
@incomeWalletId int,
@new_identity    INT    OUTPUT
AS
BEGIN

INSERT INTO [Exchange].[dbo].[IncomeTransactions](CurrencyAcronim, TransactionId, Amount,
TransactionFee, ToAddress, Date, UserId, IncomeWalletsId)
VALUES (@currencyAcronim, @transactionId, @amount, @transactionFee,
@toAddress, @date, @userId, @incomeWalletId)

SELECT @new_identity = SCOPE_IDENTITY()

SELECT @new_identity AS id

RETURN

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateIncomeTransaction_UpdateBalance_CreateEvent]
@currencyAcronim nvarchar(10),
@transactionId nvarchar(max),
@amount decimal(38, 20),
@transactionFee decimal(38, 20),
@fromAddress nvarchar(max),
@toAddress nvarchar(max),
@dateFloat decimal(38, 20),
@userId nvarchar(450),
@incomeWalletId int
AS
BEGIN

if 0 = (Select Count(*) From IncomeTransactions Where TransactionId = @transactionId) 
	BEGIN
		INSERT INTO [Exchange].[dbo].[IncomeTransactions](CurrencyAcronim, TransactionId, Amount,
			TransactionFee, FromAddress, ToAddress, Date, UserId, IncomeWalletsId)
		VALUES (@currencyAcronim, @transactionId, @amount, @transactionFee, @fromAddress,
			@toAddress, @dateFloat, @userId, @incomeWalletId)

		UPDATE [Exchange].[dbo].[Wallets]
		SET Value = Value + @amount
		WHERE CurrencyAcronim = @currencyAcronim and UserId = @userId

		INSERT INTO [Exchange].[dbo].[Events] (UserId, Type, Value, Comment, WhenDate, CurrencyAcronim)
		VALUES (@userid, 2, @amount, 'Income transaction '+ @currencyAcronim, GETDATE(), @currencyAcronim)

		RETURN
	END

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateOutcomeTransaction]
@fromWalletId int,
@fromAdress nvarchar(max),
@toAdress nvarchar(max),
@value decimal(38,20),
@currencyAcronim nvarchar(10),
@state int,
@errorText nvarchar(max)
AS
BEGIN

INSERT INTO [Exchange].[dbo].[OutcomeTransactions] (FromWalletId, FromAddress, ToAddress,
			Value, CreateDate, CurrencyAcronim, State, LastUpdateDate, ErrorText)
VALUES (@fromWalletId, @fromAdress, @toAdress, @value, GETDATE(), @currencyAcronim, 1, GETDATE(), @errorText)

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

SELECT @new_identity = SCOPE_IDENTITY()

SELECT @new_identity AS id

--Create inner wallet if not exist
--insert wallet if not exist
IF NOT EXISTS(SELECT 1 FROM [Exchange].[dbo].[Wallets] WHERE UserId = @userid AND CurrencyAcronim = @currencyAcronim)
BEGIN
INSERT INTO [Exchange].[dbo].[Wallets] (UserId, CurrencyAcronim, Value)
VALUES (@userid, @currencyAcronim, 0)
END

RETURN

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
@new_identity    INT    OUTPUT
AS
BEGIN

INSERT INTO [Exchange].[dbo].[Wallets] (UserId, Address, CurrencyAcronim, Value)
VALUES (@userid, @address, @currencyAcronim, 0)

SELECT @new_identity = SCOPE_IDENTITY()

SELECT @new_identity AS id

RETURN

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
CREATE PROCEDURE [dbo].[Get_BTC_USDT_CandleStick]
AS
BEGIN

SELECT * 
FROM [Exchange].[dbo].[BTC_USDT_CandleStick]

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

SELECT *, 0 as IsBuy FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy]
UNION
SELECT *, 1 as IsBuy FROM [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
WHERE Id = @openOrderId

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_BTC_USDT_OpenOrders]
AS
BEGIN

SELECT * FROM [BTC_USDT_OpenOrders]

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
CREATE PROCEDURE [dbo].[GetCreatedOutcomeTransactionAndSetStateInWork]
@currencyAcronim nvarchar(10)
AS
BEGIN

--IF OBJECT_ID('tempdb..#Temp') IS NOT NULL
--    DROP TABLE #Temp

--create table #Temp
--(
--	[Id] [bigint],
--	[WalletId] [int],
--	[Value] [decimal](38, 20),
--	[Date] [datetime],
--	[OutcomingWallet] [nvarchar](max),
--	[CurrencyAcronim] [nvarchar](10),
--	[State] [int],
--	[LastUpdateDate] [datetime],
--	[ErrorText] [nvarchar](max)
--)

--Insert Into #Temp
--Select [Id]
--      ,[WalletId]
--      ,[Value]
--      ,[Date]
--      ,[OutcomingWallet]
--      ,[CurrencyAcronim]
--      ,[State]
--      ,[LastUpdateDate]
--      ,[ErrorText] 
--from OutcomeTransactions

--UPDATE [OutcomeTransactions]
--SET [State] = 2
--FROM [OutcomeTransactions]
--INNER JOIN ON #Temp.Id = [OutcomeTransactions].Id




declare @transactionId int;

set @transactionId = (select top(1) Id from OutcomeTransactions 
						where [State] = 1 AND CurrencyAcronim = @currencyAcronim)

UPDATE [OutcomeTransactions]
SET [State] = 2,
LastUpdateDate = GetDate()
Where OutcomeTransactions.Id = @transactionId

select top(1) * from OutcomeTransactions 
Where OutcomeTransactions.Id = @transactionId


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
  ,Date
  ,UserId
FROM [Exchange].[dbo].[IncomeTransactions]
Order By Id
OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

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
CREATE PROCEDURE [dbo].[GetLastThreeEvents_ByUserId]
@userId nvarchar(450)
AS
BEGIN

SELECT TOP(3) * FROM [Exchange].[dbo].[Events]
WHERE UserId = @userId
ORDER BY WhenDate DESC


END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetManagerConfirmedOutcomeTransactionAndSetStateInWork]
@currencyAcronim nvarchar(10)
AS
BEGIN

declare @transactionId int;

set @transactionId = (select top(1) Id from OutcomeTransactions 
						where [State] = 1 AND CurrencyAcronim = @currencyAcronim)

UPDATE [OutcomeTransactions]
SET [State] = 3,
LastUpdateDate = GetDate()
Where OutcomeTransactions.Id = @transactionId

select top(1) * from OutcomeTransactions 
Where OutcomeTransactions.Id = @transactionId


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
  ,FromAddress
  ,ToAddress
  ,State
  ,LastUpdateDate
  ,ErrorText
FROM [Exchange].[dbo].[OutcomeTransactions]
Order By Id
OFFSET @pageSize * (@page - 1) ROWS
FETCH  NEXT @pageSize ROWS ONLY

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
@acronim nvarchar(450)
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
CREATE PROCEDURE [dbo].[Move_BTC_USDT_FromOpenOrdersBuyToClosedOrders]
@createUserId nvarchar(450),
@boughtUserId nvarchar(450),
@closedOrderId bigint,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@status int,
@createDate datetime
AS
BEGIN

delete from [Exchange].[dbo].[BTC_USDT_OpenOrders] WHERE OpenOrderId = @closedOrderId

insert into [Exchange].[dbo].[BTC_USDT_ClosedOrders] (Total, CreateDate, ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount, CreateUserId, BoughtUserId, Status)
values (@total, @createDate, getdate(), 1, @price, @price, @amount,0, @createUserId, @boughtUserId, @status)

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Move_BTC_USDT_FromOpenOrdersSellToClosedOrders]
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

delete from [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell] WHERE Id = @id

insert into [Exchange].[dbo].[BTC_USDT_ClosedOrders] (Total, CreateDate, ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount, CreateUserId, BoughtUserId, Status)
values (@total, @createDate, getdate(), 0, @price, @price, @amount,0, @createUserId, @boughtUserId, @status)

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Move_BTC_USDT_FromOpenOrdersToClosedOrders]
@createUserId nvarchar(450),
@boughtUserId nvarchar(450),
@closedOrderId bigint,
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@status int,
@createDate datetime
AS
BEGIN

delete from [Exchange].[dbo].[BTC_USDT_OpenOrders] WHERE OpenOrderId = @closedOrderId

insert into [Exchange].[dbo].[BTC_USDT_ClosedOrders] (Total, CreateDate, ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount, CreateUserId, BoughtUserId, Status)
values (@total, @createDate, getdate(), 1, @price, @price, @amount,0, @createUserId, @boughtUserId, @status)

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
ORDER  BY Price DESC

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Create_BTC_USDT_OpenOrder_Buy]
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
				Total, CreateDate,
				ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
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

	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

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
				IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
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
				Total, CreateDate, ClosedDate,
				IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

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
CREATE PROCEDURE [dbo].[Process_BTC_USDT_CandleStick]
AS
BEGIN

SELECT TOP(1) *
INTO #lastCandleStick
FROM [Exchange].[dbo].[BTC_USDT_CandleStick]
ORDER BY Id DESC

IF NOT EXISTS(SELECT 1 FROM #lastCandleStick)
BEGIN	
	SELECT *
	INTO #closedOrdersByLastMinute 
	FROM [Exchange].[dbo].[BTC_USDT_ClosedOrders]
	WHERE DATEADD(minute, -1, GETDATE()) < ClosedDate and ClosedDate < GETDATE()

	SELECT TOP (1) * INTO #firstOrder FROM #closedOrdersByLastMinute ORDER BY ClosedDate
	SELECT TOP (1) * INTO #lastOrder FROM #closedOrdersByLastMinute ORDER BY ClosedDate DESC

	INSERT INTO [Exchange].[dbo].[BTC_USDT_CandleStick]([Open], OpenTime, High, Low, [Close], CloseTime)
	VALUES ((SELECT ExposedPrice FROM #firstOrder),
			(SELECT ClosedDate FROM #firstOrder),
			(SELECT max(ExposedPrice) FROM #closedOrdersByLastMinute),
			(SELECT min(ExposedPrice) FROM #closedOrdersByLastMinute),
			(SELECT ExposedPrice FROM #lastOrder),
			(SELECT ClosedDate FROM #lastOrder))
END
ELSE
BEGIN
	SELECT *
	INTO #closedOrdersByLastCandleStick
	FROM [Exchange].[dbo].[BTC_USDT_ClosedOrders]
	WHERE (SELECT CloseTime FROM #lastCandleStick) < ClosedDate and ClosedDate < GETDATE()

	SELECT TOP (1) * INTO #lastOrderByCandleStick FROM #closedOrdersByLastCandleStick ORDER BY ClosedDate DESC

	INSERT INTO [Exchange].[dbo].[BTC_USDT_CandleStick]([Open], OpenTime, High, Low, [Close], CloseTime)
	VALUES ((SELECT [Close] FROM #lastCandleStick),
			(SELECT CloseTime FROM #lastCandleStick),
			(SELECT max(ExposedPrice) FROM #closedOrdersByLastCandleStick),
			(SELECT min(ExposedPrice) FROM #closedOrdersByLastCandleStick),
			(SELECT ExposedPrice FROM #lastOrderByCandleStick),
			(SELECT ClosedDate FROM #lastOrderByCandleStick))
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
ORDER  BY Price

DECLARE @selectOrderAmount DECIMAL(38, 20);
SET @selectOrderAmount = 
	(SELECT Amount FROM #selectedOrder) 

DECLARE @amountLocal DECIMAL(38, 20);
SET @amountLocal = 0;

IF NOT EXISTS(SELECT 1 FROM #selectedOrder)
BEGIN	
	DECLARE @newId bigint

	EXEC [Exchange].[dbo].[Create_BTC_USDT_OpenOrder_Sell]
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
				Total, CreateDate, ClosedDate, 
				IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
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
	
	SELECT @amountLocal as Amount, -1 as Id, (SELECT CreateUserId FROM #selectedOrder) as ClosedOrderUserId, (SELECT Id FROM #selectedOrder) as ClosedOrderId;
END
ELSE IF (@amount < @selectOrderAmount)
BEGIN
	INSERT INTO [Exchange].[dbo].[BTC_USDT_ClosedOrders] (
				Total, CreateDate, ClosedDate,
				IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

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
				ClosedDate, IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
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
				Total, CreateDate, ClosedDate,
				IsBuy, ExposedPrice, TotalPrice, Difference, Amount,
				CreateUserId, BoughtUserId, Status)

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

@senderWalletId int,
@receiverWalletId int,
@hash varchar(66)
AS
BEGIN

UPDATE [Exchange].[dbo].[Wallets]
SET Value -= @value, LastUpdate = GETDATE()
WHERE ID = @senderWalletId

UPDATE [Exchange].[dbo].[Wallets]
SET Value += @value, LastUpdate = GETDATE()
WHERE Id = @receiverWalletId

insert into [Exchange].[dbo].[Transfers] (WalletFromId, WalletToId, Value, Date, CurrencyAcronim, Hash, Comment)
values (@senderWalletId, @receiverWalletId, @value, GETDATE(), @currencyAcronim, @hash, @Comment)

insert into [Exchange].[dbo].[Events] (UserId, Type, Value, Comment, WhenDate, CurrencyAcronim)
values (@senderUserId, @typeSend, @value, @Comment, GETDATE(), @currencyAcronim)

insert into [Exchange].[dbo].[Events] (UserId, Type, Value, Comment, WhenDate, CurrencyAcronim)
values (@receiverUserId, @typeRecieve, @value, @Comment, GETDATE(), @currencyAcronim)

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_BTC_USDT_OpenOrder]
@userid nvarchar(450),
@isBuy bit,
@price decimal(38,20),
@amount decimal(38,20),
@openOrderId bigint
AS
BEGIN

UPDATE [Exchange].[dbo].[BTC_USDT_OpenOrders]
SET    IsBuy = @isBuy,
       Price = @price,
       Amount = @amount,
       CreateUserId = @userid
WHERE  OpenOrderId = @openOrderId 

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_BTC_USDT_OpenOrder_Buy]
@userid nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@id bigint
AS
BEGIN

UPDATE [Exchange].[dbo].[BTC_USDT_OpenOrders_Buy]
SET    Price = @price,
       Amount = @amount,
	   Total = @total,
       CreateUserId = @userid
WHERE  Id = @id 

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_BTC_USDT_OpenOrder_Sell]
@userid nvarchar(450),
@price decimal(38,20),
@amount decimal(38,20),
@total decimal(38,20),
@Id bigint
AS
BEGIN

UPDATE [Exchange].[dbo].[BTC_USDT_OpenOrders_Sell]
SET    Price = @price,
       Amount = @amount,
	   Total = @total,
       CreateUserId = @userid
WHERE  Id = @Id 

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
CREATE PROCEDURE [dbo].[UpdateStateOutcomeTransaction]
@id int,
@state int,
@errorText nvarchar(max)
AS
BEGIN

UPDATE [Exchange].[dbo].[OutcomeTransactions]
SET State = @state, LastUpdateDate = GETDATE(), ErrorText = @errorText
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
