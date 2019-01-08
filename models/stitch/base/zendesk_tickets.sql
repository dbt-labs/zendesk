<<<<<<< HEAD
with source as (
    
    select * from {{var('tickets_table')}}
    
), 

renamed as (

    select
        --ids
        id as ticket_id,
        organization_id,
        assignee_id,
        brand_id,
        group_id,
        requester_id,
        submitter_id,
        
        --fields
        status,
        priority,
        subject,
        recipient,
        "type" as ticket_type,
        url as api_url,
        satisfaction_rating_score,
        
        --dates
        created_at,
        updated_at
        
    from source
    
)

select * from renamed
=======
select

    id,
    organization_id,
    assignee_id,
    brand_id,
    group_id,
    priority,
    subject,
    recipient,
    requester_id,
    status,
    submitter_id,
    "type",
    via__channel as channel,
    url as api_url,
    created_at,
    updated_at
    
from {{var('tickets_table')}}
>>>>>>> f7c871205ec534bd751636052e91fd0f472bb03b
