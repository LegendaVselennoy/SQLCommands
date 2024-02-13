create database cookbook;

use cookbook;

create table limbs(thing varchar(20),legs int, arms int);

insert into limbs(thing,legs,arms) values ('human',2,2);

insert into limbs(thing,legs,arms) values ('insect',6,0);

INSERT INTO limbs (thing,legs,arms) VALUES('squid',0,10);
INSERT INTO limbs (thing,legs,arms) VALUES('octopus',0,8);
INSERT INTO limbs (thing,legs,arms) VALUES('fish',0,0);
INSERT INTO limbs (thing,legs,arms) VALUES('centipede',100,0);
INSERT INTO limbs (thing,legs,arms) VALUES('table',4,0);
INSERT INTO limbs (thing,legs,arms) VALUES('armchair',4,2);
INSERT INTO limbs (thing,legs,arms) VALUES('phonograph',0,1);
INSERT INTO limbs (thing,legs,arms) VALUES('tripod',3,0);
INSERT INTO limbs (thing,legs,arms) VALUES('Peg Leg Pete',1,2);
INSERT INTO limbs (thing,legs,arms) VALUES('space alien',NULL,NULL);

select * from limbs;

select now();

SELECT DATABASE();

SELECT @id := cust_id FROM customers WHERE cust_id='customer name'; -- присваивание переменной

set @sum=5+2;
select @sum;

select count(*) from limbs;

show full columns from limbs;

show full columns from limbs;

select version(),database();

create table mail
(
   t datetime,
   scuser char(8),
   scrhost char(20),
   dstuser char(8),
   dsthost char(20),
   size bigint,
   INDEX (t)
);

select * from mail;

select size from mail;


drop table mail;


INSERT INTO mail (t,scuser,scrhost,dstuser,dsthost,size) VALUES( '2001-05-11 10:15:08','barb','saturn','tricia','mars', 58274);
INSERT INTO mail (t,scuser,scrhost,dstuser,dsthost,size) VALUES( '2001-05-12 12:48:13','tricia','mars','gene','venus', 194925);
INSERT INTO mail (t,scuser,scrhost,dstuser,dsthost,size) VALUES( '2001-05-12 15:02:49','phil','mars','phil','saturn', 1048);
INSERT INTO mail (t,scuser,scrhost,dstuser,dsthost,size) VALUES( '2001-05-13 13:59:18','barb','saturn','tricia','venus', 271);
INSERT INTO mail (t,scuser,scrhost,dstuser,dsthost,size) VALUES( '2001-05-14 09:31:37','gene','venus','barb','mars', 2291);
INSERT INTO mail (t,scuser,scrhost,dstuser,dsthost,size) VALUES( '2001-05-14 11:52:17','phil','mars','tricia','venus', 5781);
INSERT INTO mail (t,scuser,scrhost,dstuser,dsthost,size) VALUES( '2001-05-14 14:42:21','barb','venus','barb','mars', 98151);
INSERT INTO mail (t,scuser,scrhost,dstuser,dsthost,size) VALUES( '2001-05-14 17:03:01','tricia','saturn','phil','venus', 2394482);
INSERT INTO mail (t,scuser,scrhost,dstuser,dsthost,size) VALUES( '2001-05-15 07:17:48','gene','mars','gene','saturn', 3824);
INSERT INTO mail (t,scuser,scrhost,dstuser,dsthost,size) VALUES( '2001-05-15 08:50:57','phil','venus','phil','venus', 978);
INSERT INTO mail (t,scuser,scrhost,dstuser,dsthost,size) VALUES( '2001-05-15 10:25:52','gene','mars','tricia','saturn', 998532);
INSERT INTO mail (t,scuser,scrhost,dstuser,dsthost,size) VALUES( '2001-05-15 17:35:31','gene','saturn','gene','mars', 3856);
INSERT INTO mail (t,scuser,scrhost,dstuser,dsthost,size) VALUES( '2001-05-16 09:00:28','gene','venus','barb','mars', 613);
INSERT INTO mail (t,scuser,scrhost,dstuser,dsthost,size) VALUES( '2001-05-16 23:04:19','phil','venus','barb','venus', 10294);
INSERT INTO mail (t,scuser,scrhost,dstuser,dsthost,size) VALUES( '2001-05-17 12:49:23','phil','mars','tricia','saturn', 873);
INSERT INTO mail (t,scuser,scrhost,dstuser,dsthost,size) VALUES( '2001-05-19 22:21:51','gene','saturn','gene','venus', 23992);

