Use fetch_reward;

select * from Receipts;
Select * from brand;
Select * from rewardsReceiptItemList


/* What are the top 5 brands by receipts scanned for most recent month? */

Delimiter //

Create Procedure top5brands()

BEGIN

	With temp 
	AS 
	(
	Select rewardsReceiptItemList,month, rnk, count(*) as cnt from (
	Select rewardsReceiptItemList,month,  DENSE_RANK() Over(order by month DESC) as rnk from(
	SELECT rewardsReceiptItemList, dateScanned, date_format(dateScanned,'%m') as month
	FROM receipts)p )q
	where rnk = 1 group by rewardsReceiptItemList )


	Select name from (
	Select b.name, t.cnt, 
	b.topBrand, Dense_rank() Over(Order by t.cnt DESC) as item_rnk 
	from brand b join temp t on t.rewardsReceiptItemList = b._id where b.topBrand = 1)p 
	where item_rnk < 6 order by cnt DESC;

END //

Delimiter ;

Call top5brands();

/*How does the ranking of the top 5 brands by receipts scanned for the recent 
month compare to the ranking for the previous month?*/

Delimiter //

Create Procedure lastyearrnkcomp()

BEGIN

With temp 
AS 
(
Select rewardsReceiptItemList,month, rnk, count(*) as cnt from (
Select rewardsReceiptItemList,month,  DENSE_RANK() Over(order by month DESC) as rnk from(
SELECT rewardsReceiptItemList, dateScanned, date_format(dateScanned,'%m') as month
FROM receipts)p )q
where rnk = 1 group by rewardsReceiptItemList ),

temp3 as (
 Select distinct name, item_rnk from (
Select b.name, t.cnt, 
b.topBrand, Dense_rank() Over(Order by t.cnt DESC) as item_rnk 
from brand b join temp t on t.rewardsReceiptItemList = b._id where b.topBrand = 1
)p 
where item_rnk < 6 order by cnt DESC), 

temp2 AS 
(
Select rewardsReceiptItemList,month, rnk, count(*) as cnt from (
Select rewardsReceiptItemList,month,  DENSE_RANK() Over(order by month DESC) as rnk from(
SELECT rewardsReceiptItemList, dateScanned, date_format(dateScanned,'%m') as month
FROM receipts)p )q
where rnk = 2 group by rewardsReceiptItemList ),

temp4 as (
 Select distinct name, item_rnk from (
Select b.name, t2.cnt, 
b.topBrand, Dense_rank() Over(Order by t2.cnt DESC) as item_rnk 
from brand b join temp2 t2 on t2.rewardsReceiptItemList = b._id where b.topBrand = 1
)p order by cnt DESC)

Select r.name, r.item_rnk as current_month_rank, s.item_rnk as Last_month_rank
from temp3 r left join temp4 s on r.name = s.name;

END //

Delimiter ;

Call lastyearrnkcomp();


/* When considering average spend from receipts with 
'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater? */

with cte1 as (
Select rewardsReceiptStatus,Avg(totalSpent) Over(Partition by rewardsReceiptStatus) 
as avg_spent 
from Receipts group by rewardsReceiptStatus)

Select rewardsReceiptStatus, avg_spent, case
when rnk = 1 then 'greater'
Else 'not greater' End as Avg_spnd_status
from (Select rewardsReceiptStatus, avg_spent, Dense_rank() Over(order by avg_spent DESC)
as rnk
from cte1)p 

-- When considering total number of items purchased from receipts 
-- with 'rewardsReceiptStatus’ of ‘Accepted’ or ‘Rejected’, which is greater? 

with cte1 as (
Select rewardsReceiptStatus, Count(_id) as total_number_item_purchase, 
Dense_rank() Over(order by Count(_id) DESC)
as rnk
from Receipts group by rewardsReceiptStatus)

Select rewardsReceiptStatus, case
when rnk = 1 then 'greater'
Else 'not greater' End as item_purchase_status , total_number_item_purchase
from cte1


/*Which brand has the most 
transactions among users who were created within the past 6 months?*/

With temp 
AS 
(
Select rewardsReceiptItemList,month, rnk, count(*) as cnt from (
Select rewardsReceiptItemList,month,  DENSE_RANK() Over(order by month DESC) as rnk from(
SELECT rewardsReceiptItemList, dateScanned, date_format(dateScanned,'%m') as month
FROM receipts)p )q
where rnk < 7 group by rewardsReceiptItemList )


 Select name from (
Select b.name, t.cnt, 
b.topBrand, Dense_rank() Over(Order by t.cnt DESC) as item_rnk 
from brand b join temp t on t.rewardsReceiptItemList = b._id where b.topBrand = 1)p 
where item_rnk = 1 order by cnt DESC