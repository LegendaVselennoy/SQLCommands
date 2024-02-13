use lesson_1;

create table movies
(
  id serial primary key,
  title Varchar(50) not null,
  title_eng Varchar(50),
  year_movi year not null,
  count_min int,
  storyline text
);

INSERT INTO movies(title, title_eng, year_movie, count_min, storyline)
VALUES
('Игры разума', 'A Beautiful Mind', 2001, 135, 'От всемирной известности до греховных глубин — все это познал на своей шкуре Джон Форбс Нэш-младший. Математический гений, он на заре своей карьеры сделал титаническую работу в области теории игр, которая перевернула этот раздел математики и практически принесла ему международную известность. Однако буквально в то же время заносчивый и пользующийся успехом у женщин Нэш получает удар судьбы, который переворачивает уже его собственную жизнь.'),
('Форрест Гамп', 'Forrest Gump', 1994, 142, 'Сидя на автобусной остановке, Форрест Гамп — не очень умный, но добрый и открытый парень — рассказывает случайным встречным историю своей необыкновенной жизни. С самого малолетства парень страдал от заболевания ног, соседские мальчишки дразнили его, но в один прекрасный день Форрест открыл в себе невероятные способности к бегу. Подруга детства Дженни всегда его поддерживала и защищала, но вскоре дороги их разошлись.'),
('Иван Васильевич меняет профессию', NULL, 1998, 128,'Инженер-изобретатель Тимофеев сконструировал машину времени, которая соединила его квартиру с далеким шестнадцатым веком - точнее, с палатами государя Ивана Грозного. Туда-то и попадают тезка царя пенсионер-общественник Иван Васильевич Бунша и квартирный вор Жорж Милославский. На их место в двадцатом веке «переселяется» великий государь. Поломка машины приводит ко множеству неожиданных и забавных событий...'),
('Назад в будущее', 'Back to the Future', 1985, 116, 'Подросток Марти с помощью машины времени, сооружённой его другом-профессором доком Брауном, попадает из 80-х в далекие 50-е. Там он встречается со своими будущими родителями, ещё подростками, и другом-профессором, совсем молодым.'),
('Криминальное чтиво', 'Pulp Fiction', 1994, 154, NULL);

select * from movies;

create table genres
(
  id serial primary key,
  name varchar(50) not null
);

create table actors
(
  id serial primary key,
  firstname varchar(50) not null,
  lastname varchar(50) not null
);

/*
1. Переименовать сущность movies в cinema.
2. Добавить сущности cinema новый атрибут status_active (тип BIT) и атрибут genre_id после атрибута title_eng.
3. Удалить атрибут status_active сущности cinema.
4. Удалить сущность actors из базы данных
5. Добавить внешний ключ на атрибут genre_id сущности cinema и направить его на атрибут id сущности genres.
6. Очистить сущность genres от данных и обнулить автоинкрементное поле.
*/

rename table movies to cinema;

alter table cinema 
add column status_active Bit default b'1',
add genre_id int after title_eng;

select * from cinema;

alter table cinema
drop column status_active;

select * from cinema;

select * from genres;

drop table actors;

alter table cinema
add foreign key(genre_id) references genres(id);

show create table cinema;

alter table cinema
modify column genre_id bigint unsigned;

show create table cinema;

truncate table genres;

alter table cinema
add column age_category varchar(1);

update cinema set age_category='П' where id=1;
update cinema set age_category='Д' where id=4;
update cinema set age_category='В' where id=5;

select id,title,
      case age_category
      when 'Д' then 'Детская'
      when 'П' then 'Подростковая'
      when 'В' then 'Взрослая'
      else 'Не указана'
      end as 'Категория'
      from cinema;
      
update cinema set count_min=88 where id=2;
update cinema set count_min=null where id=3;
update cinema set count_min=34 where id=4;

select id,title,count_min,
     case 
       when count_min<50 then 'Короткометражный фильм'
       when count_min between 50 and 100 then 'Среднеметражный фильм'
       when count_min>100 then 'Полнометражный фильм'
       else 'Не определено'
       end as 'Тип'
       from cinema;
       
select if(100<200,'true','false') as TF;     

select id,title,count_min,
if(count_min<50,'Короткометражный фильм',
if(count_min between 50 and 100, 'Среднеметражный фильм',
if(count_min>100, 'Полнометражный фильм','Не определено'))) as 'Тип'
from cinema;


