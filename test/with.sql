with a as (
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
