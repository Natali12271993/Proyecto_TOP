{% snapshot snp_stock %}

{{
    config(
        target_schema='SNAPSHOTS',
        target_database='DEV_PROYECTO_GOLD',
        unique_key='id_stock',
        strategy='check',
        check_cols=['stock_actual']
    )
}}

select
    id_stock,
    id_libro,
    id_libreria,
    stock_inicial,
    unidades_vendidas,
    stock_actual,
    fecha_actualizacion
from {{ source('libreria', 'stock') }}

{% endsnapshot %}