use shop;

/*
ѕусть в таблице users пол€ created_at и updated_at оказались незаполненными. 
«аполните их текущими датой и временем.
*/

update users
set 
	created_at = now(),
	updated_at = now();
	
insert into storehouses_products (value) values
	('1'),
	('1'),
	('0'),
	('2'),
	('2'),
	('0'),
	('3');

/*
¬ таблице складских запасов storehouses_products в поле value могут встречатьс€ самые разные цифры: 0,
если товар закончилс€ и выше нул€, если на складе имеютс€ запасы. Ќеобходимо отсортировать записи таким 
образом, чтобы они выводились в пор€дке увеличени€ значени€ value. ќднако, нулевые запасы должны выводитьс€ 
в конце, после всех записей.
 */

SELECT * FROM storehouses_products ORDER BY value and value >= 1 desc;

/*
“аблица users была неудачно спроектирована. «аписи created_at и updated_at были заданы типом VARCHAR 
и в них долгое врем€ помещались значени€ в формате "20.10.2017 8:10". Ќеобходимо преобразовать пол€ к 
типу DATETIME, сохранив введеные ранее значени€.
 */

drop table if exists users_2;
create table users_2(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255)
);

insert into users_2(name) values
	('20.10.2017 8:10'),
	('20.10.2017 8:10'),
	('20.10.2017 8:10');


SELECT STR_TO_DATE(name, '%d.%m.%Y %H:%i') from users_2;

update users_2 
set name = STR_TO_DATE(name, '%d.%m.%Y %H:%i');

/*
ѕодсчитайте средний возраст пользователей в таблице users
 */

select birthday_at,
  avg(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS age
FROM
  users;

 /*
 ѕодсчитайте количество дней рождени€, которые приход€тс€ на каждый из дней недели. 
 —ледует учесть, что необходимы дни недели текущего года, а не года рождени€.
  */

SELECT birthday_at, DAYNAME(birthday_at) as days from users; 
-- не смог добитьс€ того, что бы дни были текущего года.

