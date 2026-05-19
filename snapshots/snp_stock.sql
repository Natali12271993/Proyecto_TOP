{% snapshot snap_stock %}

{{
    config(
        target_database='DEV_PROYECTO_SILVER',
        target_schema='STAGING',
        unique_key='id_stock',
        strategy='check',
        check_cols=['stock_actual', 'unidades_vendidas', 'fecha_actualizacion']
       
    )
}}

select
    id_stock,
    id_libro,
    stock_inicial,
    unidades_vendidas,
    stock_actual,
    fecha_actualizacion
from {{ ref('stg_stock') }}

{% endsnapshot %}