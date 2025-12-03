with source as (
    
    select * from {{ source('carved_rock_fitness', 'locations') }}

),

columns_renamed as (

    select
        id as location_id,
        name as location_name,
        try_cast(opened_at as date) as date_opened,
        try_cast(tax_rate as decimal(5, 2)) as tax_rate
    from source

)

select * from columns_renamed
