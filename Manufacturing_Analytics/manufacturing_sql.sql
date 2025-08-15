create database manu_analysis;
use  manu_analysis;
select * from proj_man;
--  1.Manufactured Qty
select concat(sum(manufactured_qty/1000000),"M") as Total_manufactured_Qty from proj_man;

-- 2. Rejected Qty
select concat(sum(Rejected_qty/10000),"K") as Total_rejected_Qty from proj_man;

-- 3. Processed Qty
Select concat(sum(Processed_qty/1000000),"M") as Total_rejected_Qty from proj_man;

-- 4. Produced Qty
Select concat(sum(Produced_qty/1000000),"M") as Total_rejected_Qty from proj_man;

-- 5. Work Order Qty
Select concat(sum(WO_qty/1000000),"M") as Total_rejected_Qty from proj_man;

-- 6. Production Distribution Trend
Select WO_Month, sum(Manufactured_Qty) as T_Manufactured_Qty,
sum(Rejected_Qty) as T_Rejected_Qty ,
sum(Processed_Qty) as T_Processed_Qty from Proj_man
 group by Wo_Month 
 Order by Wo_Month;

-- 7. empLoyee wise Rejected Qty 
 select Emp_name, sum(Rejected_Qty)as T_Rejected_qty from Proj_Man
 group By Emp_name 
 order by T_Rejected_Qty Desc limit 10;
 
 -- 8. Department Wise Rejected Qty
 Select Department_name, concat(sum(Rejected_qty/10000),"M") ,
 concat(sum(manufactured_qty/1000000),"M") from Proj_man
 group by Department_name;
 
 -- 9. machine wise Rejected Qty
 Select Machine_code , Sum(Rejected_Qty) as T_rejected_Qty from Proj_man
 Group By Machine_code
 order by T_Rejected_Qty Desc limit 10;


-- 10. Buyer Wise Rejected Qty

Select Buyer, Sum(Rejected_Qty) as T_rejected_Qty from Proj_man
Group By Buyer
order by T_Rejected_Qty Desc limit 10;

