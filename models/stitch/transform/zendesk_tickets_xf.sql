with tickets as (

  select * from {{ref('zendesk_tickets')}}

), 

url as (

  select * from {{ref('zendesk_org_url')}}

),

final as (

    select
        tickets.*,
        'https://' || url.org_url_identifier || '.zendesk.com/agent/tickets/' 
            || tickets.ticket_id::varchar as web_url
    from tickets
    inner join url 
        on 1 = 1
        
)

select * from final
