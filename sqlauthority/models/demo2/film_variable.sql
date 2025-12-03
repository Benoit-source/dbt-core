Select 
    film_id,
    title,
    rental_rate
From sakila.film
Where rental_rate = {{ var('rental_rate',6.99)}}