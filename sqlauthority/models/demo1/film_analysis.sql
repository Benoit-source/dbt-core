Select 
    f.film_id,
    f.title,
    f.rental_rate,
    COALESCE(fr.total_revenue,0) As total_revenue,
    COALESCE(frental.total_rentals,0) As total_rentals
From sakila.film f
Left Join {{ ref('film_revenue') }} fr On f.film_id = fr.film_id
Left Join {{ ref('film_rentals') }} frental On f.film_id = frental.film_id