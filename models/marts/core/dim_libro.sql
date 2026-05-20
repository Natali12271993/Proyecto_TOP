{{ config(materialized='table') }}

with libro as (
    select * from {{ ref('stg_libro') }}
),

editorial as (
    select * from {{ ref('stg_editorial') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['l.id_libro']) }} as sk_libro,
    l.id_libro,
    l.id_editorial,
    l.titulo,
    l.autor,
    l.precio
from libro l
left join editorial e on l.id_editorial = e.id_editorial