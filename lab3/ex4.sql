-- -- 4.	Написать триггер, который при вставке в таблицу, производил подмену вставляемого значения в соответствии с уже существующим словарем.

CREATE OR REPLACE FUNCTION ex4_change_data_func() RETURNS TRIGGER AS
$$ 
BEGIN   
    NEW.team_name = (SELECT long_name FROM N33481_13_schema_lab3.dictionary WHERE N33481_13_schema_lab3.dictionary.short_name = NEW.team_name);
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER ex4_change_data_trigger
    BEFORE INSERT ON N33481_13_schema_lab3.teams
    FOR EACH ROW
    EXECUTE PROCEDURE ex4_change_data_func();
