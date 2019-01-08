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