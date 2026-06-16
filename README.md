# ⚽ Football Ticket Booking System - Database Architecture

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-003B57?style=for-the-badge&logo=sqlite&logoColor=white)
![Database Design](https://img.shields.io/badge/Database_Design-4EA94B?style=for-the-badge&logo=mongodb&logoColor=white)
 
Welcome to the **Football Ticket Booking System** database project! This repository contains the complete schema design, Entity-Relationship Diagram (ERD), and complex SQL queries required to manage real-world ticketing scenarios for a football platform.

## 📖 Project Overview

This project is built to seamlessly handle football fans purchasing tickets, manage upcoming tournament matches, and generate individual ticket booking receipts. It demonstrates a strong understanding of database relationships, referential integrity, and advanced data retrieval techniques.

---

## 🗄️ Database Schema Architecture

The system is built on a robust, normalized relational database architecture consisting of three core tables:

### 1️⃣ `Users` Table
Manages the platform's user base, including both administrative staff and football fans.
* **Key Fields**: `user_id` (PK), `full_name`, `email`, `role`, `phone_number`.

### 2️⃣ `Matches` Table
Catalogs all tournament events, team fixtures, base pricing, and ticket availability statuses.
* **Key Fields**: `match_id` (PK), `fixture`, `tournament_category`, `base_ticket_price`, `match_status`.

### 3️⃣ `Bookings` Table
A transactional table recording every individual ticket purchase, establishing the vital link between a fan and a specific match.
* **Key Fields**: `booking_id` (PK), `user_id` (FK), `match_id` (FK), `seat_number`, `payment_status`, `total_cost`.

---

## 🔗 Entity-Relationship Diagram (ERD)

The database utilizes `One-to-Many`, `Many-to-One`, and `One-to-One` (logical) relationships to enforce data integrity. 

> 📊 **[View the Complete ERD Diagram Here](https://drawsql.app/teams/tt-/diagrams/sql)**

---

## 🚀 Advanced SQL Queries Implemented

All queries can be found within the `QUERY.sql` file. The project utilizes various intermediate to advanced SQL features, including:

- **Filtering & Pattern Matching**: Finding specific tournament matches or searching user names using `ILIKE` and `LIKE`.
- **Handling Missing Data**: Utilizing `COALESCE` to elegantly manage `NULL` payment statuses.
- **Complex Joins**: Employing `INNER JOIN` to fetch booking receipts with full user and match details, and `LEFT JOIN` to identify users with zero bookings.
- **Aggregations & Subqueries**: Calculating the system's average booking cost and dynamically filtering transactions that exceed it.
- **Sorting & Pagination**: Retrieving the most expensive matches using `ORDER BY`, `LIMIT`, and `OFFSET` strategies.

---

## 🛠️ Technical Concepts Demonstrated

* **Referential Integrity**: Robust use of Primary Keys (PK) and Foreign Keys (FK).
* **Constraints**: Data validation through `UNIQUE`, `CHECK`, and `NOT NULL` constraints.
* **Relational Logic**: Precise mapping of real-world scenarios into relational tables.
* **Data Cleansing**: Graceful handling of empty records and null values.

---

## 🏃‍♂️ How to Run

1. Make sure you have **PostgreSQL** installed.
2. Create a new database in your SQL client (e.g., pgAdmin, DBeaver).
3. Execute the table creation schemas.
4. Insert the provided sample data.
5. Run the queries from the `QUERY.sql` file to see the output!

---
*Crafted with ❤️ for modern database engineering.*
