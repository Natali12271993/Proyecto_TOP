{{ config(materialized='table') }}

with cliente as (
    select * from {{ ref('stg_cliente') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['id_cliente']) }} as sk_cliente,
    id_cliente,
    nombre,
    apellido,
    tipo_cliente,
    especie,
    ciudad
from cliente