
    SELECT
      "source"."TGL_REPORT" "TGL_REPORT",
      "source"."FLAG" "FLAG",
      "source"."TOTAL_SUBS" "TOTAL_SUBS"
    FROM
      (
        select
          tgl_report,
          'Paying Subs' FLAG,
          sum(TOTAL_SUBS) Total_SUBS
        from
          prod.F_SUMMARY_NETADD_MVISION
        where
          urutan in(4, 5)
          and trunc(tgl_report) in(trunc(sysdate -1), trunc(sysdate -2))
        group by
          tgl_report
      ) "source"
  