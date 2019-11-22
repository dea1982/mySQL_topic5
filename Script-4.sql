use shop;

/*
����� � ������� users ���� created_at � updated_at ��������� ��������������. 
��������� �� �������� ����� � ��������.
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
� ������� ��������� ������� storehouses_products � ���� value ����� ����������� ����� ������ �����: 0,
���� ����� ���������� � ���� ����, ���� �� ������ ������� ������. ���������� ������������� ������ ����� 
�������, ����� ��� ���������� � ������� ���������� �������� value. ������, ������� ������ ������ ���������� 
� �����, ����� ���� �������.
 */

SELECT * FROM storehouses_products ORDER BY value and value >= 1 desc;

/*
������� users ���� �������� ��������������. ������ created_at � updated_at ���� ������ ����� VARCHAR 
� � ��� ������ ����� ���������� �������� � ������� "20.10.2017 8:10". ���������� ������������� ���� � 
���� DATETIME, �������� �������� ����� ��������.
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
����������� ������� ������� ������������� � ������� users
 */

select birthday_at,
  avg(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS age
FROM
  users;

 /*
 ����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������. 
 ������� ������, ��� ���������� ��� ������ �������� ����, � �� ���� ��������.
  */

SELECT birthday_at, DAYNAME(birthday_at) as days from users; 
-- �� ���� �������� ����, ��� �� ��� ���� �������� ����.

