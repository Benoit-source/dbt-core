with source as (

    select * from {{ source('carved_rock_fitness', 'billing_transactions') }}

),

columns_renamed as (

    select
        id as transaction_id,
        customer_id,
        membership_id as product_id,
        location_id,
        billed_month as billed_year_month,
        cast(split(billed_year_month, '-')[0] as int) as billed_year,
        cast(split(billed_year_month, '-')[1] as int) as billed_month,
        amount_usd,
        status as payment_status,
        created_at as transaction_created_at
    from source

)

select * from columns_renamed