ALTER PROCEDURE [dbo].[Get_BTC_USDT_CandleStick]
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





