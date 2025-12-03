with source as (
    
    select * from {{ source('carved_rock_fitness', 'customers') }}

),

columns_renamed as (

    select
        id as customer_id,
        first_name,
        last_name,
        email as email_address,
        try_cast(date_of_birth as date) as date_of_birth,
        state,
        signup_source,
        try_cast(created_at as timestamp) as customer_created_at
    from source

)

select * from columns_renamed
