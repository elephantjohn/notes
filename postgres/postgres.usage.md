postgres usage

###### see reference:[postgres tutorial](https://www.postgresqltutorial.com/postgresql-fetch/)

# check Postgres version

open a terminal,enter this:

```
 psql -V
```

OR:

```
sudo find /usr -iwholename '*/bin/postgres' #@return:/usr/lib/postgresql/10/bin/postgres
/usr/lib/postgresql/10/bin/postgres -V
```

OR:

```
 locate bin/postgres #@return:/usr/lib/postgresql/10/bin/postgres
 /usr/lib/postgresql/10/bin/postgres -V
```

# login

```
psql -h localhost -d video -U postgres
>password: postgres
```

# connect to a database

```
# \c mydb
```

# restart postgres service

```
sudo service postgresql restart
```

# common commands

```
# \? ,for help
# \dn ,list available schema
# \df ,list avaliable functions
# \dv ,list available views
# \du ,list all users and their assign roles
# \s  ,show history
# \h create index ,show detailed information on 'create index' statement
# \timing ,turn on query execution time
# \e ,edit in your own editor
# \a ,command switches from aligned to non-aligned column output.
# \H ,command formats the output to HTML format.
# \q ,quit psql
```

# show dbs

```
# \l 
OR 
# \list
```

# show tables

```
\dt
```

# list index

```
select *
from pg_indexes
where tablename not like 'pg%';

OR:

\d tablename

,but why the result of these two method is different???
```

# query

### select first/last value

```
select * from faces where video_source_id='vid1' order by time_stamp DESC LIMIT 1 ;
select * from frames where video_source_id='vid1' order by time_stamp DESC LIMIT 1 ;
```

### seletet 20000000 items

```
explain analyze select count(*) from faces_test where video_source_id='vid1' and time_stamp<1590634557925981967 and time_stamp>1590630000925981967  ;

whats the exec  result :
in ssd: 4s
in hdd: 154s
```

### limit/offset/fetch

```
# select relname,oid,relfilenode from pg_class limit 100;
# select relname,oid,relfilenode from pg_class limit 3 offset 350; 
  //skip 350 items ,then do limit
# select relname,oid,relfilenode from pg_class  offset 250 rows fetch next 5 rows only;
  //skip 250 items ,then do fetch, fetch first 5 rows 


# select time_stamp from faces_test order by time_stamp asc limit  100;
# select time_stamp from faces_test order by time_stamp asc limit  100 offset 5000;
# select time_stamp from faces_test order by time_stamp asc  offset 5000 fetch first 5 rows only;
```

### in/not in/cast

```
//IN
SELECT customer_id FROM rental WHERE customer_id IN (1, 2);

//NOT IN
SELECT customer_id FROM rental WHERE customer_id NOT IN (1, 2);
===is equal to=== :
SELECT customer_id FROM rental WHERE customer_id  <> 1 AND customer_id <> 2;

//CAST
//The CAST() function converts a value (of any type) into a specified datatype.
//SELECT CAST(25.65 AS int); @return:25
SELECT	customer_id FROM rental WHERE CAST (return_date AS DATE) = '2005-05-27';
```

### between

```
SELECT	customer_id FROM payment WHERE amount NOT BETWEEN 8 AND 9;
SELECT	customer_id FROM payment WHERE payment_date BETWEEN '2007-02-07' AND '2007-02-15';
```

### like/ilike

```
Percent ( %)  for matching any sequence of characters.
Underscore ( _)  for matching any single character.
ILIKE operator matches value case-insensitively.

SELECT
	'foo' LIKE 'foo', -- true
	'foo' LIKE 'f%', -- true
	'foo' LIKE '_o_', -- true
	'bar' LIKE 'b_'; -- false

SELECT	first_name, last_name FROM	customer WHERE	first_name LIKE '%er%';
SELECT	first_name,	last_name FROM 	customer WHERE 	first_name LIKE '_her%';
SELECT 	first_name,	last_name FROM	customer WHERE 	first_name NOT LIKE 'Jen%';
SELECT	first_name,	last_name FROM	customer WHERE	first_name ILIKE 'BAR%'; //bAR,bar,BAr
```

### null/not null

```
CREATE TABLE contacts(
    id INT GENERATED BY DEFAULT AS IDENTITY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    PRIMARY KEY (id)
);

SELECT	id,	last_name FROM	customer WHERE	phone IS NOT NULL;
SELECT	id,	last_name FROM	customer WHERE	phone IS NULL
```

