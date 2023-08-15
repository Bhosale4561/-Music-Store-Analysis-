/*Q1.who is the most senior most employee based on job title?*/

select * from employee
order by levels desc
limit 1

/*Q2.Which country have the most invoices?*/

select count(*) as c , billing_country from invoice
group by billing_country
order by c desc

/*Q3.What are the top 3 values of total invoices?*/

select total from invoice
order by total desc
limit 3

/*Q4. Which city has the best customers ? we would like to through a musical festival 
in the city we made the most money . write a query that returns one city that has the higest 
sum of invoices total return both the city name and sum of all invoices totals?*/

select sum(total) as totals,billing_city from invoice
group by billing_city
order by totals desc
/*Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money?*/

select c.customer_id,c.first_name, c.last_name, sum(invoice.total) as totals from customer as c
join invoice on c.customer_id = invoice.customer_id
group by c.customer_id
order by totals desc
limit 1
