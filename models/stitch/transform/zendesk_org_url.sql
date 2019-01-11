with tickets as (

  select * from {{ref('zendesk_tickets')}}

),

calculate as (

    select distinct
      {{ 
        dbt_utils.split_part(
          dbt_utils.split_part('api_url', "'//'", 2
          ), "'.zendesk.com'", 1
        ) 
      }} as org_url_identifier
    from tickets
    
)

select * from calculate
