with source as (
    
    select * from {{ref('zendesk_ticket_events')}}

),

dates as (
    
{% set window_frame = "over (partition by ticket_id order by ticket_event_timestamp 
    rows between unbounded preceding and unbounded following)" %}

    select distinct
    
        ticket_id,
        
        min(case when status = 'new' then ticket_event_timestamp else null end) 
                {{window_frame}} as ticket_created,
                
        min(case when assignee_id is not null then ticket_event_timestamp else null end) 
                {{window_frame}} as ticket_first_assigned,
               
        min(case when status = 'solved' then ticket_event_timestamp else null end) 
                {{window_frame}} as ticket_first_solved,

        max(case when status = 'solved' then ticket_event_timestamp else null end) 
                {{window_frame}} as ticket_last_solved,        

        max(case when status = 'closed' then ticket_event_timestamp else null end) 
                {{window_frame}} as ticket_closed
            
    from source


)

select * from dates