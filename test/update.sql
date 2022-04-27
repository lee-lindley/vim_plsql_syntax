
UPDATE my_table
SET abc = xyz
    def = (SELECT sysdate FROM dual WHERE 1=1)
    ghi = 'where;'
;

UPDATE my_table t
SET abc = xyz
    def = (SELECT sysdate FROM dual WHERE 1=1)
    ghi = 'where;'
WHERE 1 = 2
;

MERGE INTO my_table t
USING (
    SELECT
        sysdate as xyz
    FROM dual
    WHERE 1 = 2
) q
ON (t.xyz = q.xyz)
WHEN MATCHED THEN UPDATE SET
    def = (SELECT sysdate FROM dual WHERE 1=1)
    ghi = ' 
where
;
    '
;

MERGE INTO my_table t
USING (
    SELECT
        sysdate as xyz
    FROM dual
    WHERE 1 = 2
) q
ON (t.xyz = q.xyz)
WHEN MATCHED THEN UPDATE SET
    def = (SELECT sysdate FROM dual WHERE 1=1)
    ghi = 
        'where;'
WHERE 1 = 2
;

MERGE INTO my_table t
USING (
    SELECT
        sysdate as xyz
        ,'abc' as abc
        ,'def' as def
        ,'ghi' as ghi
    FROM dual
    WHERE 1 = 2
) q
ON (t.xyz = q.xyz)
WHEN MATCHED THEN UPDATE SET
    def = (SELECT sysdate FROM dual WHERE 1=1)
    ghi = 'where;'
WHEN NOT MATCHED THEN INSERT (
    abc, def, ghi, xyz
) VALUES (
    abc, def, ghi, xyz
)
;
