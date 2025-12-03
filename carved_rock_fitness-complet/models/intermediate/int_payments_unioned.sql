with cash_transactions as (

    select * from {{ ref('stg_point_of_sale__cash_transactions') }}

),

stripe_transactions as (

    select * from {{ ref('stg_stripe__billing_transactions') }}

),

transactions_unioned as (

    select * from cash_transactions

    union all

    select * from stripe_transactions

)

select * from transactions_unioned