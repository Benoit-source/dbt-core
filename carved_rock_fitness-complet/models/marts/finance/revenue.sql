{{
    config(
        cluster_by = ['transaction_created_at'],
        partition_by = ['billed_month']
    )
}}

{{ print("Troubleshooting message from the revenue model.") }}

with payments as (

    select * from {{ ref('int_payments_unioned') }}

),

customers as (

    select * from {{ ref('stg_sap__customers__v2') }}

),

products as (

    select * from {{ ref('stg_sap__products') }}

),

locations as (

    select * from {{ ref('stg_sap__locations') }}

),

payments_joined_to_entities as (

    select
        payments.* exclude (customer_id, product_id, location_id),
        customers.*,
        products.*,
        locations.*
    from payments
    inner join customers on payments.customer_id = customers.customer_id
    inner join products on payments.product_id = products.product_id
    inner join locations on payments.location_id = locations.location_id

),

filtered_to_include_only_successful_payments as (

    select *
    from payments_joined_to_entities
    where payment_status = 'Paid'
)

select * from filtered_to_include_only_successful_payments