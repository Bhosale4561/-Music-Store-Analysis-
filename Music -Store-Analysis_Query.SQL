/*Q1.who is the most senior most employee based on job title?*/
-- hii nb 

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
/*Q5.Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money?*/

select c.customer_id,c.first_name, c.last_name, sum(invoice.total) as totals from customer as c
join invoice on c.customer_id = invoice.customer_id
group by c.customer_id
order by totals desc
limit 1

/*Q6.: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A?*/

SELECT DISTINCT email AS Email,first_name AS FirstName, last_name AS LastName, genre.name AS Name
FROM customer
JOIN invoice ON invoice.customer_id = customer.customer_id
JOIN invoiceline ON invoiceline.invoice_id = invoice.invoice_id
JOIN track ON track.track_id = invoiceline.track_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
ORDER BY email;

/*Q7: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands.*/
SELECT artist.artist_id, artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;
/*Q8: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first?*/
SELECT name,miliseconds
FROM track
WHERE miliseconds > (
	SELECT AVG(miliseconds) AS avg_track_length
	FROM track )
ORDER BY miliseconds DESC;


