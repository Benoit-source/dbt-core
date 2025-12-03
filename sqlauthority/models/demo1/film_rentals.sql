Select 
    i.film_id,
    Count(*) As total_rentals
From sakila.rental r
Join sakila.inventory i On r.inventory_id = i.inventory_id
Group By i.film_id