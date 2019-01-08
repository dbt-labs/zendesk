with tickets as (

    select * from {{ref('zendesk_tickets')}}

), 

url as (

    select * from {{ref('zendesk_org_url')}}

),

events as (

    select * from {{ref('zendesk_ticket_events_flattened')}}

),

organizations as (

    select * from {{ref('zendesk_organizations')}}

),

users as (
    
    select * from {{ ref('zendesk_users') }}

),

final as (

    select
        tickets.*,
        events.ticket_created,
        events.ticket_first_assigned,
        events.ticket_first_solved,
        events.ticket_last_solved,
        events.ticket_closed,
        organizations.name as organization_name,
        requesters.email as requester_email,
        assignees.email as assignee_email,
        'https://' || url.org_url_identifier || '.zendesk.com/agent/tickets/' 
            || tickets.ticket_id::varchar as web_url
    from tickets
    left join events 
        on events.ticket_id = tickets.ticket_id
    left join organizations 
        on organizations.organization_id = tickets.organization_id
    left join users as requesters
        on requesters.user_id = tickets.requester_id
    left join users as assignees
        on assignees.user_id = tickets.assignee_id
    inner join url 
        on 1 = 1
        
)

select * from final
