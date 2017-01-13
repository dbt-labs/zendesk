--adds a useful utility field, web_url. this is useful to provide a link to the ticket from within a report.

with tickets as (

  select * from {{ref('zendesk_tickets')}}

), url as (

  select * from {{ref('zendesk_org_url')}}

)

select
  tickets.*,
  'https://' || url.org_url_identifier || '.zendesk.com/agent/tickets/' || tickets.id::varchar as web_url
from tickets
  inner join url on 1 = 1
