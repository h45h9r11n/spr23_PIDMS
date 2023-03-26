CREATE SCHEMA schema_lab5;
CREATE TABLE schema_lab5.account (
    hash_name varchar(255),
    hash_password varchar(255)
);

CREATE OR REPLACE FUNCTION ex1_push_data_func() RETURNS TRIGGER AS
$$ 
BEGIN   
    NEW.hash_name = digest(NEW.hash_name, 'sha1');
    NEW.hash_password = digest(NEW.hash_password, 'sha1');
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER ex1_push_data_trigger
    BEFORE INSERT ON schema_lab5.account
    FOR EACH ROW
    EXECUTE PROCEDURE ex1_push_data_func();

INSERT INTO schema_lab5.account VALUES ('hanh', 1234);
INSERT INTO schema_lab5.account VALUES ('hanh1', 1234);
INSERT INTO schema_lab5.account VALUES ('hanh2', 1234);
INSERT INTO schema_lab5.account VALUES ('hanh3', 1234);
SELECT * FROM schema_lab5.account;

SELECT (schema_lab5.account.hash_name = text(digest('hanh', 'sha1')) AND schema_lab5.account.hash_password = text(digest('1234', 'sha1'))) AS match FROM schema_lab5.account;

SELECT (schema_lab5.account.hash_name = text(digest('hanh', 'sha1')) AND schema_lab5.account.hash_password = text(digest('12345', 'sha1'))) AS match FROM schema_lab5.account;