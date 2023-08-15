Q1.who is the most senior most employee based on job title?

select * from employee
order by levels desc
limit 1

Q2.Which country have the most invoices?

select count(*) as c , billing_country from invoice
group by billing_country
order by c desc

Q3.What are the top 3 values of total invoices?

select total from invoice
order by total desc
limit 3

Q4. Which city has the best customers ? we would like to through a musical festival 
in the city we made the most money . write a query that returns one city that has the higest 
sum of invoices total return both the city name and sum of all invoices totals?

select sum(total) as totals,billing_city from invoice
group by billing_city
order by totals desc
