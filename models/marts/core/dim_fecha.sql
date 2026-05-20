{{ config(materialized='table') }}

with fecha as (
    select * from {{ ref('stg_fecha') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['id_fecha']) }} as sk_fecha,
    id_fecha,
    fecha_completa                  as fecha_venta,
    anyo,
    mes,
    dia
from fecha