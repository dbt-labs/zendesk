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

final as (

    select
        tickets.*,
        events.ticket_created,
        events.ticket_first_assigned,
        events.ticket_first_solved,
        events.ticket_last_solved,
        events.ticket_closed,
        organizations.name as organization_name,
        'https://' || url.org_url_identifier || '.zendesk.com/agent/tickets/' 
            || tickets.ticket_id::varchar as web_url
    from tickets
    left join events 
        on events.ticket_id = tickets.ticket_id
    left join organizations 
        on organizations.organization_id = tickets.organization_id
    inner join url 
        on 1 = 1
        
)

select * from final
