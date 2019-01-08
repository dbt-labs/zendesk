<<<<<<< HEAD
with source as (

    select * from {{var('users_table')}}
    
),

renamed as (
    
    select
        
        --ids
        id as user_id,
        external_id,
        organization_id,
        
        --fields
        name,
        email,
        restricted_agent,
        role,
        suspended,
        
        --dates
        created_at,
        last_login_at,
        updated_at
        
    from source

)

select * from renamed
=======
select

    id,
    name,
    external_id,
    organization_id,
    email,
    phone,
    last_login_at,
    restricted_agent,
    role,
    suspended,
    created_at,
    updated_at
    
from {{var('users_table')}}
>>>>>>> f7c871205ec534bd751636052e91fd0f472bb03b
