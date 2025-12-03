Select 
    i.film_id,
    Sum(p.amount) As total_revenue
From sakila.payment p
Join sakila.rental r On p.rental_id = r.rental_id
Join sakila.inventory i On r.inventory_id = i.inventory_id
Group By i.film_id