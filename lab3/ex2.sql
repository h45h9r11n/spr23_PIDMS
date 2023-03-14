-- 2.	Написать триггер, который будет выполнять действие из 1 пункта автоматически при вставке записи в исходную таблицу. Таким образом, чтобы агрегированная информация всегда была актуальна.

CREATE OR REPLACE FUNCTION ex2_update_data_func() RETURNS TRIGGER AS
$$ 
DECLARE
    sum_score int; 
    id_get_update int;
BEGIN
    id_get_update = NEW.team_id;
    sum_score = (SELECT SUM(player_scores)) FROM N33481_13_schema_lab3.players WHERE N33481_13_schema_lab3.players.team_id = id_get_update;
    UPDATE N33481_13_schema_lab3.teams SET team_scores = sum_score WHERE team_id = id_get_update;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER ex2_update_data_trigger
    AFTER INSERT or DELETE or UPDATE ON N33481_13_schema_lab3.players
    FOR EACH ROW
    EXECUTE PROCEDURE ex2_update_data_func();


