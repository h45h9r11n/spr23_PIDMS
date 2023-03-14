-- 1.	Написать процедуру, которая выполняет агрегации значений в таблице и обновляет значение в другой таблице. Таким образом, чтобы при запуске пользователем информация в таблице обновлялась и содержала агрегированные значения из другой таблицы.

CREATE  OR REPLACE FUNCTION ex1_update_data() RETURNS VOID AS
$$ 
DECLARE
    id int;
    sum_score int; 
BEGIN
    FOR id IN SELECT team_id FROM N33481_13_schema_lab3.teams
    LOOP
        sum_score = (SELECT SUM(player_scores)) FROM N33481_13_schema_lab3.players WHERE N33481_13_schema_lab3.players.team_id = id;
        UPDATE N33481_13_schema_lab3.teams SET team_scores = sum_score WHERE team_id = id;
    END LOOP;
END;
$$
LANGUAGE plpgsql;


