with source as (
    
    select * from {{var('ticket_events_table')}}
    
),

renamed as (
    
{% set window_frame = "over (partition by ticket_event_id 
order by id rows between unbounded preceding and unbounded following)" %}
    
    select distinct
    
        --ids
        ticket_event_id,
        ticket_id,
        first_value(requester_id ignore nulls) {{window_frame}} as requester_id,
        first_value(assignee_id ignore nulls) {{window_frame}} as assignee_id,
            
        --fields
        first_value(status ignore nulls) {{window_frame}} as status,
        ticket_event_via,
        first_value(event_type ignore nulls) {{window_frame}} as event_type,
        
        --dates
        timestamp as ticket_event_timestamp        
        
    from source
    --comment seems to always kick off a new alteration
    where event_type != 'Comment' or event_type is null
    
)

select * from renamed