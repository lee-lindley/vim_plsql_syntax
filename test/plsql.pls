().,;
SELECT e.first_name AS "First Name", e.last_name AS "Last Name"
    , d.department_name AS "Department 
Name"
    , 'a string with embedded quote ('')' as regq, q'{a string with embedded quote (')}' as qquote
    , 'a string ending in a quote ''' as "regq_end_quote XXX", 'xxx' AS XXX
    , 123 AS "integer val" , .7 as "trailing dec", 123. as "really an int but classified float"
    , 123.456 as "float" , 1.27E-2 as "exp not"
    -- leading sign is classified as an operator. That works from a logical perspective (unary operator).
    , -123 AS "n integer val" , -.7 as "n trailing dec", -123. as "n really an int but classified float"
    , -123.456 as "n float" , -1.27E+2 as "n exp not"
    , +123 AS "p integer val" , +.7 as "p trailing dec", +123. as "p really an int but classified float"
    , +123.456 as "p float" , +1.27E2 as "p exp not"
-- TODO XXX DEBUG NOTE FIXME 
FROM hr.employees e
JOIN hr.departments d
    ON e.department_id = d.department_id
WHERE e.first_name = 'Bruce' AND e.last_name = 'Lee'
ORDER BY d.department_name;
MERGE INTO xyz t
USING (
    SELECT abc FROM zala WHERE 1=1 and TO_DATE('12/31/2021','mm/dd/yyyy') < SYSDATE
) q
ON (t.abc = q.abc)
WHEN MATCHED THEN UPDATE SET def = q.abc
WHEN NOT MATCHED THEN INSERT(abc, def) VALUES(q.abc, q.abc);
UPDATE xyz SET def = abc WHERE 1=2;
DELETE FROM xyz WHERE abc = def;

CREATE OR 
 REPLACE 
  PACKAGE 
   sample_pkg
    PROCEDURE transform_perl_regexp(p_re VARCHAR2)
    RETURN VARCHAR2
    DETERMINISTIC
    ;
END sample_pkg;
/
CREATE OR REPLACE PACKAGE BODY sample_pkg
    FUNCTION transform_perl_regexp(p_re VARCHAR2)
    RETURN VARCHAR2 DETERMINISTIC IS
        /*
            strip comment blocks that start with at least one blank, then
            '--' or '#', then everything to end of line or string
 ===> shows /* does not start a new comment
        */
 -- quoted string with embedded newline
        c_strip_comments_regexp CONSTANT VARCHAR2(32767) := q'+[[:blank:]](--|#).*($|
)+';
$IF $$is_dummy_needed $then
        c_dummy                 CONSTANT VARCHAR2(30) := 'newline>
<anotherline';
        v_rec hr.employees%ROWTYPE;
        v_dummy2 hr.employees.employee_id%type;
$End
    BEGIN
      IF TRUE THEN
    -- note that \n, \r and \t will be replaced if not preceded by a \
    -- \\n and \\t will not be replaced. Unfortunately, neither will \\\n or \\\t.
    -- If you need \\\n, use \\ \n since the space will be removed.
    -- We are not parsing into tokens, so this is as close as we can get cheaply
      RETURN
        REGEXP_REPLACE(
          REGEXP_REPLACE(
            REGEXP_REPLACE(
              REGEXP_REPLACE(
                REGEXP_REPLACE(p_re, c_strip_comments_regexp, NULL, 1, 0, 'm') -- strip comments
                , '\s+', NULL, 1, 0                 -- strip spaces and newlines too like 'x' modifier
              )
              , q'[(^|[^\\])\\t]', '\1'||CHR(9), 1, 0    -- replace \t with tab character value so it works like in perl
            )
            , q'{(^|[^\\])\\n}', '\1'||CHR(10), 1, 0       -- replace \n with newline character value so it works like in perl
          )
          , q'((^|[^\\])\\r)', '\1'||CHR(13), 1, 0         -- replace \r with CR character value so it works like in perl
        )
      ;
      ELSE
          DBMS_OUTPUT.put_line('no way!');
      END IF;
    END transform_perl_regexp;
END  sample_pkg;
/
BEGIN
        -- dot words after parens
        v_sql := 'INSERT INTO ora$ptt_csv(
'
        ||v_cols.map('"$_"').join(', ')             -- the column names in dquotes
        ||'
) VALUES (
'
        ||v_cols.map(':$##index_val##').join(', ')  -- :1, :2, :3, etc... bind placeholders
        ||'
)';
END;
-- dot words with dquotes
SELECT X."myObject".get(), X."myObject".COUNT, X."myObject".obscureLocalMethod() 
FROM a X
;
 -- shows a comment on last line
