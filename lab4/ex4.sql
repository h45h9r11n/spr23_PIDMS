CREATE SCHEMA subschema_lab4_u1 authorization user1;
CREATE TABLE subschema_lab4_u1.matches (
    match_id int primary key,
    match_date date,
    home_team_id int,
    away_team_id int
);
CREATE SCHEMA subschema_lab4_u2 authorization user2;
CREATE TABLE subschema_lab4_u2.countries (
    country_id int primary key,
    country_name varchar (50) not null
);
\dn
