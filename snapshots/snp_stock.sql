{% snapshot snp_stock %}

{{
    config(
        target_schema='SNAPSHOTS',
        target_database='DEV_PROYECTO_BRONZE',
        unique_key='id_stock',
        strategy='check',
        check_cols=['stock_actual', 'unidades_vendidas']
    )
}}

select
    id_stock,
    id_libro,
    stock_inicial,
    unidades_vendidas,
    stock_actual,
    fecha_actualizacion
from {{ source('libreria', 'stock') }}

{% endsnapshot %}