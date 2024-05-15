{% snapshot sp_employee %}

{{
    config(
        target_schema='snapshots',
        unique_key='employee_id',
        strategy='check',
        check_cols=['job_title', 'marital_status', 'vacation_hours', 'sick_leave_hours', 'salaried_flag']
    )
}}

select
    *
from {{ ref('stg_employee') }}

{% endsnapshot %}