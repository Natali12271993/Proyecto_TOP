{% snapshot snap_cliente %}

{{
    config(
        target_database='DEV_PROYECTO_GOLD',
        target_schema='SNAPSHOTS',
        unique_key='id_cliente',
        strategy='check',
        check_cols=['ciudad', 'direccion']
    )
}}

select
    id_cliente,
    nombre,
    apellido,
    ciudad,
    direccion,
    email
from {{ ref('stg_cliente') }}

{% endsnapshot %}