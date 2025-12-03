with customers as (
    
    select * from {{ ref('stg_sap__customers') }}

),

STG_POINT_OF_SALE__CASH_TRANSACTIONS as (
    
    select *  from {{ ref('stg_point_of_sale__cash_transactions')}}

)

Select customers.* exclude(customer_id), STG_POINT_OF_SALE__CASH_TRANSACTIONS.* From STG_POINT_OF_SALE__CASH_TRANSACTIONS
Join customers On STG_POINT_OF_SALE__CASH_TRANSACTIONS.customer_id = customers.customer_id