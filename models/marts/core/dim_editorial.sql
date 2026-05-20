{{ config(materialized='table') }}

with editorial as (
    select * from {{ ref('stg_editorial') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['id_editorial']) }} as sk_editorial,
    id_editorial,
    nombre,
    telefono,
    contacto
from editorial