delete from mail;

select concat(MONTHNAME(t),' ',DAYOFMONTH(t),', ',YEAR(t)),
scuser,size from mail; -- не следует писать такой запрос

select date_format(t,'%M %e,%Y') as date_sent, scuser,size from mail;

select t,scuser,scrhost from mail where scrhost='venus';

select t,scuser,dstuser from mail where scuser in ('gene','barb','phil');

SELECT * FROM mail WHERE scuser = 'barb' AND dstuser = 'tricia';

SELECT * FROM mail WHERE scuser != dstuser;

SELECT * FROM mail WHERE NOT (scuser = dstuser AND scrhost = dsthost); -- групповое отрицание

select distinct scuser from mail;

SELECT DISTINCT YEAR(t), MONTH(t), DAYOFMONTH(t) FROM mail;

SELECT COUNT(DISTINCT scuser) FROM mail;

SELECT * FROM taxpayer WHERE id IS NOT NULL;

SELECT * FROM taxpayer WHERE id >= '200-00' OR id IS NULL;

SELECT name, IF(id IS NULL,'Unknown', id) AS 'id' FROM taxpayer;

SELECT name, IFNULL(id,'Unknown') AS 'id' FROM taxpayer; -- сокращение запроса

select * from mail where size>100000 order by size; -- сортировка

SELECT * FROM mail WHERE size > 50000 ORDER BY size DESC;

SELECT * FROM mail LIMIT 1;

SELECT * FROM mail ORDER BY size desc;

SELECT * FROM mail ORDER BY size desc  LIMIT 2,1;

 SELECT COUNT(*) FROM mail;
 
 SELECT SQL_CALC_FOUND_ROWS * FROM mail ORDER BY size LIMIT 4;
 SELECT FOUND_ROWS();
 
 INSERT INTO dst_tbl (i, s) SELECT val, name FROM src_tbl;
 
 INSERT INTO dst_tbl SELECT * FROM src_tbl; -- копирование
 
 create table dst_tbl select * from mail where 0;
 
 create table dst_tbl select c,a,b from src_tbl;
 
 select * from dst_tbl;
 
 create table dst_tbl
 (
   id int not null auto_increment,
   primary key(id)
 );

drop table dst_tbl;

create temporary table mail1 select * from mail; -- создание временной таблицы

select count(*) from mail1;

drop table mail1;

show create table mail;

-- DROP TABLE IF EXISTS имя_таблицы

create table metal
(
 name varchar(20)
);

insert into metal (name) value ('copper');
insert into metal (name) value ('gold');
insert into metal (name) value ('iron');
insert into metal (name) value ('lead');
insert into metal (name) value ('mercury');
insert into metal (name) value ('platinum');
insert into metal (name) value ('silver');
insert into metal (name) value ('tin');


select * from metal;

select name, left(name,2),mid(name,3,1),right(name,3) from metal;

select name, substring(name,4),mid(name,4) from metal;

select name, substring_index(name,'r',2), substring_index(name,'i',-1) from metal; -- цифры для вхождения, -1 означает с другой стороны

SELECT CONCAT('Привет, ',USER(),', добро пожаловать в MySQL!') AS greeting;

select concat(name, ' ends in "d": ',if(right(name,1)='d','YES','NO'))
as 'ends in "d"?' from metal;

UPDATE metal SET name = CONCAT(name,'ide');
UPDATE metal SET name = LEFT(name,LENGTH(name)-3);

SELECT name, LOCATE('in',name), LOCATE('in',name,3) FROM metal; -- возвращаемое значение - это позиция

select name from metal where name like 'co%';

select name from metal where name like '%er';

SELECT name FROM metal WHERE name LIKE '%er%';

SELECT name FROM metal WHERE name LIKE '__pp%';

SELECT name FROM metal WHERE name NOT LIKE '%i%';

SELECT NULL LIKE '%', NULL NOT LIKE '%';

select name from metal where name regexp '^co'; -- Строки, начинающиеся с определенной подстроки

SELECT name FROM metal WHERE name REGEXP 'er$'; -- Строки, завершающиеся определенной подстрокой

SELECT name FROM metal WHERE name REGEXP 'er'; -- Строки, содержащие определенную подстроку

SELECT name FROM metal WHERE name REGEXP '^..pp'; -- Строки, содержащие определенную подстроку, начинающуюся с указанной позиции

