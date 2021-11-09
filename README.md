# DBS-Project
Fall 2021 - ITCS 6160 Database Systems project

# Project Introduction :
Coronavirus pandemic impacted the world to a great extent. Food delivery systems have become a crucial part of our daily lives. For universities such as UNCC, it is important to keep track of visitors and authorized personals who are on campus each day. This helps to reduce human contact and maintain social distancing. 	Students who act as food delivery agents can ensure that entry to unauthorized is strictly prohibited. They can earn extra bucks while studying on campus. CampusEats database proposes this model where students enroll to be food delivery agents. University staff and students are part of the database. Anyone can place an order at restaurants available near campus which are part of the database. Those who wish to place the order have to create an account and provide necessary details such as an address, email, and phone number. There are specific spots on campus where meals can be delivered. A list of all such locations is maintained in the database. Any person registered on the app can also be a driver. The driver needs to have a valid license and date of hire. A flat fee of $5 would be charged for each food delivery. 
The project intends to add a rating system to this model in which end-user can assign a rating to the restaurant, delivery person. There will be a facility to add the picture for the meal and some written feedback as well. This will provide insights into the nutrition and eating habits of those who order from campus. 

# Business Rules:
1. Valid type for end-users include: student, faculty, and staff
2. Only students can be drivers
3. A person can order food from one to many times
4. An individual delivery is tied to one and only one person for the order. 
5. The order is for one and only one restaurant
6. A restaurant will have one to many menu items.
7. An order can have at most one rating


Use Case for Ratings System

EERD: 

Data Dictionary:

Queries

# Stored Procedures and Functions
Please refer https://github.com/cruzhector/DBS-Project/tree/master/stored_procedures

Indexes

Future Work

(include folders for SQL code, pictures that are included in the repository, others as necessary)


