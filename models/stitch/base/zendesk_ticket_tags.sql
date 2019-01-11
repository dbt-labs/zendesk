with source as (
    
    select * from {{var('ticket_tags_table')}}
    
),

renamed as (
    
    select 
    
        --ids
        {{dbt_utils.surrogate_key ('_sdc_level_0_id', '_sdc_source_key_id')}}
            as tag_id,
        _sdc_source_key_id as ticket_id,
            
        --fields
        nullif(lower(value), '') as ticket_tag_value
        
    from source
    
)

select * from renamed