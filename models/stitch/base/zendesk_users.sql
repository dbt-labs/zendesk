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
