with source as (
    
    select * from {{var('ticket_metrics_table')}}
    
),

renamed as (
    
    select 
    
        --ids
        id,
        ticket_id,
            
        --fields
        agent_wait_time_in_minutes__business 
            as agent_wait_time_in_minutes_business,
        agent_wait_time_in_minutes__calendar 
            as agent_wait_time_in_minutes_calendar,
        first_resolution_time_in_minutes__business 
            as first_resolution_time_in_minutes_business,
        first_resolution_time_in_minutes__calendar 
            as first_resolution_time_in_minutes_calendar,
        full_resolution_time_in_minutes__business 
            as full_resolution_time_in_minutes_business,
        full_resolution_time_in_minutes__calendar 
            as full_resolution_time_in_minutes_calendar,
        on_hold_time_in_minutes__business as on_hold_time_in_minutes_business,
        on_hold_time_in_minutes__calendar as on_hold_time_in_minutes_calendar,
        reopens,
        replies,
        reply_time_in_minutes__business as reply_time_in_minutes_business,
        reply_time_in_minutes__calendar as reply_time_in_minutes_calendar,
        requester_wait_time_in_minutes__business 
            as requester_wait_time_in_minutes_business,
        requester_wait_time_in_minutes__calendar 
            as requester_wait_time_in_minutes_calendar,
        
        --dates
        created_at,
        assigned_at as latest_assigned_at,
        initially_assigned_at,
        latest_comment_added_at,
        solved_at,
        updated_at     
        
    from source
    
)

select * from renamed