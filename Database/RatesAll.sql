SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RatesAll](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[Site] [nvarchar](150) NOT NULL,
	[Sell] [float] NOT NULL,
	[Buy] [float] NOT NULL,
	[Date] [datetime] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[RatesAll] ADD  CONSTRAINT [DF_RatesAll_Sell]  DEFAULT ((0)) FOR [Sell]
GO

ALTER TABLE [dbo].[RatesAll] ADD  CONSTRAINT [DF_RatesAll_Date]  DEFAULT (getdate()) FOR [Date]
GO


