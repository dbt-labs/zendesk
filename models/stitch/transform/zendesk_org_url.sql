--this is a useful utility model that should return a single value: the url identifier of the customer's zendesk account.

with tickets as (

  select * from {{ref('zendesk_tickets')}}

)

select distinct
  {{ 
    dbt_utils.split_part(
      dbt_utils.split_part('api_url', "'//'", 2
      ), "'.zendesk.com'", 1
    ) 
  }} as org_url_identifier
from tickets
