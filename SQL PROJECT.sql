-- SQL POJECT ON ONLINE MOVIE TICKET BOOKING SYSTEM 

-- CREATING DATABASES
create database sqlproject;
use sqlproject;

-- 1) DDL COMMAND
	-- i) CREATE COMMAND
    
-- creating table for user
CREATE TABLE User(
user_id INT AUTO_INCREMENT PRIMARY KEY, 
user_name VARCHAR(60) NOT NULL, 
password VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
phone_no VARCHAR(15) NOT NULL); 

-- creating table for movie
CREATE TABLE Movie(
movie_id INT AUTO_INCREMENT PRIMARY KEY,
movie_name VARCHAR(200) NOT NULL,
movie_genre VARCHAR(100)  NOT NULL,
movie_duration INT NOT NULL,
movie_description TEXT NOT NULL,
movie_release_date DATE NOT NULL,
movie_rating INT,
added_by INT,
foreign key	(added_by) references user(user_id));

-- creating table fo theater
create table  Theaters (
    theater_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    location VARCHAR(255) NOT NULL,
    total_seats INT NOT NULL);
    
    --  creating table for screen and shows
    CREATE TABLE Shows(
    show_id INT AUTO_INCREMENT PRIMARY KEY,
    theater_id INT,
    screen_number INT NOT NULL,
    movie_id INT,
    show_time DATETIME NOT NULL,
    available_seats INT NOT NULL,
    FOREIGN KEY (theater_id) REFERENCES Theaters(theater_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);


  --  create  table for Booking
CREATE TABLE Booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    show_id INT,
    user_id INT,
    seat_type VARCHAR(50) NOT NULL,
    FOREIGN KEY (show_id) REFERENCES Shows(show_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- create table for payments
CREATE TABLE Payment(
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,  
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- ii) ALTER TABLE

-- removing the column
ALTER TABLE Movie
drop  column movie_description;

-- adding the column
ALTER TABLE Movie
add column movie_description varchar(100);

-- modifying the column
ALTER TABLE Movie
modify column movie_description text;

-- iii) TRUNCATE TABLE

TRUNCATE TABLE Booking;
TRUNCATE TABLE Payment;

-- iv) DROP TABLE

DROP TABLE Payment;
DROP TABLE Booking;

-- 2) DML COMMANDS

-- i) INSERT COMMAND

-- inserting the valies into user table
INSERT INTO User (user_name, password, email, phone_no) VALUES 
('Arun', 'password123', 'arun@example.com', '9234567890'),
('Mallika', 'securePass456', 'mallika@example.com', '9987654321'),
('Karthik', 'passKarthik789', 'karthik@example.com', '9112223333'),
('Lakshmi', 'lakshmiPass321', 'lakshmi@example.com', '9445556666'),
('Vijay', 'vijayPass654', 'vijay@example.com', '9778889999'),
('Priya', 'priyaPass987', 'priya@example.com', '9001112222');

-- inserting the valiues into movie table
INSERT INTO Movie (movie_name, movie_genre, movie_duration, movie_description, movie_release_date, movie_rating, added_by) VALUES 
('Kaala', 'Action', 152, 'Rajinikanth stars as a powerful don.', '2018-06-07', 8, 1),
('Baahubali', 'Fantasy', 167, 'Epic tale of a kingdom and its king.', '2015-07-10', 9, 2),
('Asuran', 'Drama', 141, 'A farmer fights for his family and land.', '2019-10-04', 8, 3),
('Viswasam', 'Action', 153, 'A village chieftain battles for justice.', '2019-01-10', 7, 4),
('Mersal', 'Thriller', 172, 'A magician and doctor exposes corruption.', '2017-10-18', 8, 5),
('Petta', 'Action', 171, 'A hostel warden with a violent past.', '2019-01-10', 7, 6);

