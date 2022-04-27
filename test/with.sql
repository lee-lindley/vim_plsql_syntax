WITH a as (
    select *
    from hr.employees
    where 1 = 1
)
, b as (
    select *
    from hr.departments
    where 1 = 1
) select * 
from dual
;
WITH a as (
    select *
    from hr.employees
    where 1 = 1
-- notice it is all one big fold block with parens on same line
) , b as (
    select *
    from hr.departments
    where 1 = 1
) select * 
from dual
;
SELECT * FROM 
    ( SELECT
        x, y, z
      FROM mytable
    ) a, 
    ( SELECT
        x, y, z
      FROM mytable
    ) b
