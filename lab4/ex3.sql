SET ROLE postgres;
REVOKE ALL ON N33481_13_schema_lab4.players from user1, user2, user3, user4 CASCADE;
\dp N33481_13_schema_lab4.players
