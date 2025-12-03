with source as (
    
    select * from {{ source('carved_rock_fitness', 'enrollments') }}

),

columns_renamed as (

    select
        id as enrollment_id,
        customer_id,
        membership_id as product_id,
        location_id,
        try_cast(enrolled_at as timestamp) as enrolled_at,
        try_cast(cancelled_at as timestamp) as cancelled_at,
        try_cast(is_active as boolean) as is_active
    from source

)

select * from columns_renamed
