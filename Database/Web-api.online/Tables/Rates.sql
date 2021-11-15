CREATE TABLE [dbo].[Rates](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Acronim] [nvarchar](10) NOT NULL,
	[Site] [nvarchar](150) NOT NULL,
	[Buy] [float] NOT NULL,
	[Sell] [float] NOT NULL,
	[Date] [datetime] NOT NULL,
	[IsUp] [bit] NOT NULL,
 CONSTRAINT [PK_Rates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Rates] ADD  CONSTRAINT [DF_Rates_Price]  DEFAULT ((0)) FOR [Buy]
GO

ALTER TABLE [dbo].[Rates] ADD  CONSTRAINT [DF_Rates_Cell]  DEFAULT ((0)) FOR [Sell]
GO

ALTER TABLE [dbo].[Rates] ADD  CONSTRAINT [DF_Rates_Date]  DEFAULT (getdate()) FOR [Date]
GO

ALTER TABLE [dbo].[Rates] ADD  CONSTRAINT [DF_Rates_IsUp]  DEFAULT ((1)) FOR [IsUp]
GO


