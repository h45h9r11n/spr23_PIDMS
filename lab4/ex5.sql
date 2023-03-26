INSERT INTO subschema_lab4_u2.countries VALUES
    (201, 'Spanish'), 
    (202, 'Germany'), 
    (203, 'Argentina'), 
    (204, 'Dutch'), 
    (205, 'England'), 
    (206, 'Gabon');
    
CREATE TABLE subschema_lab4_u1.dictionary(
    long_name varchar(50),
    short_name varchar(5));

INSERT INTO subschema_lab4_u1.dictionary VALUES
    ('Spanish', 'SPA'),
    ('Germany', 'GER'),
    ('Argentina', 'ARG'),
    ('Dutch', 'DUT'),
    ('England', 'ENG'),
    ('Gabon', 'GAR');

CREATE VIEW u1u2 AS
    SELECT short_name, country_id
    FROM subschema_lab4_u1.dictionary short_name, subschema_lab4_u2.countries country_id
    WHERE country_name = long_name;
 
SELECT * FROM u1u2;