-- inserting the valued into theaters table
INSERT INTO Theaters (name, location, total_seats) VALUES 
('Sathyam Cinemas', 'Chennai', 300),
('Escape Cinemas', 'Chennai', 250),
('Devi Cineplex', 'Chennai', 200),
('Albert Theatre', 'Chennai', 180),
('Rohini Silver Screens', 'Chennai', 220),
('Woodlands Theatre', 'Chennai', 150);

-- inserting the values into shows table
INSERT INTO Shows(theater_id, screen_number, movie_id, show_time, available_seats) VALUES 
(1, 1, 1, '2024-07-22 14:00:00', 300),
(2, 2, 2, '2024-07-22 17:00:00', 250),
(3, 3, 3, '2024-07-22 20:00:00', 200),
(4, 4, 4, '2024-07-22 13:00:00', 180),
(5, 5, 5, '2024-07-22 16:00:00', 220),
(6, 6, 6, '2024-07-22 19:00:00', 150);

-- inserting the values into Booking table
INSERT INTO Booking (show_id, user_id, seat_type) VALUES 
(1, 1, 'Regular'),
(2, 2, 'Prime'),
(3, 3, 'Regular'),
(4, 4, 'Classic'),
(5, 5, 'Prime'),
(6, 6, 'Regular');

-- insert into paymennts table
INSERT INTO Payment(user_id, amount, payment_method) VALUES 
(1, 150.00, 'Credit Card'),
(2, 200.00, 'Debit Card'),
(3, 100.00, 'PayPal'),
(4, 250.00, 'Credit Card'),
(5, 300.00, 'Debit Card'),
(6, 350.00, 'PayPal');


-- ii)UPDATE COMMAND
update user
set user_name='siva'
where user_id=6;

-- iii)DELETE COMMAND
 -- delete from user where user_id=6;

-- 3) DQL COMMAND

SELECT * FROM User;
SELECT * FROM Movie;
SELECT * FROM Theaters;
SELECT * FROM Shows;
SELECT * FROM Booking;
SELECT * FROM Payment;

-- 4) WHERE CLAUSE
SELECT * FROM user WHERE user_id=5;

-- 5) GROUP BY CLAUSE
SELECT seat_type FROM Booking GROUP BY seat_type;

-- 6) HAVING CLAUSE
SELECT seat_type FROM Booking GROUP BY seat_type HAVING COUNT(seat_type)>=2;

-- 7) OPERATORS

 -- i)ARITHMETIC OPERATOR(+,-,*,/,%)
 SELECT * FROM user WHERE user_id%2=0; -- even id
 
 -- ii)RELATIONAL OPERATOR(<,>,<=,>=,=,!=)
 SELECT * FROM user WHERE user_id>3;
 SELECT * FROM user WHERE user_id<3;
 SELECT * FROM user WHERE user_id<=3;
 SELECT * FROM user WHERE user_id>=3;
 SELECT * FROM user WHERE user_id=5;
 SELECT * FROM user WHERE user_id!=3;
  
 -- iii)LOGICAL OPERATOR(AND,OR,NOT)
 -- and
 SELECT * FROM payment WHERE amount>100 and payment_method='Credit Card';
 -- or
 SELECT * FROM payment WHERE amount>100 or payment_method='Credit Card';
 -- not
 SELECT * FROM payment WHERE payment_method not like 'Credit Card';
 
 -- iv)SPECIAL OPERATOR(IN,NOT IN,BETWEEN,NOT BETWEEN,LIKE,NOT LIKE,IS NULL,IS NOT NULL,ESCAPE)
 
 -- in
SELECT * FROM User WHERE user_id in(3,4,5);
 -- not in
