GRANT ALL PRIVILEGES ON N33481_13_schema_lab4.players TO user1;
ALTER TABLE N33481_13_schema_lab4.players ENABLE ROW LEVEL SECURITY;
CREATE POLICY not_show_first3 ON N33481_13_schema_lab4.players FOR SELECT TO user1 USING (player_id > 3003);
SET ROLE user1;
SELECT * FROM N33481_13_schema_lab4.players;
