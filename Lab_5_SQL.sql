use sakila;
#1.Drop column picture from staff.
alter table staff
drop column picture;


#2.A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly
SELECT * from customer
where first_name = "Tammy" and last_name = "Sanders";
insert into staff values(3, "Tammy", "Sanders", 79, "TAMMY.SANDERS@sakilacustomer.org",2,1, "Tammy", " ", "2006-02-15 04:57:20");
select * from staff;

/*3.Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table.
Hint: Check the columns in the table rental and see what information you would need to add there.
 You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query: */
 
 SELECT 
    customer_id
FROM
    sakila.customer
WHERE
    first_name = 'CHARLOTTE'
        AND last_name = 'HUNTER';
        
        
SELECT 
    *
FROM
    inventory
WHERE
    film_id = 1 AND store_id = 1;   
        
        
        
 SELECT 
    film_id
FROM
    film
WHERE
    title = 'Academy Dinosaur';
    
    
SELECT 
    staff_id
FROM
    staff
WHERE
    first_name = 'Mike';
    
INSERT INTO rental VALUES (16050, current_date(), 1, 130, NULL, 1, current_timestamp());

/* 4.Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:

Check if there are any non-active users
Create a table backup table as suggested
Insert the non active users in the table backup table
Delete the non active users from the table customer */

select count(*) from customer where active = 0;

CREATE TABLE deleted_users (
  customer_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  store_id INT UNSIGNED NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(50) DEFAULT NULL,
  address_id INT UNSIGNED NOT NULL,
  active BOOLEAN NOT NULL DEFAULT TRUE,
  create_date DATETIME NOT NULL,
  last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP );

insert into deleted_users select * from customer where active = 0;
delete from customer where active = 0;
