CREATE SCHEMA N33481_13_schema_lab4;

CREATE TABLE N33481_13_schema_lab4.teams (
    team_id int primary key,
    team_name varchar (50) not null,
    team_scores int
);

CREATE TABLE N33481_13_schema_lab4.players (
    player_id int primary key,
    player_name varchar(50) not null,
    team_id int,
    player_scores int
);

INSERT INTO N33481_13_schema_lab4.teams VALUES 
    (1, 'Arsenal', 0), 
    (2, 'Chelsea', 0), 
    (3, 'Manchester United', 0), 
    (4, 'Manchester City', 0), 
    (5, 'Liverpool', 0);

INSERT INTO N33481_13_schema_lab4.players VALUES
    (3001, 'Pierre-Emerick Aubameyang', 1, 0),
    (3002, 'Granit Xhaka', 1, 0),
    (3003, 'Bukayo Saka', 1, 0),
    (3004, 'Kieran Tierney', 1, 1),
    (3005, 'Matthew Smith', 1, 0),
    (3006, 'Tammy Bakumo-Abraham', 2, 3),
    (3007, 'Mason Mount', 2, 0),
    (3008, 'Marcos Alonso', 2, 0),
    (3009, 'Fikayo Tomori', 2, 0),
    (3010, 'Callum Hudson-Odoi', 2, 0),
    (3011, 'Virgil van Dijk', 5, 0),
    (3012, 'Trent Alexander-Arnold', 5, 2),
    (3013, 'Jordan Henderson', 5, 0),
    (3014, 'James Milner', 5, 0),
    (3015, 'Adam Lallana', 5, 0),
    (3016, 'Kevin De Bruyne', 4, 4),
    (3017, 'David Silva', 4, 0),
    (3018, 'Phil Foden', 4, 1),
    (3019, 'Kyle Walker', 4, 1),
    (3020, 'John Stones', 4, 0),
    (3021, 'Marcus Rashford', 3, 2),
    (3022, 'Harry Maguire', 3, 0),
    (3023, 'Luke Shaw', 3, 0),
    (3024, 'Marcos Rojo', 3, 0),
    (3025, 'Phil Jones', 3, 0);



