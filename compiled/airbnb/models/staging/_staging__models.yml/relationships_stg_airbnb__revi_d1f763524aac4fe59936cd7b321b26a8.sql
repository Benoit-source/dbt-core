
    
    

with child as (
    select listing_id as from_field
    from AIRBNB_BI.BI_BRONZE.stg_airbnb__review
    where listing_id is not null
),

parent as (
    select id as to_field
    from AIRBNB_BI.BI_BRONZE.stg_airbnb__listing
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


