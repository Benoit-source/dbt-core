with enrollments as (

    select * from {{ ref('stg_sap__enrollments') }}

),

customers as (

    select * from {{ ref('stg_sap__customers__v2') }}

),

customers_extended as (

    select * from {{ ref('int_customers_extended') }}

),

products as (

    select * from {{ ref('stg_sap__products') }}

),

locations as (

    select * from {{ ref('stg_sap__locations') }}

),

enrollemnts_joined_to_entities as (

    select
        enrollments.* exclude (customer_id, product_id, location_id),
        customers.*,
        customers_extended.* exclude (customer_id),
        products.*,
        locations.*
    from enrollments
    inner join customers on enrollments.customer_id = customers.customer_id
    left join customers_extended on customers.customer_id = customers_extended.customer_id
    inner join products on enrollments.product_id = products.product_id
    inner join locations on enrollments.location_id = locations.location_id

)

select * from enrollemnts_joined_to_entities