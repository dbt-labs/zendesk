<<<<<<< HEAD
with source as (
    
    select * from {{var('organizations_table')}}
    
),

renamed as (
    
    select
        
        --ids
        id as organization_id,
        
        --fields
        name,
        
        --dates
        created_at,
        updated_at
        
    from source
    
)

select * from renamed
=======
select

    id,
    external_id,
    name,
    case when deleted_at is not null then true else false end as deleted,
    created_at,
    updated_at,
    deleted_at
    
from {{var('organizations_table')}}
>>>>>>> f7c871205ec534bd751636052e91fd0f472bb03b
