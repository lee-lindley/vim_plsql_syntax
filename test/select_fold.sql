$if $$have_hr_schema_select $then
    FUNCTION test0 RETURN BLOB
    IS
        v_src       SYS_REFCURSOR;
        v_blob      BLOB;
        v_widths    PdfGen.t_col_widths;
        v_headers   PdfGen.t_col_headers;
        v_formats   PdfGen.t_col_headers;
        FUNCTION get_src RETURN SYS_REFCURSOR IS
            l_src SYS_REFCURSOR;
        BEGIN
          OPEN l_src FOR
            WITH a AS (
                SELECT e.employee_id, e.last_name, e.first_name, d.department_name
                    ,SUM(salary) AS salary      -- emulate sqplus COMPUTE SUM
                FROM hr.employees e
                INNER JOIN hr.departments d
                    ON d.department_id = e.department_id
                GROUP BY GROUPING SETS (
                                                -- seemingly useless SUM on single record, 
                                                -- but required to get detail records
                                                -- in same query as the subtotal and total aggregates
                    (e.employee_id, e.last_name, e.first_name, d.department_name)
                    ,(d.department_name)        -- sqlplus COMPUTE SUM of salary ON department_name
                    ,()                         -- sqlplus COMPUTE SUM of salary ON report - the grand total
                )
            ) 
            SELECT employee_id
                /* NULL last_name indicates an aggregate result.
                   NULL department_name indicates it was the grand total
                   Similar to the LABEL on COMPUTE SUM*/
                ,NVL(last_name, CASE WHEN department_name IS NULL
                                    THEN LPAD('GRAND TOTAL:',25)
                                    ELSE LPAD('DEPT TOTAL:',25)
                                END
                ) AS last_name
                ,(
                    select 
                        sysdate 
                    from 
                    dual
                ) as sd
                ,first_name ,department_name ,salary
            FROM a
            ORDER BY department_name NULLS LAST -- to get the aggregates after detail
                ,a.last_name NULLS LAST         -- notice based on FROM column value, not the one we munged in resultset
                ,first_name
            ;
          RETURN l_src;
        END get_src;
    BEGIN
                                                    -- Similar to the sqlplus COLUMN HEADING commands
        v_headers(1) := 'Employee ID';
        v_widths(1)  := 11;
        v_headers(2) := 'Last Name';
        v_widths(2)  := 25;
        v_headers(3) := 'First Name';
        v_widths(3)  := 20;
                                                    -- will not print this column, 
                                                    -- just capture it for column page break
        v_headers(4) := NULL;                       --'Department Name'
        v_widths(4)  := 0;                          -- sqlplus COLUMN NOPRINT 
        v_headers(5) := 'Salary';
        v_widths(5)  := 16;
        -- override default number format for this column
        v_formats(5) := '$999,999,999.99';
        --
        PdfGen.init;
        PdfGen.set_page_format(
            p_format            => 'LETTER' 
            ,p_orientation      => 'PORTRAIT'
            ,p_top_margin       => 1
            ,p_bottom_margin    => 1
            ,p_left_margin      => 0.75
            ,p_right_margin     => 0.75
        );
        PdfGen.set_footer;                          -- 'Page #PAGE_NR# of "PAGE_COUNT#' is the default
                                                    -- sqlplus TITLE command
        PdfGen.set_header(
            p_txt               => 'Employee Salary Report'
            ,p_font_family      => 'helvetica'
            ,p_style            => 'b'
            ,p_fontsize_pt      => 16
            ,p_centered         => TRUE
            ,p_txt_2            => 'Department: !PAGE_VAL#'
            ,p_fontsize_pt_2    => 12
            ,p_centered_2       => FALSE            -- left align
        );
        --
        as_pdf3.set_font('courier', 'n', 10);
        v_src := get_src;                           -- open the query cursor
        PdfGen.refcursor2table(
            p_src                       => v_src
            ,p_widths                   => v_widths
            ,p_headers                  => v_headers
            ,p_formats                  => v_formats
            ,p_bold_headers             => TRUE     -- also light gray background on headers
            ,p_char_widths_conversion   => TRUE
            ,p_break_col                => 4        -- sqlplus BREAK ON column
            ,p_grid_lines               => FALSE
        );
        v_blob := PdfGen.get_pdf;
        BEGIN
            CLOSE v_src;                            -- likely redundant, but paranoid is good
        EXCEPTION WHEN invalid_cursor THEN NULL;
        END;
        -- can insert into a table or add to a zip archive blob or attach to an email
        RETURN v_blob;                              
    END test0;
$end