### column alias/table alias/join

##### column alias

```
SELECT column_name AS alias_name FROM table;
===is equal to=== :
SELECT column_name alias_name FROM table;

SELECT first_name || ' ' || last_name AS full_name FROM customer ORDER BY full_name;
@return:
Adrom Selby
Adam Gooch
Alex Gresham
```

##### table alias

```
SELECT t1.column_name, 
     t2.column_name
FROM table_name1 t1
INNER JOIN table_name2 t2 ON join_predicate; //t2 is the alias name of table_name2
```

##### inner join

[![PostgreSQL-INNER-JOIN-Venn-Diagram](/sunruixin/notes/-/blob/master/home/srx/Work/isz/notes/usage/PostgreSQL-INNER-JOIN-Venn-Diagram.png)]()

###### what is ineer join

[![A-and-B-tables](/sunruixin/notes/-/blob/master/home/srx/Work/isz/notes/usage/A-and-B-tables.png)]()

```
SELECT
	A.pka,
	A.c1,
	B.pkb,
	B.c2
FROM
	A
INNER JOIN B ON A .pka = B.fka;

//
    First, you specify the column in both tables from which you want to select data in the SELECT clause
    Second, you specify the main table i.e.,  A in the FROM clause.
    Third, you specify the table that the main table joins to i.e., B in the INNER JOIN clause. In addition, you put a join condition after the ON keyword i.e, A.pka = B.fka.
```

###### join 2 tables:

[![customer-and-payment-tables](/sunruixin/notes/-/blob/master/home/srx/Work/isz/notes/usage/customer-and-payment-tables.png)]()

```
SELECT
	customer.customer_id
FROM
	customer
INNER JOIN payment ON payment.customer_id = customer.customer_id;
SELECT
	customer.customer_id	
FROM
	customer
INNER JOIN payment ON payment.customer_id = customer.customer_id
ORDER BY
	customer.customer_id;
SELECT
	customer.customer_id	
FROM
	customer
INNER JOIN payment ON payment.customer_id = customer.customer_id
WHERE
	customer.customer_id = 2;
```

###### join 3 tables:

[![customer-payment-staff-tables](/sunruixin/notes/-/blob/master/home/srx/Work/isz/notes/usage/customer-payment-staff-tables.png)]()

```
SELECT
	customer.customer_id,
	customer.first_name customer_first_name,
	customer.last_name customer_last_name,
	customer.email,
	staff.first_name staff_first_name,
	staff.last_name staff_last_name,
	amount,
	payment_date
FROM
	customer
INNER JOIN payment ON payment.customer_id = customer.customer_id
INNER JOIN staff ON payment.staff_id = staff.staff_id;
```

### left join

###### what is left join

```
LEFT JOIN also referred as LEFT OUTER JOIN
If you want to select rows from the A table that have corresponding rows in the B table, you use the INNER JOIN clause.

If you want to select rows from the A table which may or may not have corresponding rows in the B table, you use the LEFT JOIN clause. In case, there is no matching row in the B table, the values of the columns in the B table are substituted by the NULL values.
```

[![A-and-B-tables1](/sunruixin/notes/-/blob/master/home/srx/Work/isz/notes/usage/A-and-B-tables1.png)]()

```
SELECT
	A.pka,
	A.c1,
	B.pkb,
	B.c2
FROM
	A
LEFT JOIN B ON A .pka = B.fka;
```

[![PostgreSQL-LEFT-JOIN-Venn-Diagram](/sunruixin/notes/-/blob/master/home/srx/Work/isz/notes/usage/PostgreSQL-LEFT-JOIN-Venn-Diagram.png)]()

[![film-and-inventory-tables](/sunruixin/notes/-/blob/master/home/srx/Work/isz/notes/usage/film-and-inventory-tables.png)]()

```
SELECT
	film.film_id,
	film.title,
	inventory_id
FROM
	film
LEFT JOIN inventory ON inventory.film_id = film.film_id;
```

[![PostgreSQL-LEFT-JOIN-two-tables](/sunruixin/notes/-/blob/master/home/srx/Work/isz/notes/usage/PostgreSQL-LEFT-JOIN-two-tables.png)]()

