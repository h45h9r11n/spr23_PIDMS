-- 5.	Написать процедуру выводящую сумму первого, последнего и значений записей в таблице, находящихся в позициях золотого сечения.

CREATE  OR REPLACE FUNCTION ex5_golden_ratio() RETURNS REAL AS
$$ 
DECLARE
    first int;
    last int; 
BEGIN
    first = (SELECT team_id FROM N33481_13_schema_lab3.teams ORDER BY team_id asc LIMIT 1);
    last = (SELECT team_id FROM N33481_13_schema_lab3.teams ORDER BY team_id desc LIMIT 1);
    RETURN (SELECT SUM (team_scores) FROM N33481_13_schema_lab3.teams
        WHERE team_id = first 
            OR team_id = last 
            OR ((SQRT(5*team_id*team_id+4)-CAST(SQRT(5*team_id*team_id+4) as integer) = 0
            OR SQRT(5*team_id*team_id-4)-CAST(SQRT(5*team_id*team_id-4) as integer) = 0)) AND team_id > 5);
END;
$$
LANGUAGE plpgsql;


