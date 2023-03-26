CREATE TABLE schema_lab5.data (
    id integer,
    hash_name bytea
);

CREATE OR REPLACE FUNCTION ex2_push_data_func() RETURNS TRIGGER AS
$$ 
BEGIN   
    NEW.hash_name = pgp_sym_encrypt_bytea(NEW.hash_name, 'secret_key');
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER ex2_push_data_trigger
    BEFORE INSERT ON schema_lab5.data
    FOR EACH ROW
    EXECUTE PROCEDURE ex2_push_data_func();

INSERT INTO schema_lab5.data VALUES (1, 'hanh');
INSERT INTO schema_lab5.data VALUES (1, 'terry');
INSERT INTO schema_lab5.data VALUES (1, 'lampard');
INSERT INTO schema_lab5.data VALUES (1, 'cech');

SELECT id, left(hash_name::text, 30) FROM schema_lab5.data;

SELECT encode(pgp_sym_decrypt_bytea(schema_lab5.data.hash_name, 'secret_key'),'escape') FROM schema_lab5.data;
