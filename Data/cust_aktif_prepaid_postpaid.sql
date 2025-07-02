
--------------active postpaid ------------
select
       a.tgl_report, a.TOTAL_SUBS
        from
          prod.F_SUMMARY_NETADD_MVISION a
        where
          urutan in(4 )
          and trunc(tgl_report) in(trunc(sysdate -1), trunc(sysdate -2)) 
          order by tgl_report asc
          
 ----------------active prepaid ------------
 
 select
       a.tgl_report, a.TOTAL_SUBS
        from
          prod.F_SUMMARY_NETADD_MVISION a
        where
          urutan in(5)
          and trunc(tgl_report) in(trunc(sysdate -1), trunc(sysdate -2)) 
          order by tgl_report asc