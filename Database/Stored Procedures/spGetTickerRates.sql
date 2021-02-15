ALTER PROCEDURE [dbo].[spGetTickerRates]
AS
BEGIN

select
rub.[Id]
,rub.[Acronim]
,rub.[Site]
,rub.[Price]
,rub.[Date]
from (
    select top 1 *
    from [Rates]
	Where [Acronim] = 'RUB'
    order by Id) rub

union all

select
eur.[Id]
,eur.[Acronim]
,eur.[Site]
,eur.[Price]
,eur.[Date]
from (
    select top 1 *
    from [Rates]
	Where [Acronim] = 'EUR'
    order by Id desc) eur

	union all

select
xau.[Id]
,xau.[Acronim]
,xau.[Site]
,xau.[Price]
,xau.[Date]
from (
    select top 1 *
    from [Rates]
	Where [Acronim] = 'XAU'
    order by Id desc) xau

	union all

select
pl.[Id]
,pl.[Acronim]
,pl.[Site]
,pl.[Price]
,pl.[Date]
from (
    select top 1 *
    from [Rates]
	Where [Acronim] = 'PL'
    order by Id desc) pl

	union all

select
xag.[Id]
,xag.[Acronim]
,xag.[Site]
,xag.[Price]
,xag.[Date]
from (
    select top 1 *
    from [Rates]
	Where [Acronim] = 'XAG'
    order by Id desc) xag

END
