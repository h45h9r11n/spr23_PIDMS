CREATE OR REPLACE FUNCTION ex7_func() RETURNS TRIGGER AS
$$ 
BEGIN
    RAISE NOTICE '% was called', TG_OP;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER ex7_trigger
    AFTER INSERT or DELETE or UPDATE ON N33481_13_schema_lab4.players
    FOR EACH ROW
    EXECUTE PROCEDURE ex7_func();

INSERT INTO N33481_13_schema_lab4.players VALUES
    (3026, 'Nguyen Hong Hanh', 2, 0);

UPDATE N33481_13_schema_lab4.players SET player_scores = player_scores + 1 
    WHERE team_id = 1;

DELETE FROM N33481_13_schema_lab4.players 
    WHERE team_id = 1;