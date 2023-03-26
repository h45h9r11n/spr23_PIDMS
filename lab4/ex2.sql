CREATE USER user4 WITH PASSWORD 'jw8s0F4';
SET ROLE user3;
GRANT USAGE ON SCHEMA N33481_13_schema_lab4 TO user3;
GRANT DELETE on N33481_13_schema_lab4.players TO user4;
\dp N33481_13_schema_lab4.players