SELECT name FROM metal WHERE name REGEXP '^[aeiou]|er$'; -- начинаются с гласной ИЛИ заканчиваются на er

SELECT '0m' REGEXP '^([[:digit:]]+|[[:alpha:]]+)$';

 SELECT name, name = BINARY 'lead', BINARY name = 'LEAD' FROM metal;
 
 SELECT STRCMP(binary 'Abc','abc'), STRCMP(binary 'abc','abc'), STRCMP(binary 'abc','Abc');
 
 CREATE TABLE news
(
 id INT UNSIGNED NOT NULL AUTO_INCREMENT,
 article BLOB NOT NULL,
 PRIMARY KEY (id)
);

-- SET SQL_SAFE_UPDATES = 0;

-- SET SQL_SAFE_UPDATES = 1;

ALTER TABLE news MODIFY article TEXT NOT NULL;

ALTER TABLE news CHANGE article article TEXT NOT NULL; -- Для ранней версии


alter table metal add binname varchar(20) binary;
UPDATE metal SET binname = name;

alter table metal drop column binname;

SELECT t, DATE_FORMAT(t,'%M %d, %Y') as date FROM mail;

 SELECT t,DATE_FORMAT(t,'%c/%e/%y %r') AS format1,DATE_FORMAT(t,'%M %e, %Y %T') AS format2 FROM mail;
 
SELECT t, DATE_FORMAT(t,'%d-%m-%Y') AS 'date part', TIME_FORMAT(t,'%T') AS 'time part' FROM mail;
  
SELECT t,YEAR(t), DAYOFMONTH(t),HOUR(t), SECOND(t) FROM mail;

SELECT CURDATE(), YEAR(CURDATE()) AS year,MONTH(CURDATE()) AS month, MONTHNAME(CURDATE()) AS monthname,
DAYOFMONTH(CURDATE()) AS day, DAYNAME(CURDATE()) AS dayname;

SELECT NOW(), HOUR(NOW()) AS hour, MINUTE(NOW()) AS minute, SECOND(NOW()) AS second;

SELECT t, TIME_FORMAT(t,'%H:%i:00') FROM mail;

SET @d = '2002-02-28';
SET @t = '13:10:05';
SELECT @d, @t, CONCAT(@d,' ',@t);

SELECT CURDATE(), DATE_ADD(CURDATE(),INTERVAL 3 DAY);
SELECT CURDATE(), DATE_SUB(CURDATE(),INTERVAL 7 DAY);
SELECT NOW(), DATE_ADD(NOW(),INTERVAL 60 HOUR);
SELECT NOW(), DATE_ADD(NOW(),INTERVAL '3 4' DAY_HOUR);
SELECT TO_DAYS('1884-01-01') - TO_DAYS('1883-06-05') AS days;
SELECT t, CONCAT(YEAR(t),'-',LPAD(MONTH(t),2,'0'),'-01') FROM mail; -- LPAD() для обеспечения двузначности значений месяца

SET @birth = '1965-03-01';
SET @target = '1975-01-01';

SELECT @birth, @target,YEAR(@target)-YEAR(@birth) AS 'difference',
IF(RIGHT(@target,5) < RIGHT(@birth,5),1,0) AS 'adjustment', YEAR(@target)-YEAR(@birth)-IF(RIGHT(@target,5) < RIGHT(@birth,5),1,0)
as age;

select * from mail order by size;

SELECT size, dstuser FROM mail WHERE dstuser = 'phil' order by size;

SELECT val FROM t ORDER BY IF(val IS NULL,1,0), val DESC;
SELECT val FROM t ORDER BY IF(val IS NULL,1,0), val;

SELECT date, description FROM event ORDER BY MONTH(date), DAYOFMONTH(date);

SELECT * FROM mail ORDER BY HOUR(t), MINUTE(t), SECOND(t);
SELECT COUNT(*) FROM driver_log WHERE miles > 200;

SELECT MIN(t) AS earliest, MAX(t) AS latest, MIN(size) AS smallest, MAX(size) AS largest FROM mail;
 
SELECT SUM(size) AS 'total traffic', AVG(size) AS 'average message size' FROM mail;

SELECT DISTINCT srcuser, dstuser FROM mail ORDER BY srcuser, dstuser;

SELECT scuser, COUNT(scuser) FROM mail GROUP BY scuser;

SELECT scuser, scrhost, COUNT(*) FROM mail GROUP BY scuser, scrhost;