SELECT * FROM User WHERE user_id not in(3,4,5);
-- between
SELECT * FROM Payment where amount between 100.00 and 300.00;
-- not between
SELECT * FROM Payment where amount not between 100.00 and 300.00;
-- like
SELECT * FROM user where user_name like 's%';
-- not like
SELECT * FROM user where user_name not like 's%';
-- is null
SELECT * FROM user where user_name is null;
-- is not null
SELECT * FROM user where user_name is not null;

 -- V)SET OPERATOR(union,union all,intersect,except)
 -- union
 SELECT * FROM user where user_id>3
 UNION
 SELECT * FROM user;
 
 -- union all
  SELECT * FROM user where user_id>3
 UNION ALL
 SELECT * FROM user;
 
 -- intersect
  SELECT * FROM user where user_id>3
 INTERSECT
 SELECT * FROM user;
 
 -- except
  SELECT * FROM user 
 except
 SELECT * FROM user WHERE user_id>3;
 
-- 8) SINGLE ROW FUNCTION

-- lower()
SELECT LOWER(user_name) as name_in_lower FROM user;

-- upper()
SELECT UPPER(user_name) as name_in_upper FROM user;

-- reverse()
SELECT REVERSE(user_name) as reversed_name FROM  user;

-- length()
SELECT LENGTH(user_name) as name_length FROM user;

-- concat()
SELECT CONCAT(user_name,' ',user_name) as full_name FROM user;

-- substr()
SELECT SUBSTR(user_name,2) as start_from_2 FROM user;

-- 9) MULTIROW FUNCTION / AGGREGATE FUNCTION
-- (i) MINIMUM
SELECT MIN(Amount)FROM Payment;
-- (ii) MAXIMUM
SELECT MAX(Available_seats)FROM Shows;
-- (iii) COUNT
SELECT COUNT(*) FROM Payment WHERE Amount = 150.00;
-- (iv) SUM
SELECT SUM(Amount) FROM Payment;
-- (v) AVERAGE
SELECT AVG(Amount) FROM Payment;

-- 10) SUBQUERY

-- write a query to display whose payment_amount is greater than 150
SELECT user_name from user where user_id in (select user_id from payment where amount>150.0);

-- 11) NESTED SUBQUERY
   -- write a query to display users whose payment amount is greater than user_id 1
SELECT user_name FROM user where user_id>(SELECT user_id from payment where amount= (select amount from payment where user_id=1));
  
-- 11) JOINS
-- (i) INNER JOIN
SELECT user.user_name,Payment.amount,Payment.payment_method FROM 
user JOIN Payment ON user.user_ID =Payment.user_id;
-- (ii) LEFT JOIN
SELECT user.user_name,Payment.amount,Payment.payment_method FROM 
user LEFT JOIN Payment ON user.user_ID =Payment.user_id;
-- (iii) RIGHT JOIN
SELECT user.user_name,Payment.amount,Payment.payment_method FROM 
user RIGHT JOIN Payment ON user.user_ID =Payment.user_id;
-- (iv) FULL JOIN
SELECT user.username,Payment.amount,Payment.payment_method FROM 
user FULL OUTER JOIN Payment ON user.user_ID = Payment.user_id;

-- 12)TCL

-- commit
start transaction;
INSERT INTO User (user_name, password, email, phone_no) VALUES 
('Ansa', 'password123we', 'ansa@example.com', '9934567890'),
('Malika', 'securePass45aa6', 'malika@example.com', '8887654321');
commit;
select * from user;

-- rollback
START TRANSACTION;
UPDATE user 
set user_name='mahalakshmi'
where user_id=1;
select * from user;
rollback;

-- savepoint
START TRANSACTION;
SAVEPOINT INITIAL;
UPDATE user 
set user_name='Jaya'
where user_id=3;
select * from user;
SAVEPOINT upto_updation;
rollback to INITIAL;
select * from user;


-- 13) VIEWS
CREATE VIEW Users_Payment_Details AS
SELECT user.user_name,Payment.amount,Payment.payment_method FROM 
user JOIN Payment ON user.user_ID =Payment.user_id;

SELECT * FROM Users_Payment_Details;

CREATE VIEW Sum_amount AS
SELECT SUM(Amount) FROM Payment;

SELECT * FROM sum_amount;

