{{ config(materialized='table') }}

With film_data As (
    Select film_id, title, rental_rate
    From sakila.film
)

Select * From film_data