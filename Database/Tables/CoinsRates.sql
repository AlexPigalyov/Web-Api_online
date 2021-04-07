CREATE TABLE [dbo].[CoinsRates](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Acronim] [nvarchar](10) NOT NULL,
	[Site] [nvarchar](150) NOT NULL,
	[Sell] [float] NOT NULL,
	[Buy] [float] NOT NULL,
	[Date] [datetime] NOT NULL,
	[IsUp] [bit] NOT NULL,
 CONSTRAINT [PK_CoinsRates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CoinsRates] ADD  CONSTRAINT [DF_CoinsRates_Sell]  DEFAULT ((0)) FOR [Sell]
GO

ALTER TABLE [dbo].[CoinsRates] ADD  CONSTRAINT [DF_CoinsRates_Date]  DEFAULT (getdate()) FOR [Date]
GO

ALTER TABLE [dbo].[CoinsRates] ADD  CONSTRAINT [DF_CoinsRates_IsUp]  DEFAULT ((1)) FOR [IsUp]
GO


