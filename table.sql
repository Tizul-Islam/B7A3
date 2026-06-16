
-- create database
create database ticketBooking

-- DROP TABLES IF THEY ALREADY EXIST TO PREVENT CONFLICTS
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;



-- create Users table
create table Users (
    user_id serial primary key,
    full_name varchar(100),
    email varchar(50) unique,
    role varchar(30) check (role = 'Ticket Manager' or role = 'Football Fan'),
    phone_number varchar(20)
    
);



-- create Matches table
CREATE TABLE Matches (
    match_id serial primary key,
    fixture varchar(100),
    tournament_category varchar(50),
    base_ticket_price decimal(10, 2) check (base_ticket_price > 0),
    match_status varchar(30) check (match_status = 'Available' or match_status = 'Selling Fast' or match_status = 'Sold Out' or match_status = 'Postponed')
    
);


-- create Booking table
CREATE TABLE Bookings (
    booking_id serial primary key,
    user_id int references users(user_id) on delete cascade,
    match_id int references matches(match_id) on delete cascade,
    seat_number varchar(10) unique,
    payment_status varchar(20) check (payment_status = 'Pending' or payment_status = 'Confirmed' or payment_status = 'Cancelled' or payment_status = 'Refunded'),
    total_cost decimal(10, 2) check (total_cost > 0)
    
);


-- insert info into Users table
INSERT INTO Users (user_id, full_name, email, role, phone_number) VALUES
(1, 'Tanvir Rahman', 'tanvir@mail.com', 'Football Fan', '+8801711111111'),
(2, 'Asif Haque', 'asif@mail.com', 'Football Fan', '+8801722222222'),
(3, 'Sajjad Rahman', 'sajjad@mail.com', 'Ticket Manager', '+8801733333333'),
(4, 'Jannat Ara', 'jannat@mail.com', 'Football Fan', NULL);



-- insert info into Matches table
INSERT INTO Matches (match_id, fixture, tournament_category, base_ticket_price, match_status) VALUES
(101, 'Real Madrid vs Barcelona', 'Champions League', 150.00, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120.00, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130.00, 'Available'),
(104, 'AC Milan vs Inter Milan', 'Serie A', 90.00, 'Sold Out'),
(105, 'Juventus vs Roma', 'Serie A', 80.00, 'Available');



-- insert info into Booking table
INSERT INTO Bookings (booking_id, user_id, match_id, seat_number, payment_status, total_cost) VALUES
(501, 1, 101, 'A-12', 'Confirmed', 150.00),
(502, 1, 102, 'B-04', 'Confirmed', 120.00),
(503, 2, 101, 'A-13', 'Confirmed', 150.00),
(504, 2, 101, NULL, NULL, 150.00),
(505, 3, 102, 'C-20', 'Pending', 120.00);



