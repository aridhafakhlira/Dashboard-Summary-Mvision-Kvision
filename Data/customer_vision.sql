SELECT distinct trunc(sysdate-1) TGL_REPORT,a.customer_id,
case when ns.customer_id is not null then 'NEW SALES' else NULL end flag, 
trunc(sysdate) date_process, --flaging newsales
case when CUSTOMER_CLASS='Prepaid' then 'Prepaid' 
else 'Postpaid' end new_flag, A.STATUS CUST_STATUS, --flaging prepaid or postpaid
A.CUSTOMER_CLASS,A.CUSTOMER_TYPE
FROM (
select customer_id, status , date_process , customer_class,to_date(last_disc),customer_type from PROD.SKYSYS_F_CUSTOMER --SOURCE SKYSYS
    where customer_class in ('Prepaid', 'Postpaid') and trunc(date_process)=trunc(sysdate) and status in ('Active','Pre-disconnected') -- change Residential to Prepaid 140125
	and customer_id not in (select customer_id from prod.F_CUSTOMER_TESTING_SKYSYs)
) A
left join prod.f_f_new_sales_so_dtl ns ON a.customer_id = ns.customer_id and to_char(ns.tgl_report, 'YYYYMM') = to_char(sysdate-1, 'YYYYMM')
FETCH FIRST 100 ROWS ONLY;