SELECT COUNT(*), scuser FROM mail GROUP BY scuser HAVING COUNT(*) > 3;

SELECT scuser, dstuser FROM mail GROUP BY scuser, dstuser HAVING COUNT(*) = 1;

SELECT COUNT(DISTINCT t) / COUNT(t) FROM mail;

select * from mytbl;

create table mytbl
(
   i int,
   c char(1)
);

SHOW COLUMNS FROM mytbl;
SHOW CREATE TABLE mytbl;

alter table mytbl drop i;

alter table mytbl add i int;
alter table mytbl add i int first; -- либо 
ALTER TABLE mytbl ADD i INT AFTER c; -- так

alter table mytbl modify c char(10);
alter table mytbl change i j bigint; -- позволяет изменить и имя столбца, а не только его определение

ALTER TABLE mytbl MODIFY j INT NOT NULL DEFAULT 100;

ALTER TABLE mytbl ALTER j SET DEFAULT 1000;
ALTER TABLE mytbl ALTER j DROP DEFAULT;

SHOW TABLE STATUS;

SHOW TABLE STATUS like 'mytbl';

-- ALTER TABLE старое_имя RENAME TO новое_имя;

drop table mytbl;
show index from mytbl;

alter table mytbl add index(c);
alter table mytbl add index(c,i);

alter table mytbl modify i int not null;
alter table mytbl add primary key(i);

ALTER TABLE mytbl DROP PRIMARY KEY;
ALTER TABLE mytbl DROP INDEX c, DROP INDEX c_2;

INSERT INTO mytbl (i,c) VALUES(1,'a'),(1,'a'),(1,NULL),(1,NULL),(2,'a'),(2,'a'),(2,'b'),(2,'b');

select * from mytbl;

-- alter ignore table mytbl add unique(i,c);

CREATE TABLE client_billing
(
 id INT UNSIGNED NOT NULL, # идентификационный номер клиента
 name CHAR(20) NOT NULL, # имя клиента
 address CHAR(20) NOT NULL, # адрес клиента
 date DATE NOT NULL, # дата предоставления услуги
 minutes INT NOT NULL, # количество оплачиваемых минут
 description CHAR(60) NOT NULL # предоставленная услуга
);

insert into client_billing(id,name,address,date,minutes,description)
     values 
     (21, 'John', '46 North Ave.','2001-07-15', 48, 'consult by phone'),
	 (43, 'Toby', '123 Elm St.','2001-07-13', 12, 'office visit'),
     (21, 'John', '46 North Ave.','2001-07-15', 48, 'consult by phone'),
     (21, 'John', '46 North Ave.','2001-07-19', 120, 'court appearance'),
     (43, 'Toby', '123 Elm St.','2001-07-13', 12, 'office visit'),
     (43, 'Toby', '123 Elm St.','2001-07-14', 60, 'draft proposal'),
     (43, 'Toby', '123 Elm St.','2001-07-16', 180, 'present proposal');
     
select * from client_billing; 
      
CREATE TABLE client_info
(
 id INT UNSIGNED NOT NULL, # идентификатор клиента
 name CHAR(20) NOT NULL, # имя клиента
 address CHAR(20) NOT NULL # адрес клиента
);

select * from client_info; 

CREATE TABLE bill_item
(
 id INT UNSIGNED NOT NULL, # идентификатор клиента
 date DATE NOT NULL, # дата предоставления услуги
 minutes INT NOT NULL, # количество оплачиваемых минут
 description CHAR(60) NOT NULL # описание предоставленной услуги
);

select * from bill_item; 

insert into client_info(id,name,address) 
select id,name,address from client_billing;

insert into bill_item(id,date,minutes,description)
select id,date,minutes,description FROM client_billing;

-- ALTER TABLE client_info  ADD PRIMARY KEY (id);
ALTER TABLE bill_item ADD INDEX (id, date);

SHOW VARIABLES;

SHOW DATABASES;
SHOW TABLES;
SELECT VERSION();

LOAD DATA LOCAL INFILE 'mytbl.txt' INTO TABLE mytbl; -- читает файл и сохраняет данные в таблице

SELECT USER();
SHOW STATUS;
SHOW VARIABLES;

LOAD DATA INFILE 'cookbook/mytbl.txt' INTO TABLE mytbl;
-- LOAD DATA LOCAL 'mytbl.txt' INTO TABLE other_db.mytbl;

LOAD DATA LOCAL INFILE 'mytbl.txt' INTO TABLE mytbl FIELDS TERMINATED BY ':'LINES TERMINATED BY '\r';

