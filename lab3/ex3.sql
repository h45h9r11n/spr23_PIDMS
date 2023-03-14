-- 3.	Написать триггер, который на основании даты из вставляемой записи, вставлял ее в соответствующую таблицу.



CREATE OR REPLACE FUNCTION ex3_insert_data_func() RETURNS TRIGGER AS
$$ 
BEGIN
    IF CURRENT_DATE - '2023-02-14' > 7 
    THEN
        INSERT INTO N33481_13_schema_lab3.players_invalid_update VALUES 
            (NEW.player_id, NEW.player_name, NEW.team_id, NEW.player_scores);
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER ex3_insert_data_trigger
    BEFORE INSERT ON N33481_13_schema_lab3.players
    FOR EACH ROW
    EXECUTE PROCEDURE ex3_insert_data_func();


