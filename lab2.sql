create schema N33481_13_schema_lab2;

CREATE TABLE N33481_13_schema_lab2.teams (
    team_id int primary key,
    team_name varchar (50) not null
);

CREATE TABLE N33481_13_schema_lab2.players (
    player_id int primary key,
    player_name varchar(50) not null,
    country_id int,
    team_id int,
    player_dob date);

CREATE TABLE N33481_13_schema_lab2.coaches (
    coach_id int primary key,
    coach_name varchar (50) not null,
    country_id int,
    team_id int
);

CREATE TABLE N33481_13_schema_lab2.countries (
    country_id int primary key,
    country_name varchar (50) not null
);

CREATE TABLE N33481_13_schema_lab2.matches (
    match_id int primary key,
    match_date date,
    home_team_id int,
    away_team_id int
);

-- 1.	Наполнить таблицы базы данных при помощи операторов INSERT. Каждая таблица должна иметь не менее 5 разных записей.
INSERT INTO N33481_13_schema_lab2.teams VALUES 
    (1, 'Arsenal'), 
    (2, 'Chelsea'), 
    (3, 'Manchester United'), 
    (4, 'Manchester City'), 
    (5, 'Liverpool');

INSERT INTO N33481_13_schema_lab2.players VALUES
    (3001, 'Pierre-Emerick Aubameyang', 205, 1, date'1995-5-28'),
    (3002, 'Granit Xhaka', 205, 1, date'1996-7-19'),
    (3003, 'Bukayo Saka', 206, 1, date'2000-8-14'),
    (3004, 'Kieran Tierney', 202, 1, date'2002-6-12'),
    (3005, 'Matthew Smith', 203, 1, date'2002-7-11'),
    (3006, 'Tammy Bakumo-Abraham', 205, 2, date'1993-11-8'),
    (3007, 'Mason Mount', 206, 2, date'1992-2-16'),
    (3008, 'Marcos Alonso', 204, 2, date'1999-11-10'),
    (3009, 'Fikayo Tomori', 203, 2, date'1997-10-27'),
    (3010, 'Callum Hudson-Odoi', 206, 2, date'2001-12-26'),
    (3011, 'Virgil van Dijk', 201, 5, date'2000-6-27'),
    (3012, 'Trent Alexander-Arnold', 205, 5, date'1992-4-11'),
    (3013, 'Jordan Henderson', 206, 5, date'1996-12-1'),
    (3014, 'James Milner', 203, 5, date'2001-8-7'),
    (3015, 'Adam Lallana', 202, 5, date'1998-10-22'),
    (3016, 'Kevin De Bruyne', 201, 4, date'1995-2-27'),
    (3017, 'David Silva', 206, 4, date'2000-11-5'),
    (3018, 'Phil Foden', 204, 4, date'2001-3-7'),
    (3019, 'Kyle Walker', 205, 4, date'2000-3-8'),
    (3020, 'John Stones', 204, 4, date'1993-9-14'),
    (3021, 'Marcus Rashford', 206, 3, date'1992-7-14'),
    (3022, 'Harry Maguire', 204, 3, date'2001-9-28'),
    (3023, 'Luke Shaw', 204, 3, date'2001-4-28'),
    (3024, 'Marcos Rojo', 203, 3, date'1994-3-22'),
    (3025, 'Phil Jones', 205, 3, date'2002-4-26');

INSERT INTO N33481_13_schema_lab2.coaches VALUES 
    (101, 'Mikel Arteta', 201, 1),
    (102, 'Thomas Tuchel', 202, 2),
    (103, 'Erik Ten Hag', 204, 3),
    (104, 'Pep Guardiola', 201, 4),
    (105, 'Jurgen Klopp', 202, 5);

INSERT INTO N33481_13_schema_lab2.countries VALUES
    (201, 'Spanish'), 
    (202, 'Germany'), 
    (203, 'Argentina'), 
    (204, 'Dutch'), 
    (205, 'England'), 
    (206, 'Gabon');

