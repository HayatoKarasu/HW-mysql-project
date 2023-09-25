drop database if exists beauty_salons;
create database if not exists beauty_salons;
use beauty_salons;

create table if not exists salons(
id int primary key auto_increment,
название_салона varchar(50) not null,
адрес_салона varchar(50) not null,
график_работы_салона varchar(30) not null
);

create table if not exists masters(
id int primary key auto_increment,
фамилия_мастера varchar(50) not null,
имя_мастера varchar(50) not null,
телефон_мастера varchar(15) not null,
salon_id int,
foreign key(salon_id) references salons(id)
on delete restrict on update cascade
);

create table if not exists equipments(
id int primary key auto_increment,
название_оборудования varchar(50) not null
);

create table if not exists servise(
id int primary key auto_increment,
вид_услуги varchar(50) not null,
цена_услуги int unsigned not null
);

create table if not exists users(
id int primary key auto_increment,
фамилия_клиента varchar(50) not null,
имя_клиента varchar(50) not null,
телефон_клиента varchar(15) not null,
дата_рождения_клиента date not null
);

create table if not exists comments(
id int primary key auto_increment,
текст_отзыва varchar(500) not null,
дата_добавления_отзыва datetime not null default now(),
salon_id int,
master_id int,
user_id int,
foreign key(salon_id) references salons(id),
foreign key(master_id) references masters(id),
foreign key(user_id) references users(id)
on delete restrict on update cascade
);

create table if not exists registrations(
id int primary key auto_increment,
дата_и_время_записи datetime not null default now(),
salon_id int,
master_id int,
user_id int,
foreign key(salon_id) references salons(id),
foreign key(master_id) references masters(id),
foreign key(user_id) references users(id)
on delete restrict on update cascade
);

create table if not exists salons_servise(
salon_id int,
servise_id int,
primary key (salon_id, servise_id),
foreign key(salon_id) references salons(id),
foreign key(servise_id) references servise(id)
on delete restrict on update cascade
);

create table if not exists masters_servise(
master_id int,
servise_id int,
primary key (master_id, servise_id),
foreign key(master_id) references masters(id),
foreign key(servise_id) references servise(id)
on delete restrict on update cascade
);

create table if not exists registrations_servise(
registration_id int,
servise_id int,
primary key (registration_id, servise_id),
foreign key(registration_id) references registrations(id),
foreign key(servise_id) references servise(id)
on delete restrict on update cascade
);

create table if not exists equipments_servise(
equipment_id int,
servise_id int,
primary key (equipment_id, servise_id),
foreign key(equipment_id) references equipments(id),
foreign key(servise_id) references servise(id)
on delete restrict on update cascade
);

create table if not exists salons_users(
salon_id int,
user_id int,
primary key (salon_id, user_id),
foreign key(salon_id) references salons(id),
foreign key(user_id) references users(id)
on delete restrict on update cascade
);

insert into salons(название_салона, адрес_салона, график_работы_салона) values
('Рога и копыта', 'Москва, ул. Кукушкина, д. 12', 'с 09:00 до 21:00'),
('Ну и рожа у тебя, Шарапов', 'Москва, ул. Сойкина, д. 56', 'с 12:00 до 18:00');

insert into masters(фамилия_мастера, имя_мастера, телефон_мастера, salon_id) values
('Барашкина', 'Ольга', '8(888)888-88-88', 1),
('Овечкина', 'Светлана', '9(999)999-99-99', 2);

insert into equipments(название_оборудования) values
('Ножницы'),
('Бритва');

insert into servise(вид_услуги, цена_услуги) values
('Стрижка', 300),
('Бритье', 500);

insert into users(фамилия_клиента, имя_клиента, телефон_клиента, дата_рождения_клиента) values
('Быков', 'Кондрат', '7(777)777-77-77', '1990-01-02'),
('Сапрыкин', 'Костя', '6(666)666-66-66', '1991-03-04');

insert into comments(текст_отзыва, salon_id, master_id, user_id) values
('Все отлично!', 1, 1, 1),
('Косэлёк, косэлёк! Какой такой косэлёк!', 2, 2, 2);

insert into registrations(дата_и_время_записи, salon_id, master_id, user_id) values
('2023-09-25 12:00:00', 1, 1, 1),
('2023-09-25 13:00:00', 2, 2, 2);

insert into salons_servise values
(1, 1),
(2, 2);

insert into masters_servise values
(1, 1),
(2, 2);

insert into registrations_servise values
(1, 1),
(2, 2);

insert into equipments_servise values
(1, 1),
(2, 2);

insert into salons_users values
(1, 1),
(2, 2);

alter table salons -- поняли, что салонам не хватает номера телефона
add телефон_салона varchar(15) not null after адрес_салона; -- добавили столбик с номерами телефонов после столбика адрес

describe salons; -- посмотрели таблицу салоны, что все в порядке и все добавилось

alter table equipments -- вспомнили, что не хватает ссылки на оборудование салонов
add salon_id int; -- добавили поле для ссылки 

alter table equipments -- добавили саму ссылку 
add foreign key(salon_id) references salons(id)
on delete restrict on update cascade;

select*from salons;

update salons set телефон_салона = '5(555)555-55-55' where id = 1;
update salons set телефон_салона = '4(444)444-44-44' where id = 2;

select*from salons;
select*from masters;
select*from equipments;

update equipments set salon_id = 1 where id = 1;
update equipments set salon_id = 2 where id = 2;

select*from equipments;
select*from servise;
select*from users;
select*from comments;
select*from registrations;

select*from salons_users;

show tables;

-- запрос для определенного клиента когда, в какой салон и к какому мастеру он записан
-- отсортированно в обратном порядке по дате и времени записи
select фамилия_клиента, имя_клиента, дата_и_время_записи, 
название_салона, адрес_салона, фамилия_мастера, имя_мастера
from users
join registrations as reg on reg.user_id = users.id
join salons_users on salons_users.user_id = users.id
join salons on salons_users.salon_id = salons.id
join masters on reg.master_id = masters.id
where users.id = 1
order by дата_и_время_записи desc;