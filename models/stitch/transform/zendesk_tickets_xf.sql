with tickets as (

    select * from {{ref('zendesk_tickets')}}

), 

url as (

    select * from {{ref('zendesk_org_url')}}

),

metrics as (

    select * from {{ref('zendesk_ticket_metrics')}}

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
        metrics.created_at as ticket_created,
        metrics.initially_assigned_at,
        metrics.solved_at,
        metrics.reopens,
        metrics.replies,
        metrics.first_resolution_time_in_minutes_business,
        metrics.first_resolution_time_in_minutes_calendar,
        metrics.full_resolution_time_in_minutes_business,
        metrics.full_resolution_time_in_minutes_calendar,
        metrics.on_hold_time_in_minutes_business,
        metrics.on_hold_time_in_minutes_calendar,
        metrics.reply_time_in_minutes_business,
        metrics.reply_time_in_minutes__calendar,
        metrics.requester_wait_time_in_minutes_business,
        metrics.requester_wait_time_in_minutes_calendar,
        
        organizations.name as organization_name,
        requesters.email as requester_email,
        assignees.email as assignee_email,
        'https://' || url.org_url_identifier || '.zendesk.com/agent/tickets/' 
            || tickets.ticket_id::varchar as web_url
    from tickets
    left join metrics 
        on metrics.ticket_id = tickets.ticket_id
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
