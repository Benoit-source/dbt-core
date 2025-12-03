{{ config(materialized='table') }}

Select film_id, title, rental_rate
From sakila.film