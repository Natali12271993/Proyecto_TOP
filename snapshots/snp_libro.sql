{% snapshot snp_libro %}

{{
    config(
        target_schema='SNAPSHOTS',
        target_database='DEV_PROYECTO_GOLD',
        unique_key='id_libro',
        strategy='check',
        check_cols=['precio']
    )
}}

select
    id_libro,
    id_editorial,
    titulo,
    autor,
    categoria,
    precio
from {{ source('libreria', 'libros') }}

{% endsnapshot %}