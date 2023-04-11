CREATE TABLE creds (
   id integer,
    username varchar(255),
    password varchar(255)
);

CREATE TABLE info (
      username varchar(255),
      city varchar(255)
);

INSERT INTO creds VALUES (1, 'hanh', '1234');
INSERT INTO creds VALUES (2, 'hanh1', '2234');
INSERT INTO creds VALUES (3, 'hanh2', '3234');

INSERT INTO info VALUES ('hanh', 'hanoi');
INSERT INTO info VALUES ('hanh1', 'haiduong');
INSERT INTO info VALUES ('hanh2', 'tphcm');

select id from creds
union 
select count(column_name) from information_schema.columns where table_name='info';

select column_name, data_type from information_schema.columns where table_name = 'creds';
