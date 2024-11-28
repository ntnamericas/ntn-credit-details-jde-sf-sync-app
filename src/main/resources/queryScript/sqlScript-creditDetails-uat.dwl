%dw 2.0
output text/plain
---
" SELECT
    f1.SDAEXP,
    f1.SDKCOO,
    f1.SDUNCS,
    f1.SDDGL,
    f1.SDVR01,
    f1.SDDCTO,
    f1.SDUPRC,
    f1.SDLITM,
    f1.SDDOCO,
    f1.SDLNID,
    f1.SDUORG,
    f1.SDSOQS,
    f1.SDCRCD,
    f1.SDSHAN,
    f2.IMDRAW,
    f3.AXDC,
    f4.BPUPRC,
    f5.IVCITM,
    f6.IBPRP1,
    f6.IBSRP4
FROM
    CRPDTA.F4211 f1
LEFT JOIN
    CRPDTA.F4101 f2
    ON trim(f2.IMLITM) = trim(f1.SDLITM)
FULL OUTER JOIN  CRPDTA.F4780 f3
      ON trim(f3.AXAN8) = trim(f1.SDSHAN)
      AND trim(f3.AXXRTS) = 'SF'
LEFT JOIN
    CRPDTA.F4106 f4
    ON TRIM(f4.BPAN8) = '0' 
    AND TRIM(f4.BPLITM) = trim(f1.SDLITM) 
    AND TRIM(f4.BPMCU) = '1801' 
    AND TRIM(f4.BPEFTJ) <= $(vars.jobRun.date) 
    AND TRIM(f4.BPEXDJ) >= $(vars.jobRun.date)
LEFT JOIN
    CRPDTA.F4104 f5
    ON TRIM(f5.IVXRT) = 'C'
    AND TRIM(f5.IVAN8) = trim(f1.SDAN8)
    AND TRIM(f5.IVLITM) = trim(f1.SDLITM)
    AND TRIM(f5.IVEFTJ) <= $(vars.jobRun.date)
    AND TRIM(f5.IVEXDJ) >= $(vars.jobRun.date)
LEFT JOIN
    CRPDTA.F4102 f6
       ON TRIM(f6.IBLITM) = trim(f1.SDLITM)
        AND TRIM(f6.IBMCU) = '1801'
WHERE
    trim(f1.SDUPMJ) >= $(vars.jobRun.date)
    AND trim(f1.SDTDAY) < $(vars.previousJobRun.time) AND 
 trim(f1.SDKCOO) = '00010' AND trim(f1.SDLNTY) = 'RC' AND
trim(f1.SDDCTO) = 'CR' AND
(trim(f1.SDVR01) LIKE '%CP-MCA%' or trim(f1.SDVR01) LIKE '%CP-CPA%')"