INSERT INTO N33481_13_schema_lab2.matches VALUES
    (401, date'2022-9-21', 2, 3),	
    (402, date'2022-11-10', 5, 2),	
    (403, date'2022-12-6', 4, 3),	
    (404, date'2022-10-9', 3, 1),	
    (405, date'2022-8-1', 1, 4);

-- 2.	Обновить записи в одной таблице на основании записи из другой (между таблицами должна быть связь).

UPDATE N33481_13_schema_lab2.players SET country_id = 206 WHERE team_id =
    (SELECT team_id FROM N33481_13_schema_lab2.teams WHERE team_name = 'Arsenal');

-- 3.	Удалить несколько записей из одной таблицы на основании информации из другой таблицы. 
DELETE FROM N33481_13_schema_lab2.players USING N33481_13_schema_lab2.countries
    WHERE N33481_13_schema_lab2.players.country_id = N33481_13_schema_lab2.countries.country_id AND N33481_13_schema_lab2.countries.country_name = 'Gabon';

-- 4.	Вывести часть столбцов из таблицы.
SELECT player_name FROM N33481_13_schema_lab2.players

-- 5.	Вывести несколько записей из таблицы, используя условие ограничения.
SELECT * FROM N33481_13_schema_lab2.players LIMIT 5

-- 6.	Сделать декартово произведение двух таблиц.
SELECT * FROM N33481_13_schema_lab2.teams CROSS JOIN N33481_13_schema_lab2.countries

-- 7.	Вывести записи из таблицы на основании условия ограничения, содержащегося в другой таблице.
SELECT * FROM N33481_13_schema_lab2.players WHERE team_id =
    (SELECT team_id FROM N33481_13_schema_lab2.teams WHERE team_name = 'Chelsea');

-- 8.	Применить функции агрегирования к выводимым записям (sum, avg, min, max)
SELECT MIN(team_id) FROM N33481_13_schema_lab2.players;
SELECT MAX(team_id) FROM N33481_13_schema_lab2.players;
SELECT SUM(team_id) FROM N33481_13_schema_lab2.players;
SELECT AVG(team_id) FROM N33481_13_schema_lab2.players;

-- 9.	Вывести записи из таблицы, используя сортировку от большего к меньшему.
SELECT * FROM N33481_13_schema_lab2.players ORDER BY team_id desc

-- 10.	Вывести записи из таблицы, используя сортировку от меньшего к большему с ограничением количества выводимых строк.
SELECT * FROM N33481_13_schema_lab2.players ORDER BY team_id asc LIMIT 2

-- 11.	Произвести агрегирование выводимых записей по одному из полей ( group by).
INSERT INTO N33481_13_schema_lab2.players VALUES
    (3028, 'Pierre-Emerick Aubameyang', 202, 1, date'1995-5-28'),
    (3027, 'Pierre-Emerick Aubameyang', 206, 2, date'1995-5-28');
    (3029, 'Marcos Rojo', 204, 3, date'1994-3-22'),
    (3030, 'Phil Jones', 206, 1, date'2002-4-26'),
    (3031, 'Marcos Rojo', 205, 2, date'1994-3-22'),
    (3032, 'Phil Jones', 204, 3, date'2002-4-26');
SELECT * FROM N33481_13_schema_lab2.players ORDER BY player_name asc;
SELECT player_name, max(country_id) AS max FROM N33481_13_schema_lab2.players GROUP BY player_name;
    
-- 12.	Выполнить запрос, когда табличное выражение представляет собой другой запрос.
SELECT * FROM (SELECT * FROM N33481_13_schema_lab2.players WHERE team_id = 2) as Chelsea_players;
SELECT * FROM (SELECT * FROM N33481_13_schema_lab2.players WHERE team_id = 2) as Chelsea_players_has_e WHERE player_name LIKE '%e%';