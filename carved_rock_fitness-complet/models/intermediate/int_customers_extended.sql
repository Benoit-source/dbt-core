{{
    config(
        materialized='ephemeral'
    )
}}

with customers as (
    select * from {{ ref('stg_sap__customers__v2') }}
),

first_payment as (
    select
        customer_id,
        min(transaction_created_at) as first_payment_date
    from {{ ref('int_payments_unioned') }}
    group by customer_id
),

current_date_context as (
    select current_date as today
),

customers_extended as (
    select
        customers.customer_id,
        floor(months_between(current_date_context.today, customers.date_of_birth)/12) AS age,
        first_payment.first_payment_date,
        datediff('day', first_payment.first_payment_date, current_date_context.today) as tenure_days
    from customers
    left join first_payment on customers.customer_id = first_payment.customer_id
    cross join current_date_context
)

select * from customers_extended
