# Football Ticket Booking Database Management System

A PostgreSQL database project designed to manage football match ticket bookings. The system stores user information, football match details, booking records, payment statuses, and ticket pricing while maintaining data integrity through relational database constraints.

---

## 📌 Project Overview

This project demonstrates the design and implementation of a relational database system for a football ticket booking platform.

The database allows:

- Managing football fans and ticket managers.
- Managing football match information.
- Booking match tickets.
- Tracking payment status.
- Maintaining data consistency using Primary Keys, Foreign Keys, Constraints, and Joins.

---

## 🗂 Database Schema

### 👤 Users Table

Stores information about users of the ticket booking platform, including football fans and ticket managers.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| `user_id` | SERIAL | Primary Key | Unique identifier for each user. |
| `full_name` | VARCHAR(100) | | Full name of the user. |
| `email` | VARCHAR(50) | UNIQUE | User's email address used for identification. |
| `role` | VARCHAR(30) | CHECK | Defines whether the user is a **Football Fan** or **Ticket Manager**. |
| `phone_number` | VARCHAR(20) | NULL Allowed | User's contact phone number. |

---

### ⚽ Matches Table

Stores football match information and ticket pricing details.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| `match_id` | SERIAL | Primary Key | Unique identifier for each match. |
| `fixture` | VARCHAR(100) |  | Names of the two teams participating in the match. |
| `tournament_category` | VARCHAR(50) |  | Competition name (e.g., Champions League, Premier League). |
| `base_ticket_price` | DECIMAL(10,2) | CHECK (> 0) | Starting ticket price for the match. |
| `match_status` | VARCHAR(30) | CHECK | Current ticket availability status. |

#### Allowed Match Status Values

| Status | Meaning |
|---------|---------|
| Available | Tickets are available for purchase. |
| Selling Fast | Limited tickets remain. |
| Sold Out | No tickets are available. |
| Postponed | Match has been rescheduled. |

---

### 🎟️ Bookings Table

Stores ticket booking records made by users for specific football matches.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| `booking_id` | SERIAL | Primary Key | Unique identifier for each booking. |
| `user_id` | INT | Foreign Key | References the user who made the booking. |
| `match_id` | INT | Foreign Key | References the booked football match. |
| `seat_number` | VARCHAR(10) | UNIQUE | Reserved seat identifier. |
| `payment_status` | VARCHAR(20) | CHECK | Current payment state of the booking. |
| `total_cost` | DECIMAL(10,2) | CHECK (> 0) | Total amount paid for the booking. |

#### Allowed Payment Status Values

| Status | Meaning |
|---------|---------|
| Pending | Payment has not been completed. |
| Confirmed | Payment has been successfully completed. |
| Cancelled | Booking has been cancelled. |
| Refunded | Payment has been refunded. |

---

## 🔗 Database Relationships

| Parent Table | Child Table | Relationship | Description |
|-------------|------------|-------------|-------------|
| Users | Bookings | One-to-Many (1:N) | A user can create multiple bookings. |
| Matches | Bookings | One-to-Many (1:N) | A match can have multiple ticket bookings. |

### Relationship Diagram

[Click here to view ERD Diagram](https://drawsql.app/teams/md-shahdat/diagrams/footabll-ticket-booking)

---

## 🔒 Data Integrity Rules

| Rule | Description |
|--------|-------------|
| Primary Keys | Ensure every record is uniquely identifiable. |
| Foreign Keys | Maintain referential integrity between tables. |
| Unique Constraints | Prevent duplicate emails and seat allocations. |
| Check Constraints | Restrict invalid role, status, and price values. |
| Cascade Delete | Automatically removes bookings if the related user or match is deleted. |

## 📋 Assignment Queries

### Query 1

Retrieve all available Champions League matches.

**Concepts Used:**
- WHERE
- Filtering

---

### Query 2

Search users whose names start with "Tanvir" or contain "Haque".

**Concepts Used:**
- ILIKE
- Pattern Matching

---

### Query 3

Display bookings with missing payment status using a replacement value.

**Concepts Used:**
- COALESCE
- NULL Handling

---

### Query 4

Retrieve booking details with user names and match fixtures.

**Concepts Used:**
- INNER JOIN
- Multi-table Queries

---

### Query 5

Show all users including those without bookings.

**Concepts Used:**
- LEFT JOIN

---

### Query 6

Find bookings whose cost exceeds the average booking cost.

**Concepts Used:**
- Subquery
- Aggregate Function

---

### Query 7

Retrieve the top 2 expensive matches while excluding the highest-priced match.

**Concepts Used:**
- MAX()
- ORDER BY
- LIMIT
- Subquery

---

## 🎯 SQL Concepts Demonstrated

- Database Creation
- Table Creation
- Data Insertion
- Primary Key
- Foreign Key
- Unique Constraint
- Check Constraint
- NULL Handling
- Joins
- Subqueries
- Aggregate Functions
- Filtering
- Sorting
- Data Integrity

---

## 📚 Learning Outcomes

Through this project, the following database concepts were practiced:

- Relational Database Design
- Entity Relationship Modeling
- PostgreSQL Query Writing
- Constraint Management
- Data Retrieval Techniques
- Query Optimization Basics
