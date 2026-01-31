# sql_retail_sales_analysis
# Project Overview

This project demonstrates end-to-end SQL-based data analysis on a retail sales dataset using MySQL. The analysis includes:

Database creation

Data cleaning

Data exploration

Business-focused analytical queries

Time-based and customer-based insights

This project is suitable for beginner to intermediate SQL learners and can be used as a portfolio project for Data Analyst roles.

# Database & Table

Database: retail

Main Table: retail_sales

# Key Columns in Dataset:

transactions_id – Unique transaction ID

sale_date – Date of sale

sale_time – Time of sale

customer_id – Unique customer ID

gender – Customer gender

age – Customer age

category – Product category

quantiy – Quantity purchased

price_per_unit – Price per unit

cogs – Cost of goods sold

total_sale – Total sales value

# Data Cleaning Performed

The following steps were applied before analysis:

Created and selected the database

Renamed table to retail_sales

Fixed encoding issue in column name (ï»¿transactions_id → transactions_id)

Checked for NULL values across all important columns

Removed records containing NULL values

# Data Exploration

Basic exploratory queries include:

Total number of sales

Total number of customers

Number of unique customers

Number of unique product categories

List of distinct categories

# Key Business Analysis Performed
# Sample Analytical Questions Answered:

1. Retrieve all sales made on 2022-11-05

2. Find transactions where:

Category = Clothing

Quantity > 2

Month = November 2022

3. Calculate total sales per category

4. Find average age of customers who bought Beauty products

5. Retrieve all transactions where total_sale > 1000

6. Count transactions by gender per category

7. Identify best-selling month per year based on average sales

8. Find top 5 customers by total spending

9. Count unique customers per category

10. Categorize sales into shifts:

Morning (Before 12 PM)

Afternoon (12–5 PM)

Evening (After 5 PM)

# Tools Used

Database: MySQL

Query Language: SQL

# How to Run This Project

Create and use database:

CREATE DATABASE retail;

USE retail;


Import your dataset into MySQL

Run queries in the provided SQL file step by step

Analyze outputs and insights

# About

This project was created as part of a SQL Data Analysis Portfolio for demonstrating:

SQL proficiency

Data cleaning skills

Analytical thinking

Business insights from raw data
