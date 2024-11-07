{% snapshot sn_src_chattadata_311_service_requests %} 

{{
    config(
        target_schema='snapshots',  
        strategy='check',           
        unique_key='service_request_key',  
        check_cols=[                
            'created_date',
            'due_at',
            'completed_at',
            'on_time_indicator',
            'department',
            'request_type',
            'description',
            'request_type_code',
            'status_code',
            'intake_form',
            'actual_days_to_complete_working',
            'sla_fy_2019',
            'ispublic',
            'citydst',
            'publiclocation'
        ],
        updated_at='transmit_timestamp',     
        invalidate_hard_deletes=True         
    )
}}

select * from {{ ref('base_src_chattadata_311_service_requests') }}

{% endsnapshot %}