LOAD DATA LOCAL INFILE 'data.txt' REPLACE INTO TABLE weatherdata;
LOAD DATA LOCAL INFILE 'mytbl.txt' INTO TABLE mytbl IGNORE 1 LINES;
LOAD DATA LOCAL INFILE 'mytbl.txt' INTO TABLE mytbl (b, c, a);

SELECT * FROM passwd INTO OUTFILE '/tmp/passwd.txt'; -- вывод результата запроса в фйал

SELECT * FROM passwd INTO OUTFILE '/tmp/passwd.txt' FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n';

DELETE FROM insect WHERE id IN (2,8,7);

ALTER TABLE t ADD id INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (id);

create table shirt (item CHAR(20));
insert into shirt (item) values('Pinstripe'),('Tie-Dye'),('Black');

CREATE TABLE tie (item CHAR(20));
INSERT INTO tie (item) VALUES('Fleur de lis'),('Paisley'),('Polka Dot');

select item from shirt;
select item from tie;

select * from shirt,tie;

SELECT shirt.item, tie.item FROM shirt, tie
WHERE tie.item != 'Polka Dot';

SELECT shirt.item, tie.item FROM shirt,tie ORDER BY RAND() LIMIT 1;

SELECT shirt.item, tie.item FROM shirt, tie;

CREATE TABLE artist
(
 a_id INT UNSIGNED NOT NULL AUTO_INCREMENT, # идентификатор художника
 name VARCHAR(30) NOT NULL, # фамилия художника
 PRIMARY KEY (a_id),
 UNIQUE (name)
);

CREATE TABLE painting
(
 a_id INT UNSIGNED NOT NULL, # идентификатор художника
 p_id INT UNSIGNED NOT NULL AUTO_INCREMENT, # идентификатор картины
 title VARCHAR(100) NOT NULL, # название картины
 state VARCHAR(2) NOT NULL, # штат покупки
 price INT UNSIGNED, # цена покупки (доллары)
 INDEX (a_id),
 PRIMARY KEY (p_id)
);

select * from artist;
select * from painting;
SELECT * FROM painting ORDER BY a_id, p_id;
SELECT * FROM artist, painting; 
SELECT * FROM artist, painting WHERE artist.a_id = painting.a_id;

SELECT artist.name, painting.title, painting.state, painting.price FROM artist, painting
WHERE artist.a_id = painting.a_id;

SELECT DISTINCT artist.name FROM artist, painting
WHERE painting.state IN ('KY','IN') AND artist.a_id = painting.a_id;

SELECT artist.name, 
COUNT(*) AS 'number of paintings',
SUM(painting.price) AS 'total price',
AVG(painting.price) AS 'average price'
FROM artist, painting WHERE artist.a_id = painting.a_id
GROUP BY artist.name;

select * from artist order by a_id;

select * from artist left join painting on artist.a_id=painting.a_id;

select * from artist right join painting on artist.a_id=painting.a_id;

SELECT * FROM artist LEFT JOIN painting
ON artist.a_id = painting.a_id
WHERE painting.a_id IS NULL;

SELECT fname, lname, addr FROM prospect --  просто union удаляет дубликаты
UNION ALL
SELECT first_name, last_name, address FROM customer
UNION
SELECT company, '', street FROM vendor;

SHOW VARIABLES LIKE 'have_bdb';
SHOW VARIABLES LIKE 'have_innodb';

create table t(i int);

begin;

insert into t(i) values(1);
insert into t(i) values(2);

commit;

select * from t;

drop table t;

create table t(i int);
begin;
insert into t(i) values(1);
insert into t(x) values(2);
rollback;
select * from t;

LOCK TABLE money WRITE;
UPDATE money SET amt = amt - 6 WHERE name = 'Eve';
UPDATE money SET amt = amt + 6 WHERE name = 'Ida';
UNLOCK TABLE;

INSERT INTO mytbl (image_data) VALUES(LOAD_FILE('/tmp/myimage.png'));

CREATE TABLE image
(
 id INT UNSIGNED NOT NULL AUTO_INCREMENT, # идентификатор изображения
 name VARCHAR(30) NOT NULL, # имя файла изображения
 type VARCHAR(20) NOT NULL, # MIME-тип изображения
 data MEDIUMBLOB NOT NULL, # данные изображения
 PRIMARY KEY (id), # id и name уникальны
 UNIQUE (name)
);