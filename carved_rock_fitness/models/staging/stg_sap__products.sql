with source as (
    select * from {{ source('carved_rock_fitness', 'products') }}
),

columns_renamed as (

    select
        id as product_id,
        name as product_name,
        monthly_cost_usd,
        access_level,
        max_classes_per_month,
        is_family_plan,
        is_active
    from source

),

type_casts_applied as (

    select
        product_id,
        product_name,
        try_cast(monthly_cost_usd as decimal(5, 2)) as monthly_cost_usd,
        access_level,
        try_cast(max_classes_per_month as int) as max_classes_per_month,
        try_cast(is_family_plan as boolean) as is_family_plan,
        try_cast(is_active as boolean) as is_active
    from columns_renamed

)

select * from type_casts_applied