```
SELECT
	film.film_id,
	film.title,
	inventory_id
FROM
	film
LEFT JOIN inventory ON inventory.film_id = film.film_id
WHERE
	inventory.film_id IS NULL;
```

[![PostgreSQL-LEFT-JOIN-WHERE-IS-NULL](/sunruixin/notes/-/blob/master/home/srx/Work/isz/notes/usage/PostgreSQL-LEFT-JOIN-WHERE-IS-NULL.png)]()

### self join

```
SELECT
    e.first_name || ' ' || e.last_name employee,
    m .first_name || ' ' || m .last_name manager
FROM
    employee e
LEFT JOIN employee m ON m .employee_id = e.manager_id
ORDER BY
    manager;
```

[![PostgreSQL-Self-Join-example-with-left-join](/sunruixin/notes/-/blob/master/home/srx/Work/isz/notes/usage/PostgreSQL-Self-Join-example-with-left-join.png)]()

# delete

### delete a table

```
delete from faces;
delete from frames;
```

# pysical storage

### Postgres location

do:

```
# show data_directory;
```

the postgres will return:

```
video=# show data_directory;

video=# show data_directory;
       data_directory        
-----------------------------
 /var/lib/postgresql/10/main
(1 row)
```

### a specific database location

do:

```
# select datname,oid from pg_database where datname='video'; //"video" is a db name
```

the postgres will return:

```
video=# select datname,oid from pg_database where datname='video';

 datname |  oid  
---------+-------
 video   | 16400
(1 row)
```

the oid means Object Id, its a directory name told by  running  "# show data_directory;"  here its "/var/lib/postgresql/10/main"

### a specific table location

do:

```
# select relname,oid,relfilenode from pg_class limit 10;
```

the postgres will return:

```
video=#  select relname,oid,relfilenode from pg_class limit 10;
       relname        |  oid  | relfilenode 
----------------------+-------+-------------
 pg_toast_16401       | 16410 |       16410
 pg_toast_16401_index | 16412 |       16412
 faces                | 16401 |       16401
 faces_pkey           | 16413 |       16413
 pg_toast_16415       | 16422 |       16422
 pg_toast_16415_index | 16424 |       16424
 frames               | 16415 |       16415
 frames_pkey          | 16425 |       16425
 pg_statistic         |  2619 |        2619
 pg_type              |  1247 |           0
 pg_toast_2604        |  2830 |        2830
 pg_toast_2604_index  |  2831 |        2831
```

the oid is the directory name where the table located.

here, the table frames is located at :

```
/var/lib/postgresql/10/main/16400/16415
```

and the table faces is located at:

```
/var/lib/postgresql/10/main/16400/16401
```

# view postgres-select-cpu settings

do:

```
# select name,setting from pg_settings ps
  where ps.name in ('seq_page_cost','random_page_cost','cpu_tuple_cost','cpu_index_tuple_cost','cpu_operator_cost');
```

the postgres will return:

```
video=# select name,setting from pg_settings ps
video-#   where ps.name in ('seq_page_cost','random_page_cost','cpu_tuple_cost','cpu_index_tuple_cost','cpu_operator_cost');
         name         | setting 
----------------------+---------
 cpu_index_tuple_cost | 0.005
 cpu_operator_cost    | 0.0025
 cpu_tuple_cost       | 0.01
 random_page_cost     | 4
 seq_page_cost        | 1
(5 rows)
```

# duplicate database

duplicate databse to the same server:

```
create database video_test with template video;

@info:
after running this command,error may occur as:
> ERROR:  source database "video" is being accessed by other users
> DETAIL:  There is 1 other session using the database.
then,try to kill a session as:
>SELECT *, pg_terminate_backend(pid)
 FROM pg_stat_activity 
 WHERE pid <> pg_backend_pid()
 AND datname = 'video';
```

# duplicate tables

```
CREATE TABLE new_table AS 
TABLE existing_table;
```

# sessions

### select count of all actived sessions

```
select count(*) from pg_stat_activity;
```

### kill a postgresql session/connection

```
SELECT *, pg_terminate_backend(pid)
FROM pg_stat_activity 
WHERE pid <> pg_backend_pid()
AND datname = 'video';
```

# check configuration

```
locate postgresql.conf
locate pg_hba.conf
locate pg_ident.conf

to find the location to store the .conf files, almost in :'/etc/postgresql/10/main'
```

# import/export data

use pgAdmin4