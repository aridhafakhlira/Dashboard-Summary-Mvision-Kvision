select a.tgl_report, a.total_amount-b.total_amount collection 
 from prod.F_SUMMARY_NETADD_MVISION   a
  inner join  prod.F_SUMMARY_NETADD_MVISION   b on trunc(b.tgl_report)=trunc(a.tgl_report-1) and a.urutan=b.urutan
 where 
 a.urutan in(6) and 
 trunc(a.tgl_report)in( trunc(sysdate-1),trunc(sysdate-2)) 
 order by a.tgl_report asc
 ----- MTD -----------------------
 select a.tgl_report, a.total_amount 
 from prod.F_SUMMARY_NETADD_MVISION   a 
 where 
 a.urutan in(6)  and
 trunc(a.tgl_report)in( trunc(sysdate-1), trunc(ADD_MONTHS(SYSDATE-1, -1)) ) 
order by tgl_report asc